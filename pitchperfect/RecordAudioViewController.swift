//
//  RecordAudioViewController.swift
//  pitchperfect
//
//  Created by Kamil Jarzab on 23.10.2017.
//  Copyright © 2017 Kamil Jarzab. All rights reserved.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController {
    
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordingButton.isEnabled = false;
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

    override func viewDidAppear(_ animated: Bool) {
        //
    }


    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "Recording in progres..."
        stopRecordingButton.isEnabled = true;
        recordButton.isEnabled = false;
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let fileName = URL(string: pathArray.joined(separator: "/"))
        print(fileName)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: fileName!, settings: [:])
        audioRecorder.isMeteringEnabled = true;
        audioRecorder.prepareToRecord();
        audioRecorder.record();
    }
    
    
    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "Tap to record"
        stopRecordingButton.isEnabled = false;
        recordButton.isEnabled = true;
        audioRecorder.stop();
        let audioSession = AVAudioSession.sharedInstance();
        try! audioSession.setActive(false);
    }
    
    
    
}

