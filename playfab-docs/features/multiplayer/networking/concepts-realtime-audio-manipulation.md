---
title: Using real-time audio manipulation to apply custom voice effects
description: Information on how PlayFab Party voice chat audio can be modified in real time.
author: tomcoMSFT
ms.author: tomco
ms.date: 2/12/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking
---

# Using real-time audio manipulation to apply custom voice effects
PlayFab Party is a real-time networking and voice chat solution. When configured for voice chat, PlayFab Party transmits microphone audio and plays it back unmodified. Some games need access to the voice chat audio buffers to implement custom audio effects, such as spatial audio or voice filters. This document provides a walkthrough of how to use the real-time audio manipulation feature to intercept and modify voice chat audio in PlayFab Party.

## Prerequisites

This walkthrough assumes you have basic familiarity with [voice chat in PlayFab Party](concepts-chat.md).

## Platform support

Real-time audio manipulation isn't available on all platforms. While the methods associated with real-time audio manipulation are present in the unified, cross-platform header, they're currently only implemented for Windows, Xbox, and PlayStation® 5. The methods will return errors on other platforms.

## Audio streams

Real-time audio manipulation introduces the concept of audio streams for retrieving audio from or submitting audio to the library. There are two types of audio streams. The first is the **source stream**. A source stream is used to retrieve audio from a chat control. Each chat control can only have a single source stream, called the **voice stream**. For a local chat control, this is used to retrieve the microphone input; for a remote chat control, this is used to retrieve incoming voice audio. If the voice stream exists for a chat control, the library will redirect source audio for that chat control to its voice stream rather than handling the audio automatically. For a local chat control, this means redirecting microphone audio to the voice stream instead of automatically encoding and transmitting it; for a remote chat control, this means redirecting incoming voice audio to the voice stream instead of automatically submitting it to each local chat control to be played back. Source streams are represented by the [`PartyAudioManipulationSourceStream`](reference/classes/PartyAudioManipulationSourceStream/partyaudiomanipulationsourcestream.md).

The second type of stream is the **sink stream**. A sink stream is used to submit audio to a chat control. Only local chat controls can have sink streams, and they each can have two. They're called the **capture stream** and **render stream**. If the capture stream exists for a chat control, the library will pull audio from the capture stream to encode and transmit to other chat controls instead of the microphone. If the render stream exists for a chat control, the library will pull audio from the render stream and play it back *in addition* to the voice chat audio that is automatically played back from remote chat controls. Audio submitted to the capture stream is used as the local chat control's microphone input; audio submitted to the render stream is played back or "rendered" to the local chat control's audio output device. Sink streams are represented by the [`PartyAudioManipulationSinkStream`](reference/classes/PartyAudioManipulationSinkStream/partyaudiomanipulationsinkstream.md).

### Configuring audio streams

By default, the library handles audio retrieval, transport, and playback. Therefore, chat controls are created without any audio streams. You can create one or more streams for a chat control via the stream configuration methods - [`PartyLocalChatControl::ConfigureAudioManipulationCaptureStream()`](reference/classes/PartyLocalChatControl/methods/partylocalchatcontrol_configureaudiomanipulationcapturestream.md), [`PartyLocalChatControl::ConfigureAudioManipulationRenderStream()`](reference/classes/PartyLocalChatControl/methods/partylocalchatcontrol_configureaudiomanipulationrenderstream.md), and [`PartyChatControl::ConfigureAudioManipulationVoiceStream()`](reference/classes/PartyChatControl/methods/partychatcontrol_configureaudiomanipulationvoicestream.md). Once configured, a stream can subsequently be retrieved via [`PartyLocalChatControl::GetAudioManipulationCaptureStream()`](reference/classes/PartyLocalChatControl/methods/partylocalchatcontrol_getaudiomanipulationcapturestream.md), [`PartyLocalChatControl::GetAudioManipulationRenderStream()`](reference/classes/PartyLocalChatControl/methods/partylocalchatcontrol_getaudiomanipulationrenderstream.md), and [`PartyChatControl::GetAudioManipulationVoiceStream()`](reference/classes/PartyChatControl/methods/partychatcontrol_getaudiomanipulationvoicestream.md)

Each stream configuration method allows you to specify the format of the audio that you will retrieve from or submit to the stream. For more information about supported formats, see the reference documentation for each stream configuration method.

### Retrieving audio from a source stream

You can retrieve audio from a source stream via [`PartyAudioManipulationSourceStream::GetNextBuffer()`](reference/classes/PartyAudioManipulationSourceStream/methods/partyaudiomanipulationsourcestream_getnextbuffer.md). When voice activity is detected, a new buffer will be available approximately every 40 ms. If no buffers are available, the call will succeed and provide a zero length buffer. The total number of buffers instantaneously available can be retrieved via [`PartyAudioManipulationSourceStream::GetAvailableBufferCount()`](reference/classes/PartyAudioManipulationSourceStream/methods/partyaudiomanipulationsourcestream_getavailablebuffercount.md).

For efficiency, `GetNextBuffer()` provides a buffer that points to the library's memory instead of copying the entire buffer. It can optionally be modified in place. Once you're done processing a buffer, you should release it via [`PartyAudioManipulationSourceStream::ReturnBuffer()`](reference/classes/PartyAudioManipulationSourceStream/methods/partyaudiomanipulationsourcestream_returnbuffer.md) so that the library can reclaim its memory. Multiple buffers can be retrieved before any are returned, and buffers don't need to be returned in the order they were retrieved.

### Submit audio to a sink stream

You can submit audio to a sink stream via [`PartyAudioManipulationSinkStream::SubmitBuffer()`](reference/classes/PartyAudioManipulationSinkStream/methods/partyaudiomanipulationsinkstream_submitbuffer.md). The buffer is copied by the library and can be immediately freed after the call completes.

Every 40 ms, the library consumes 40 ms of audio that has been submitted to the sink stream. To prevent audio hiccups, audio should be submitted at a constant rate.

## Scenarios

### Microphone audio manipulation a.k.a. pre-encode buffer manipulation

Microphone audio manipulation is the act of intercepting and changing the microphone audio before it's transmitted to other chat controls. This is sometimes called "pre-encode buffer manipulation" because the microphone audio is modified before it's encoded and transmitted to other chat controls. If you wish to implement this scenario for a local chat control, first configure a voice stream and capture stream for the local chat control. Once configured, a function called by each tick of a dedicated audio thread to process the microphone audio of that single chat control might look like the following.

``` cpp
// An app-defined function that takes a microphone buffer and generates a new
// buffer that should be transmitted to other chat controls.
std::vector<uint8_t>
ProcessLocalVoiceBuffer(
    PartyMutableDataBuffer* inputBuffer
    );

void
ProcessLocalMicrophoneAudioForSingleChatControl(
    PartyLocalChatControl* chatControl
    )
{
    // Get the voice stream from which we want to retrieve audio. This provides
    // the audio generated by the chat control's input device.
    PartyAudioManipulationSourceStream* voiceStream;
    RETURN_VOID_IF_FAILED(chatControl->GetAudioManipulationVoiceStream(&voiceStream));

    // Get the capture stream to which we want to submit audio. This is used to
    // submit audio that will be transmitted to other chat controls.
    PartyAudioManipulationSinkStream* captureStream;
    RETURN_VOID_IF_FAILED(chatControl->GetAudioManipulationCaptureStream(&captureStream));

    // Get the next audio buffer from the voice stream.
    PartyMutableDataBuffer buffer;
    RETURN_VOID_IF_FAILED(voiceStream->GetNextBuffer(&buffer));

    // If we retrieved a buffer, process it.
    if (buffer.bufferByteCount > 0)
    {
        // Use the buffer we retrieved to generate a new buffer that will be
        // treated as the "real" capture input and transmitted to other chat
        // controls.
        std::vector<uint8_t> processedBuffer = ProcessLocalVoiceBuffer(&buffer);

        // Convert the buffer to a Party type.
        PartyDataBuffer partyBuffer;
        partyBuffer.bufferByteCount = static_cast<uint32_t>(processedBuffer.size());
        partyBuffer.buffer = processedBuffer.data();

        // Submit the processed buffer to the capture stream.
        PartyError error = captureStream->SubmitBuffer(&partyBuffer);
        if (PARTY_FAILED(error))
        {
            printf("Failed to submit buffer to sink stream! error = 0x%08x", error);
        }

        // Return the original buffer back to the voice stream.
        error = voiceStream->ReturnBuffer(buffer.buffer);
        if (PARTY_FAILED(error))
        {
            printf("Failed to return buffer to source stream! error = 0x%08x", error);
        }
    }
}
```

### Remote audio manipulation a.k.a. post-decode buffer manipulation

Remote audio manipulation is the act of intercepting and changing incoming audio before it's rendered to each local chat control. This is sometimes called "post-decode buffer manipulation" because the incoming audio is modified after it's decoded but before it's rendered. If you wish to implement this scenario, first configure the voice stream for each remote chat control and the render stream for each local chat control. Then, each tick of your audio thread should pull audio from each voice stream, mix the audio into a single stream while optionally applying effects, and submit the mixed buffer to each render stream. Depending on your game scenario, you might need to mix the buffers into different streams for each local chat control. A function called by each tick of a dedicated audio thread to process the incoming voice audio might look like the following.

```cpp
// This is an app-defined function that takes a local chat control and list of remote voice buffers and generates
// a single mixed buffer to submit to the local chat control's audio output.
std::vector<uint8_t>
GetOutputMixBuffer(
    PartyLocalChatControl& localChatControl,
    const std::map<PartyAudioManipulationSourceStream*, PartyMutableDataBuffer>& remoteVoiceBuffers
    );

void
ProcessRemoteVoiceAudio(
    const std::vector<PartyChatControl*>& remoteChatControls,
    const std::vector<PartyLocalChatControl*>& localChatControls
    )
{
    std::map<PartyAudioManipulationSourceStream*, PartyMutableDataBuffer> remoteVoiceBuffers;

    // Acquire voice buffers from each remote chat control.
    for (auto remoteChatControl : remoteChatControls)
    {
        // Get the voice stream for this chat control from which we will retrieve audio.
        PartyAudioManipulationSourceStream* voiceStream;
        PartyError error = remoteChatControl->GetAudioManipulationVoiceStream(&voiceStream);
        if (PARTY_FAILED(error))
        {
            printf("Failed to get voice stream! error = 0x%08x", error);
            continue;
        }

        // Get the next audio buffer from the voice stream.
        PartyMutableDataBuffer buffer;
        error = voiceStream->GetNextBuffer(&buffer);
        if (PARTY_FAILED(error))
        {
            printf("Failed to get next buffer! error = 0x%08x", error);
            continue;
        }

        // If we retrieved a buffer, cache it in the map for mixing.
        if (buffer.bufferByteCount > 0)
        {
            remoteVoiceBuffers[voiceStream] = buffer;
        }
    }

    // If we didn't acquire any source buffers, we don't have anything to mix.
    if (remoteVoiceBuffers.empty())
    {
        return;
    }

    // Mix the voice buffers and submit to each render stream.
    for (auto localChatControl : localChatControls)
    {
        // Get the render stream for this chat control to which we will submit audio.
        PartyAudioManipulationSinkStream* renderStream;
        PartyError error = localChatControl->GetAudioManipulationRenderStream(&renderStream);
        if (PARTY_FAILED(error))
        {
            printf("Failed to get render stream! error = 0x%08x", error);
            continue;
        }

        // Mix the buffers the buffers to generate a new, mixed buffer.
        std::vector<uint8_t> mixedBuffer = GetOutputMixBuffer(*localChatControl, remoteVoiceBuffers);

        // Convert the buffer to a party type.
        PartyDataBuffer partyBuffer;
        partyBuffer.bufferByteCount = static_cast<uint32_t>(mixedBuffer.size());
        partyBuffer.buffer = mixedBuffer.data();

        // Submit the mixed buffer to the render stream.
        error = renderStream->SubmitBuffer(&partyBuffer);
        if (PARTY_FAILED(error))
        {
            printf("Failed to submit buffer to render stream! error = 0x%08x", error);
        }
    }

    // Release the voice buffers.
    for (auto voiceBuffer : remoteVoiceBuffers)
    {
        // Return the voice buffer that we had cached from this voice stream.
        PartyError error = voiceBuffer.first->ReturnBuffer(voiceBuffer.second.buffer);
        if (PARTY_FAILED(error))
        {
            printf("Failed to return buffer! error = 0x%08x", error);
        }
    }
}
```

#### Privacy and mixing considerations

The library will provide audio through a remote chat control's voice stream as long as the remote chat control is generating audio and [chat permission](concepts-chat-permissions-and-muting.md#chat-permissions) and [mute](concepts-chat-permissions-and-muting.md#muting) configurations allow the audio to be played back by at least one local chat control. If the audio should be played for one local chat control but not another, you must omit it from the audio mix for the latter chat control.

#### Chat indicator considerations

Configuring a voice stream for a remote chat control won't impact its [chat indicator](concepts-audio-troubleshooting.md#check-the-chat-indicators). You may need to implement logic to reconciliate differences between the chat indicator and your mixing logic to choose the right UI indicator. For instance, the chat indicator may indicate that the chat control is talking but custom mixing logic may choose to drop the audio.

### Mixed scenarios

In some scenarios, you might want to enable audio manipulation for some chat controls but not others. For instance, maybe you want to apply effects to opposition players encountered during a game match but not to players on the same team. In such a scenario, you can follow the steps previously outlined for remote audio manipulation while only configuring a voice stream for the chat controls to which you want to apply audio effects. The audio of the remaining remote chat controls will automatically be rendered to the local chat controls, as long as mute and permission configurations allow it. 
