//
//  ViewController.swift
//  Audiokit Sysex test
//
//  Created by M. Lierop on 18/06/2021.
//

import UIKit
import AudioKit
import CoreMIDI

var midi = MIDI() //Manager.midi

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var TxTField: UITextView!
    @IBOutlet weak var MidiTable: UITableView!
    @IBOutlet weak var BlueToothBtn: BluetoothMIDIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // MIDIOutputTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        print("just starting up!!")
        self.BlueToothBtn.centerPopupIn(view: self.view )
        
        midi.openInput()
        midi.openOutput()
        midi.addListener(self)
    }

    
    
    //*****************************************************************
    // MARK: - functions for presets table
    //*****************************************************************
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

     
            print("+++++++++++++++++++++")
            print("output targets.count ", midi.inputInfos.count)
            print(midi.inputInfos)
            print("+++++++++++++++++++++")
            print("+++++++++++++++++++++")
            
            return midi.inputInfos.count
            
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell?)!

        
            // selecteren van huidige connectie werkt niet echt, maar moet wel
//            if( app.getMIDIInputUID() == midi.inputInfos[indexPath.row].midiUniqueID ){
//                cell = (tableView.dequeueReusableCell(withIdentifier: "CellSelected") as UITableViewCell?)!
//                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
//            }
           
            cell.textLabel?.text =  midi.inputInfos[indexPath.row].displayName
            cell.detailTextLabel?.text = midi.inputInfos[indexPath.row].manufacturer
 
            
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        midi.closeAllInputs()
        midi.closeOutput()
        
        midi.openInput(uid: midi.inputInfos[indexPath.row].midiUniqueID)
        midi.openOutput(uid: midi.destinationInfos[indexPath.row].midiUniqueID)
        midi.addListener(self)
        tableView.reloadData()
    }


}




extension ViewController: MIDIListener {
    func receivedMIDINoteOn(noteNumber: MIDINoteNumber, velocity: MIDIVelocity, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        print("receivedMIDINoteOn")
    }
    
    func receivedMIDINoteOff(noteNumber: MIDINoteNumber, velocity: MIDIVelocity, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        print("receivedMIDINoteOff")
    }
    
    func receivedMIDIController(_ controller: MIDIByte, value: MIDIByte, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        print("receivedMIDIController")
    }
    
    func receivedMIDIAftertouch(noteNumber: MIDINoteNumber, pressure: MIDIByte, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        print("receivedMIDIAftertouch")
    }
    
    func receivedMIDIAftertouch(_ pressure: MIDIByte, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        print("receivedMIDIAftertouch")
    }
    
    func receivedMIDIPitchWheel(_ pitchWheelValue: MIDIWord, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        print("receivedMIDIPitchWheel")
    }
    
    func receivedMIDIProgramChange(_ program: MIDIByte, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        print("receivedMIDIProgramChange")
    }
    
    func receivedMIDISystemCommand(_ data: [MIDIByte], portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
        print("receivedMIDISystemCommand")
        print(data)
    }
    
    func receivedMIDISetupChange() {
        print("receivedMIDISetupChange")
    }
    
    func receivedMIDIPropertyChange(propertyChangeInfo: MIDIObjectPropertyChangeNotification) {
        print("receivedMIDIPropertyChange")
    }
    
    func receivedMIDINotification(notification: MIDINotification) {
        print("receivedMIDINotification")
    }
    
    
   

}




//func receivedMIDINoteOn(noteNumber: MIDINoteNumber, velocity: MIDIVelocity, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
//    TxTField.text = "receivedMIDINoteOn"
//    print("receivedMIDINoteOn")
//}
//
//func receivedMIDINoteOff(noteNumber: MIDINoteNumber, velocity: MIDIVelocity, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
//    TxTField.text = "receivedMIDINoteOff"
//    print("receivedMIDINoteOff")
//}
//
//func receivedMIDIAftertouch(noteNumber: MIDINoteNumber, pressure: MIDIByte, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
//    TxTField.text = "receivedMIDIAftertouch"
//    print("receivedMIDIAftertouch")
//}
//
//func receivedMIDIAftertouch(_ pressure: MIDIByte, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
//    TxTField.text = "receivedMIDIAftertouch"
//    print("receivedMIDIAftertouch")
//}
//
//func receivedMIDIPitchWheel(_ pitchWheelValue: MIDIWord, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
//    TxTField.text = "receivedMIDIPitchWheel"
//    print("receivedMIDIPitchWheel")
//}
//
//func receivedMIDIProgramChange(_ program: MIDIByte, channel: MIDIChannel, portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
//    TxTField.text = "receivedMIDIProgramChange"
//    print("receivedMIDIProgramChange")
//}
//
//
//
///// MIDI Object Property has changed
////func receivedMIDIPropertyChange(propertyChangeInfo: MIDIObjectPropertyChangeNotification) -> () {}
//
///// Generic MIDI Notification
//func receivedMIDINotification(notification: MIDINotification) -> () {}
//
//
//func receivedMIDIController(_ controller: MIDIByte,
//                            value: MIDIByte,
//                            channel: MIDIChannel,
//                            portID: MIDIUniqueID?,
//                            timeStamp: MIDITimeStamp?) {
//
//    TxTField.text = "receivedMIDIProgramChange || Channel: \(channel + 1) controller: \(controller) value: \(value)  portID: \(String(describing: portID))"
//    print("Channel: \(channel + 1) controller: \(controller) value: \(value) ","  portID:",portID as Any)
//
//}
//
//
//func receivedMIDISystemCommand(_ data: [MIDIByte], portID: MIDIUniqueID?) {
//
//    print("receivedMIDISystemCommand ",data)
//
//    //TxTField.text = "receivedMIDISystemCommand :: \(data)"
//
//}
//
//
//func receivedMIDISystemCommand(_ data: [MIDIByte], portID: MIDIUniqueID?, timeStamp: MIDITimeStamp?) {
//
//    print("receivedMIDISystemCommand ",data)
//
//    //TxTField.text = "receivedMIDISystemCommand :: \(data)"
//
//}
//
//func receivedMIDISetupChange(){
//    print("wijziging in midisetup")
//    TxTField.text = "changed has something"
//}
