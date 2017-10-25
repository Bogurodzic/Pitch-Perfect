//
//  RecordAudioViewController.swift
//  pitchperfect
//
//  Created by Kamil Jarzab on 23.10.2017.
//  Copyright © 2017 Kamil Jarzab. All rights reserved.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingButton.isEnabled = false;
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

    override func viewDidAppear(_ animated: Bool) {
    }


    @IBAction func recordAudio(_ sender: Any) {
        toggleRecording(toggle: true)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let pathName = URL(string: pathArray.joined(separator: "/"))
        print(pathName ?? pathName)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: pathName!, settings: [:])

        startRecording()
    }
    
    
    @IBAction func stopRecording(_ sender: Any) {
        toggleRecording(toggle: false)

        let audioSession = AVAudioSession.sharedInstance();
        try! audioSession.setActive(false);
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("Something went wrong")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playAudioVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL!
            playAudioVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    func toggleRecording(toggle: Bool){
        if toggle{
            recordingLabel.text = "Recording in progres..."
            stopRecordingButton.isEnabled = true;
            recordButton.isEnabled = false;
        } else {
            recordingLabel.text = "Tap to record"
            stopRecordingButton.isEnabled = false;
            recordButton.isEnabled = true;
            audioRecorder.stop();
        }
    }
    
    func startRecording(){
        audioRecorder.delegate = self;
        audioRecorder.isMeteringEnabled = true;
        audioRecorder.prepareToRecord();
        audioRecorder.record();
    }
    
    
    
}

