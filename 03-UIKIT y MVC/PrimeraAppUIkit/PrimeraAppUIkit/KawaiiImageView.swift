//
//  KawaiiImageView.swift
//  PrimeraAppUIkit
//
//  Created by Javier Etxarri on 9/3/23.
//

import UIKit

@IBDesignable final class KawaiiImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var shadow: CGFloat = 0.0 {
        didSet {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowRadius = shadow
            layer.shadowOpacity = 0.5
            layer.shadowOffset = CGSize(width: 0, height: shadow)
            layer.masksToBounds = true
        }
    }
}
