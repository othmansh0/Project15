//
//  ViewController.swift
//  Project15
//
//  Created by othman shahrouri on 9/14/21.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var currentAnimation = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    //There isnt an image view in storyboard so will create on here
        imageView = UIImageView(image: UIImage(named: "penguin"))
        imageView.center = CGPoint(x: 512, y: 384)
        view.addSubview(imageView)
        
    }

    @IBAction func tapped(_ sender: Any) {
        //Every time  user taps button, we're going to execute a different animation
        currentAnimation += 1
        
        
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

