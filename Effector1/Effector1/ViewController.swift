//
//  ViewController.swift
//  Effector1
//
//  Created by Phillip English on 12/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate
{

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var soundRecorder: AVAudioRecorder!
    var soundPlayer: AVAudioPlayer!
    
    var fileName = "audioFile.m4a"
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupRecorder()
        
    }

    
    @IBAction func recordSound(sender: UIButton)
    {
        if (sender.titleLabel?.text == "Record")
        {
            soundRecorder.record()
            sender.setTitle("Stop", forState: .Normal)
            playButton.enabled = false
            recordButton.setImage(UIImage(named: "stop"), forState: UIControlState.Normal)
        }
        else
        {
            soundRecorder.stop()
            sender.setTitle("Record", forState: .Normal)
            recordButton.setImage(UIImage(named: "record"), forState: UIControlState.Normal)
        }
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
       
    }

    // MARK: - AVRecorder Setup
    func setupRecorder()
    {
        let recordSettings = [AVSampleRateKey : NSNumber(float: Float(44100.0)),
            AVFormatIDKey : NSNumber(int: Int32(kAudioFormatAppleLossless)),
            AVNumberOfChannelsKey : NSNumber(int: 2),
            AVEncoderAudioQualityKey : NSNumber(int: Int32(AVAudioQuality.Max.rawValue))]
        
        var error: NSError?
        
        do {
            soundRecorder = try AVAudioRecorder(URL: getFileURL(), settings: recordSettings)
        } catch let error1 as NSError {
            error = error1
            soundRecorder = nil
        }
        
        if let err = error {
            print ("AvAudioRecorder error: \(err.localizedDescription)")
        } else {
            soundRecorder.delegate = self
            soundRecorder.prepareToRecord()
        }
    }
    
    // MARK: - File URL
    
    func getCacheDirectory() -> String
    {
        let paths = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)
        
        return paths[0]
    }
    
    func getFileURL() -> NSURL
    {
        let path = getCacheDirectory().stringByAppendingString(fileName)
        
        let filePath = NSURL(fileURLWithPath: path)
        
        return filePath
    }
}

