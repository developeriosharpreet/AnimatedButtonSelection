//
//  AnimatedView.swift
//  AnimatedButtonSelection
//
//  Created by Harpreet on 10/06/18.
//  Copyright © 2018 Animators. All rights reserved.
//

import UIKit

class AnimatedView: UIView {
fileprivate var containerView: UIView!
     fileprivate let nibName = "AnimatedView"
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        containerView = loadViewFromNib()
        containerView.frame = bounds
        containerView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(containerView)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
}
