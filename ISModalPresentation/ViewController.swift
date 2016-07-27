//
//  ViewController.swift
//  ISModalPresentation
//
//  Created by Ishmeet Singh Sethi on 2016-07-26.
//  Copyright © 2016 Ishmeet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let isTransitioningDelegate = ISTransitioningDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnShowSecond_Click(sender: UIButton) {
        self.performSegueWithIdentifier("showSecondVC", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! SecondViewController
        
        //Set variables if needed
//        isTransitioningDelegate.containDimmingView = false
//        isTransitioningDelegate.transformScale = 0.90
//        isTransitioningDelegate.transitionDuration = 1.0
//        isTransitioningDelegate.verticalOffset = 50
        
        destination.transitioningDelegate = isTransitioningDelegate
        destination.modalPresentationStyle = .Custom
    }
}