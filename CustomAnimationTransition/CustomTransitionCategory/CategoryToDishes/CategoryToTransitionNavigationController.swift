//
//  CategoryToTransitionNavigationController.swift
//  bambook
//
//  Created by Admin on 26/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class CategoryToTransitionNavigationController: NSObject {
    
    var coordinateFood:CGPoint?
    var durationAnim:Double = 0.0
    
    var image:UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.backgroundColor = UIColor.clear
       return view
    }()
    
    init(image:UIImage,coordinate:CGPoint,duration:Double,size:CGSize) {
        self.image.image = image
        self.image.frame.size = size
        self.image.frame.origin = coordinate
        self.coordinateFood = coordinate
        self.durationAnim = duration
    }
}

//MARK: - conforms to protocol transition animated
extension CategoryToTransitionNavigationController:UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return durationAnim
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let to = transitionContext.viewController(forKey: .to) else {
            transitionContext.completeTransition(false)
            return
        }
        
        transitionContext.containerView.addSubview(to.view)
        transitionContext.containerView.addSubview(image)
        
        let frameFinal = transitionContext.finalFrame(for: to)
        
        to.view.transform = CGAffineTransform(translationX: frameFinal.width, y: 0.0)
        to.view.alpha = 0.5
        
        guard let controllerCast = to as? DishesByCategoryCollectionViewController else {
            transitionContext.completeTransition(false)
            return
        }
        
        UIView.animate(withDuration: 0.8, animations: { [weak object = self] in
            to.view.transform = CGAffineTransform.identity
            to.view.alpha = 1.0
            object?.image.transform = CGAffineTransform(rotationAngle: (CGFloat.pi/180.0) * 180.0)
            object?.image.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            object?.image.center = (transitionContext.containerView.superview?.center)!
            controllerCast.sizeCustom = (object?.image.frame.size)!
        }) {[weak object = self] (_) in
            UIView.animate(withDuration: 0.5, animations: {
                object?.image.center = controllerCast.centerHeader
            }, completion: { (temp) in
                controllerCast.imageCustom = (object?.image.image)!
                object?.image.removeFromSuperview()
                transitionContext.completeTransition(temp)
            })
        }
    }
}
