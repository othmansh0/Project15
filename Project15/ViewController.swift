//
//  ViewController.swift
//  Project15
//
//  Created by othman shahrouri on 9/14/21.
//

// animate(withDuration:),accepts two closures. The parameters we'll be using are how long to animate for, how long to pause before the animation starts, any options you want to provide, what animations to execute, and finally a closure that will execute when the animation finishes


//For the animations closure we don’t need to use [weak self] because there’s no risk of strong reference cycles here – the closures passed to animate(withDuration:) method will be used once then thrown away.

//-----------------------------------------------------------------------------------------

//CGAffineTransform. is a structure that represents a specific kind of transform that we can apply to any UIView object or subclass

// As we'll be doing this inside an animation block, the transform will automatically be animated

//UIKit animations have an "ease in, ease out" curve, which means the movement starts slow, accelerates, then slows down again before reaching the end

//rotation:
//1.You need to provide the value in radians as cgFloat
//2.Core Animation will always take the shortest route to make the rotation work can be clock or anti wise
//3.if u try to rotate 540 you will end up with 180 only

//----------------------------------------------------------------------------------------

// Core Animation can animate many of the properties of your views it can animate the background color of the image view, or the level of transparency. You can even change multiple things at once if you want something more complicated to happen


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
       // UIView.animate(withDuration: 1, delay: 0, options: []) {
        
        //it uses spring animations rather than the default, ease-in-ease-out animation
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: []){
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            case 1://resetting any changes
                self.imageView.transform = .identity
            case 2:
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
            case 3:
                self.imageView.transform = .identity
            case 4:
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            case 5:
                self.imageView.transform = .identity
            case 6:
                self.imageView.alpha = 0.1
                self.view.backgroundColor = UIColor.green
            case 7:
                self.imageView.alpha = 1
                self.view.backgroundColor = UIColor.clear
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

