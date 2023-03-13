//
//  ScoresTableViewController.swift
//  ScoresApp
//
//  Created by Javier Etxarri on 13/3/23.
//

import UIKit

final class ScoresTableViewController: UITableViewController {
    let modelLogic = ModelLogic.shared

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    // La quito porque quiero que sea 1
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.modelLogic.getRows()
    }

    // Esto es un delegado
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zelda", for: indexPath)
        let score = self.modelLogic.getScoreRow(indexPath: indexPath)
        var content = UIListContentConfiguration.subtitleCell()
        content.text = score.title
        content.secondaryText = score.composer
        content.image = UIImage(named: score.cover)
        cell.contentConfiguration = content

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
//        indexPath.row % 2 == 0
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.modelLogic.deleteScore(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        // Esto mejor no hacer, solo sería válido con datos muy muy simples. Aún así en desuso
//        else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        self.modelLogic.moveScore(indexPath: fromIndexPath, to: to)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detalle" {
            guard segue.identifier == "detalle",
                  let detail = segue.destination as? DetailViewController,
                  let cell = sender as? UITableViewCell,
                  let cellIndexPath = tableView.indexPath(for: cell)
            else {
                return
            }
            let score = self.modelLogic.getScoreRow(indexPath: cellIndexPath)
            detail.selectedScore = score
        }
    }
}
