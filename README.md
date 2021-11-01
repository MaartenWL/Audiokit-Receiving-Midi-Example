# Audiokit-Receiving-Midi-Example
example project for research: why does receiving midi over bluetooth work, while received MIDI from USB seems broken?

Receiving MIDI with a bluetooth connection, or USB connection should work equal. In Audiokit 4 it did.
But somewhere functionality is broken. 
When connected over USB, incomming MIDI data is triggering audiokit logging messages, but my midilistener class is not called.
When connected with bluetooth, incomming MIDI data is triggering audiokit logging messages, and my midilistener class is called as expected.

To show this, i made a simple app for receiving midi data. the midilistener functions only create console messages to show when they are triggered.


# My test
Below I included the console message which are showing up while sending program change messages:
This test is done with a Virus TI synthesizer sending program change messages. The test app is run on an iPad running IOS 13. 
Test 1:  bluetooth connection
test 2:  USB connection

## Test 1 - MIDI over bluetooth
First it is connected to the Virus with Yamaha wireless MIDI (Bluetooth) Adapter (MD-BT01) 
the Xcode console shows the following output:
```
2021-10-22 22:11:33.812018+0200 Audiokit Sysex test[663:74051] [midi] MIDI+Receiving.swift:processUMPSysExMessage(with:):238:UMP SYSEX - Start receiving UMP SysEx messages (MIDI+Receiving.swift:processUMPSysExMessage(with:):238)
2021-10-22 22:11:33.812694+0200 Audiokit Sysex test[663:74051] [midi] MIDI.swift:init():52:Initializing MIDI (MIDI.swift:init():52)
2021-10-22 22:11:33.821170+0200 Audiokit Sysex test[663:74051] [midi] MIDI+Receiving.swift:processUMPSysExMessage(with:):246:UMP SYSEX - Continue receiving UMP SysEx messages (MIDI+Receiving.swift:processUMPSysExMessage(with:):246)
2021-10-22 22:11:33.822934+0200 Audiokit Sysex test[663:74051] [midi] MIDI+Receiving.swift:processUMPSysExMessage(with:):246:UMP SYSEX - Continue receiving UMP SysEx messages (MIDI+Receiving.swift:processUMPSysExMessage(with:):246)
2021-10-22 22:11:33.823341+0200 Audiokit Sysex test[663:74051] [midi] MIDI+Receiving.swift:processUMPSysExMessage(with:):252:UMP SYSEX - End of UMP SysEx messages (MIDI+Receiving.swift:processUMPSysExMessage(with:):252)
receivedMIDISystemCommand
[240, 0, 32, 51, 1, 16, 115, 64, 16, 0, 247]
receivedMIDISystemCommand
[240, 0, 32, 51, 1, 16, 115, 64, 16, 0, 247]
2021-10-22 22:11:33.868306+0200 Audiokit Sysex test[663:74051] [midi] MIDI+Receiving.swift:processUMPSysExMessage(with:):238:UMP SYSEX - Start receiving UMP SysEx messages (MIDI+Receiving.swift:processUMPSysExMessage(with:):238)
2021-10-22 22:11:33.868779+0200 Audiokit Sysex test[663:74051] [midi] MIDI+Receiving.swift:processUMPSysExMessage(with:):246:UMP SYSEX - Continue receiving UMP SysEx messages (MIDI+Receiving.swift:processUMPSysExMessage(with:):246)
2021-10-22 22:11:33.869182+0200 Audiokit Sysex test[663:74051] [midi] MIDI+Receiving.swift:processUMPSysExMessage(with:):252:UMP SYSEX - End of UMP SysEx messages (MIDI+Receiving.swift:processUMPSysExMessage(with:):252)
receivedMIDISystemCommand
[240, 0, 32, 51, 1, 16, 115, 64, 1, 0, 247]
receivedMIDISystemCommand
[240, 0, 32, 51, 1, 16, 115, 64, 1, 0, 247]
```


# Test 2 - MIDI over USB
Second it is connected to the Virus with Roland MIDI to USB (UM-ONE) and Apple camera adapter 

```
2021-10-22 22:15:43.579915+0200 Audiokit Sysex test[665:75245] [midi] MIDI+Receiving.swift:processUMPSysExMessage(with:):246:UMP SYSEX - Continue receiving UMP SysEx messages (MIDI+Receiving.swift:processUMPSysExMessage(with:):246)
2021-10-22 22:15:43.580249+0200 Audiokit Sysex test[665:75245] [midi] MIDI.swift:init():52:Initializing MIDI (MIDI.swift:init():52)
2021-10-22 22:15:43.584815+0200 Audiokit Sysex test[665:75245] [midi] MIDI+Receiving.swift:processUMPSysExMessage(with:):246:UMP SYSEX - Continue receiving UMP SysEx messages (MIDI+Receiving.swift:processUMPSysExMessage(with:):246)
2021-10-22 22:15:43.585062+0200 Audiokit Sysex test[665:75245] [midi] MIDI+Receiving.swift:processUMPSysExMessage(with:):252:UMP SYSEX - End of UMP SysEx messages (MIDI+Receiving.swift:processUMPSysExMessage(with:):252)
```

As you see, there are only logging messages from audiokit itself, but my midilistener functions are not triggered.
