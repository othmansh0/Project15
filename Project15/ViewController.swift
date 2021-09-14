//
//  ViewController.swift
//  Project15
//
//  Created by othman shahrouri on 9/14/21.
//

// animate(withDuration:),accepts two closures. The parameters we'll be using are how long to animate for, how long to pause before the animation starts, any options you want to provide, what animations to execute, and finally a closure that will execute when the animation finishes


//For the animations closure we don’t need to use [weak self] because there’s no risk of strong reference cycles here – the closures passed to animate(withDuration:) method will be used once then thrown away.


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
//we want to show and hide the “Tap” button, we need to make the sender parameter to that method be a UIButton rather than Any.
    @IBAction func tapped(_ sender: UIButton) {
        sender.isHidden = true
        // duration of 1 second, no delay, and no interesting options
        UIView.animate(withDuration: 1, delay: 0, options: []) {
            switch self.currentAnimation {
            case 0:
                break
            default:
                break
            }
            //finished value will be true if the animations completed fully.
        } completion: { finished in
            sender.isHidden = false
        }

        
        //Every time  user taps button, we're going to execute a different animation
        currentAnimation += 1
        
        
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

