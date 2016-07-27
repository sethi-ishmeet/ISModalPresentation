//
//  ISAnimator.swift
//  ISModalPresentation
//
//  Created by Ishmeet Singh Sethi on 2016-07-26.
//  Copyright © 2016 Ishmeet. All rights reserved.
//

import UIKit

class ISAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresenting: Bool = false
    var transitionDuration: NSTimeInterval = 0.8
    
    var verticalOffset: CGFloat = 40.0
    var transformScale: CGFloat = 0.92
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return transitionDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view
        let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)?.view
        
        var center: CGPoint?
        
        let transform = CGAffineTransformMakeTranslation(0.0, verticalOffset)
        
        if isPresenting {
            center = toView?.center
            toView?.center = CGPointMake(center!.x, (toView?.bounds.size.height)!)
            transitionContext.containerView()?.addSubview(toView!)
            toView?.transform = CGAffineTransformScale(transform, 1.0, 1.0)
        } else {
            center = CGPointMake((toView?.center.x)!, toView!.bounds.size.height + fromView!.bounds.size.height)
        }
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 600.0, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.init(rawValue: 0), animations: {
            
            if self.isPresenting {
                fromView?.transform = CGAffineTransformScale(CGAffineTransformIdentity, self.transformScale, self.transformScale)
                toView?.center = center!
            } else {
                toView?.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
                fromView?.center = center!
            }
        }) {
            (_) in
            if !self.isPresenting {
                fromView?.removeFromSuperview()
            }
            transitionContext.completeTransition(true)
        }
    }
}
