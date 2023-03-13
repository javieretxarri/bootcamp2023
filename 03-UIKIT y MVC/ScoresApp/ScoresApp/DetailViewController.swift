//
//  DetailViewController.swift
//  ScoresApp
//
//  Created by Javier Etxarri on 13/3/23.
//

import UIKit

class DetailViewController: UITableViewController {
    let modelLogic = ModelLogic.shared

    @IBOutlet var titulo: UITextField!
    var selectedScore: Score?

    override func viewDidLoad() {
        super.viewDidLoad()

        titulo.text = selectedScore?.title
    }
}
