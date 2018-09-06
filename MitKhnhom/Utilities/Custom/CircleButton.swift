//
//  CircleButton.swift
//  VTrustValuate
//
//  Created by iOSDev on 13/7/18.
//  Copyright © 2018 iOSDev. All rights reserved.
//

import UIKit

@IBDesignable class CircleButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet { self.layer.cornerRadius = cornerRadius }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet { self.layer.shadowOpacity = shadowOpacity }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet { self.layer.shadowOffset = shadowOffset }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet { self.layer.shadowRadius = shadowRadius }
    }

}
