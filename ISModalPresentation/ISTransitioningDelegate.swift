//
//  ISTransitioningDelegate.swift
//  ISModalPresentation
//
//  Created by Ishmeet Singh Sethi on 2016-07-26.
//  Copyright © 2016 Ishmeet. All rights reserved.
//

import UIKit

class ISTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    // MARK : - Presentation Controller variables
    var containDimmingView: Bool!
    var verticalOffset: CGFloat!
    
    // MARK : - Animator variables
    var transitionDuration: NSTimeInterval!
    var transformScale: CGFloat!
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        let presentationController = ISPresentationController(presentedViewController: presented, presentingViewController: presenting)
        
        if let _ = containDimmingView {
            presentationController.containDimmingView = self.containDimmingView
        }
        
        if let _ = verticalOffset {
            presentationController.verticalOffset = verticalOffset
        }
        
        return presentationController
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = ISAnimator()
        
        if let _ = transitionDuration {
            animator.transitionDuration = self.transitionDuration
        }
        
        if let _ = verticalOffset {
            animator.verticalOffset = self.verticalOffset
        }
        
        if let _ = transformScale {
            animator.transformScale = self.transformScale
        }
        
        animator.isPresenting = true
        return animator
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = ISAnimator()
        
        if let _ = transitionDuration {
            animator.transitionDuration = self.transitionDuration
        }
        
        animator.isPresenting = false
        return animator
    }
}
