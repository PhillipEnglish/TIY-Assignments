//
//  ViewController.swift
//  Effector1
//
//  Created by Phillip English on 12/6/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate //AVAudioPlayerDelegate
{

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    var soundRecorder: AVAudioRecorder!
    var soundPlayer: AVAudioPlayer!
    //var engine: AVAudioEngine!
    //var playerAV: AVAudioPlayerNode!
    //var audiofile: AVAudioFile
    
    
    var fileName = "audioFile.m4a"
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupRecorder()
        
//        engine = AVAudioEngine()
//        audiofile = try! AVAudioFile(forReading: getFileURL())
//        do {
//            Player = try AVAudioPlayer(contentsOfURL: getFileURL())
//            Player.enableRate = true
//        } catch _ {
//            
//        }
    }

    
    @IBAction func recordSound(sender: UIButton)
    {
        if (sender.titleLabel?.text == "Record")
        {
            soundRecorder.record()
            sender.setTitle("Stop", forState: .Normal)
            playButton.enabled = false
        }
        else
        {
            soundRecorder.stop()
            sender.setTitle("Record", forState: .Normal)
        }
    }
    
    @IBAction func playSound(sender: UIButton) {
        if (sender.titleLabel?.text == "Play")
        {
            recordButton.enabled = false
            sender.setTitle("Stop", forState: .Normal)
            preparePlayer()
            soundPlayer.play()
        }
        else
        {
            soundPlayer.stop()
            sender.setTitle("Play", forState: .Normal)
        }
    }
//    @IBAction func recordSound(sender: UIButton)
//    {
//        if (sender.titleLabel?.text == "Record")
//        {
//            soundRecorder.record()
//            sender.setTitle("Stop", forState: .Normal)
//            playButton.enabled = false
//            recordButton.setImage(UIImage(named: "stop"), forState: UIControlState.Normal)
//        }
//        else
//        {
//            soundRecorder.stop()
//            sender.setTitle("Record", forState: .Normal)
//            recordButton.setImage(UIImage(named: "record"), forState: UIControlState.Normal)
//        }
//    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
       
    }
    
    // MARK: - AVPlayer Setup
    
    func preparePlayer()
    {
        var error: NSError?
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOfURL: getFileURL())
        } catch let error1 as NSError {
            error = error1
            soundPlayer = nil
        }
        
        if let err = error {
            print("AVAudioPlayer error: \(err.localizedDescription)")
        } else {
            soundPlayer.delegate = self
            soundPlayer.prepareToPlay()
            soundPlayer.volume = 1.0
        }
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
            print("recorder set up")
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
    

    
    
    // Mark: - Audio Engine
//    func setupAudioEngine ()
//    {
//        engine = AVAudioEngine()
//        playerAV = AVAudioPlayerNode()
//        playerAV.volume = 0.5
//        
//        let url: NSURL = getFileURL()
////        var file = AVAudioFile(forReading: url)
////        
////        var buffer = AVAudioPCMBuffer(PCMFormat: file.processingFormat, frameCapacity: AVAudioFrameCount(file.length))
////        file.readIntoBuffer(buffer, error: nil)
//        var file: AVAudioFile?
//        
//        do {
//            file = try AVAudioFile(forReading: url)
//            
//            guard let file = file else {
//                fatalError("file must not be nil in function.")
//            }
//            
//            engine.attachNode(playerAV)
//            
//            //let format = file.processingFormatxxxx
//            
//            do {
//                try engine.start()
//            } catch {
//                fatalError("Could not start engine. error")
//            }
//        }
//        
//    }
    
    // MARK:- AVAudioPlayer delegate methods
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool)
    {
        recordButton.enabled = true
        playButton.setTitle("Play", forState: .Normal)
    }
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer, error: NSError?) {
        print("Error while playing audio \(error!.localizedDescription)")
    }
    // MARK:- AVAudioRecorder delegate methods
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        playButton.enabled = true
        recordButton.setTitle("Record", forState: .Normal)
    }
    
    func audioRecorderEncodeErrorDidOccur(recorder: AVAudioRecorder, error: NSError?) {
        print("Error while recording audio \(error!.localizedDescription)")
    }

}

