# avaudioengine-voiceprocessing-samplerate-problem
AVAudioEngine ends up in unusual state after enabling and disabling voice processing

## Steps to reproduce

1. App started with Bluetooth headphones (e.g. Airpods 1) connected in HFP mode
2. Audio Session set to PlayAndRecord mode and activated
3. New AVAudioEngine created with voice processing DISABLED. Check sample rates of input and output nodes.
4. AVAudioEngine never started, it is disposed immediately
5. Headphones disconnected, switched to device's built-in speaker
6. New AVAudioEngine created with voice processing ENABLED.
7. AVAudioEngine never started, it is disposed immediately
8. Bluetooth headphones reconnected in HFP mode
9. New AVAudioEngine created with voice processing DISABLED. Check sample rates of input and output nodes.

Expected result: sample rates in step 9 should match sample rates in step 3

Actual results: input sample rates are different