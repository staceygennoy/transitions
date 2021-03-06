//
//  BlueViewController.swift
//  transitionAgain
//
//  Created by Stacey Gennoy on 12/20/15.
//  Copyright © 2015 Stacey Gennoy. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var fadeTransition: FadeTransition!
    var lightboxTransition: LightboxTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fadeTransition = FadeTransition()
        fadeTransition.duration = 2
        
        lightboxTransition = LightboxTransition()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destinationViewController = segue.destinationViewController as! GrayViewController
        
        destinationViewController.labelString = textField.text
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        destinationViewController.transitioningDelegate = lightboxTransition
            
        print("I'm about to transition")
    }
    
    @IBAction func onPinchGesture(sender: UIPinchGestureRecognizer) {
        let scale  = sender.scale
        let velocity = sender.velocity
        
        print(scale)
        
        if sender.state == UIGestureRecognizerState.Began {
            lightboxTransition.isInteractive = true
            performSegueWithIdentifier("graySegue", sender: nil)
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            lightboxTransition.percentComplete = scale / 8
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            if velocity > 0 {
                lightboxTransition.finish()
            } else {
                lightboxTransition.cancel()
            }
            
        }
    }

}
