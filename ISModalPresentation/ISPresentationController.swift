//
//  ISPresentationController.swift
//  ISModalPresentation
//
//  Created by Ishmeet Singh Sethi on 2016-07-26.
//  Copyright © 2016 Ishmeet. All rights reserved.
//

import UIKit

class ISPresentationController: UIPresentationController {
    
    let dimmingView = UIView()
    var containDimmingView: Bool = true
    var verticalOffset: CGFloat = 40.0
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
    }
    
    override func presentationTransitionWillBegin() {
        if containDimmingView {
            dimmingView.frame = (containerView?.bounds)!
            dimmingView.alpha = 0.0
            containerView?.insertSubview(dimmingView, atIndex: 0)
            
            presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (context) in
                self.dimmingView.alpha = 1.0
                }, completion: nil)
        }
    }
    
    override func dismissalTransitionWillBegin() {
        if containDimmingView {
            presentedViewController.transitionCoordinator()?.animateAlongsideTransition({ (context) in
                self.dimmingView.alpha = 0.0
                }, completion: { (context) in
                    self.dimmingView.removeFromSuperview()
            })
        }
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        let bound = CGRectMake(0, verticalOffset, (containerView?.bounds.width)!, (containerView?.bounds.height)! - verticalOffset)
        return bound
    }
    
    override func containerViewWillLayoutSubviews() {
        if containDimmingView {
            dimmingView.frame = (containerView?.bounds)!
        }
        presentedView()?.frame = frameOfPresentedViewInContainerView()
    }

}