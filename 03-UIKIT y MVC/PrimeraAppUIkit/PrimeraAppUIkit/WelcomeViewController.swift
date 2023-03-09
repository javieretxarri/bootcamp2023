//
//  WelcomeViewController.swift
//  PrimeraAppUIkit
//
//  Created by Javier Etxarri on 9/3/23.
//

import UIKit

final class WelcomeViewController: UIViewController {
    @IBOutlet var welcomeMessage: UILabel!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var jobs: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        jobs.layer.cornerRadius = 10
    }

    @IBAction func login(_ sender: UIButton) {
        welcomeMessage.text = "Bienvenido a súper Apple"
        userLabel.text = "Nombre de usuario Nombre de usuario Nombre de usuario"
        passwordLabel.text = "Contraseña segura"
    }
}
