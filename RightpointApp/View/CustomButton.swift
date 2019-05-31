//
//  CustomButton.swift
//  HelloWorld
//
//  Created by argenis delarosa on 5/1/19.
//  Copyright © 2019 argenis delarosa. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
