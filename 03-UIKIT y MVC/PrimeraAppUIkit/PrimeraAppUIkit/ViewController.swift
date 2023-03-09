//
//  ViewController.swift
//  PrimeraAppUIkit
//
//  Created by Javier Etxarri on 7/3/23.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var campo1: UITextField!

    @IBOutlet var labels: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()

        label1.text = "Soy el primer label"

        if let font = UIFont(name: "Game of Squids", size: 24) {
            label2.font = UIFontMetrics(forTextStyle: .title1).scaledFont(for: font)
            label2.adjustsFontForContentSizeCategory = true
        }
    }

    @IBAction func cambiarLabel(_ sender: Any) {
        label1.text = "He pulsado el botón"
    }

    @IBAction func cambiarColor(_ sender: Any) {
        for label in labels {
            if label.textColor == .blue {
                label.textColor = .red
            } else {
                label.textColor = .blue
            }
        }
    }
}
