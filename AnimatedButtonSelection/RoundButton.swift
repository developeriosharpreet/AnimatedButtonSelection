//
//  RoundButton.swift
//  AnimatedButtonSelection
//
//  Created by Animators on 10/06/18.
//  Copyright © 2018 Animators. All rights reserved.
//

import UIKit


@IBDesignable
class RoundButton: UIButton {
    // MARK: - Borders
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}
