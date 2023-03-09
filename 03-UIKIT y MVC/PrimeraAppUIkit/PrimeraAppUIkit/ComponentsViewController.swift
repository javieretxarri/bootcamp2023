//
//  ComponentsViewController.swift
//  PrimeraAppUIkit
//
//  Created by Javier Etxarri on 9/3/23.
//

import UIKit

class ComponentsViewController: UIViewController {
    @IBOutlet var botones: [UIButton]!
    @IBOutlet var campo: UITextField!

    @IBOutlet var loading: UIActivityIndicatorView!
    @IBOutlet var progress: UIProgressView!

    @IBOutlet var valorStepper: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

//        for boton in botones {
//            boton.titleLabel?.adjustsFontSizeToFitWidth = true
//            boton.translatesAutoresizingMaskIntoConstraints = false
//            boton.contentScaleFactor = 0.8
//            boton.titleLabel?.minimumScaleFactor = 0.8
//        }
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        print("Pressing the button!!!!")
        print(sender.titleLabel?.text ?? "No text")
        if loading.isAnimating {
            loading.stopAnimating()
        } else {
            loading.startAnimating()
        }
    }

    @IBAction func cambioSegmented(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)

        campo.text = "Seleccionado valor \(sender.selectedSegmentIndex)"
    }

    @IBAction func cambioStepper(_ sender: UIStepper) {
        valorStepper.text = "Valor: \(sender.value)"
    }

    @IBAction func cambioSwitch(_ sender: UISwitch) {
        if !sender.isOn {
            loading.stopAnimating()
        } else {
            loading.startAnimating()
        }
    }

    @IBAction func cambioSlider(_ sender: UISlider) {
        campo.text = "Valor slider \(sender.value)"

        progress.progress = sender.value / 100
    }
}
