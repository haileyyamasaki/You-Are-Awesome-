//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Hailey Yamasaki on 9/2/20.
//  Copyright © 2020 Hailey Yamasaki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var imageNumber = -1
    var messageNumber = -1
    var soundNumber = -1
    let totalNumberOfImages = 9
    let totalNumberOfSounds = 6
    var audioPlayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""

    }
    
    func playSound(name: String) {
                if let sound = NSDataAsset(name: name) {
                    do {
                        try audioPlayer = AVAudioPlayer(data: sound.data)
                        audioPlayer.play()
                    } catch {
                        print("ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object.")
                    }
            } else {
            print("ERROR: Could Not Read Data From File sound0")

        }
    }
    
    func nonRepeatingRandom(originalNumber: Int, upperLimit: Int) ->Int {
        var newNumber : Int
        repeat {
        newNumber = Int.random(in: 0...upperLimit)
        } while originalNumber == newNumber
        return newNumber
    }

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "Fabulous? That's You!",
                        "When the Genius Bar Needs Help, They Call You!",
                        "You've Got the Design Skills of Jony Ive"]
        
        messageNumber = nonRepeatingRandom(originalNumber: messageNumber, upperLimit: messages.count-1)
        messageLabel.text = messages[messageNumber]
        
        
        imageNumber = nonRepeatingRandom(originalNumber: imageNumber, upperLimit: totalNumberOfImages-1)
        imageView.image = UIImage(named: "image\(imageNumber)")
        
    
        soundNumber = nonRepeatingRandom(originalNumber: soundNumber, upperLimit: totalNumberOfSounds-1)
        print("*** The New Sound Number is \(soundNumber)")
        
        playSound(name: "sound\(soundNumber)")
}
}
