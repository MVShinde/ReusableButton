//
//  UIView+Extension.swift
//  RandstadRiseSmart
//
//  Created by Mangesh Shinde on 11/04/21.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
