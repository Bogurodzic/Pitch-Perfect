//
//  RecordAudioViewController.swift
//  pitchperfect
//
//  Created by Kamil Jarzab on 23.10.2017.
//  Copyright © 2017 Kamil Jarzab. All rights reserved.
//

import UIKit

class RecordAudioViewController: UIViewController {

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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        recordingLabel.text = "Recording in progres..."
        stopRecordingButton.isEnabled = true;
        recordButton.isEnabled = false;
    }
    
    
    @IBAction func stopRecording(_ sender: Any) {
        recordingLabel.text = "Tap to record"
        stopRecordingButton.isEnabled = false;
        recordButton.isEnabled = true;
    }
    
    
    
}

