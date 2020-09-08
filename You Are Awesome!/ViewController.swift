//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Hailey Yamasaki on 9/2/20.
//  Copyright © 2020 Hailey Yamasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = ""

    }

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        messageLabel.text = "You Are Awesome!"
        imageView.image = UIImage(named: "image0")
    }
    
}

