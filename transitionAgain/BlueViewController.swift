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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fadeTransition = FadeTransition()
        fadeTransition.duration = 4
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
        
        destinationViewController.transitioningDelegate = fadeTransition
            
        print("I'm about to transition")
    }
    

}
