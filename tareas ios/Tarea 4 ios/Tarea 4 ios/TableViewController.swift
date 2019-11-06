//
//  TableViewController.swift
//  Tarea 4 ios
//
//  Created by CCDM19 on 29/10/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var manager : MaestrosManager = MaestrosManager()
    var maestroVC : MaestrosViewController = MaestrosViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        //navigationItem.title = "Maestros"
        //navigationController?.navigationBar.prefersLargeTitles=true
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "maestroID")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        let facultades=manager.facultades()
        
        return facultades.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = manager.facultades()[section]
        label.backgroundColor = UIColor.lightGray
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        return label
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return manager.numeroDeMaestros(facultad: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "maestroID", for: indexPath)

        let maestro = manager.maestros(enFacultad: indexPath.section)[indexPath.row]

        // Configure the cell...
        
        cell.textLabel?.text = "Maestro: \(maestro.nombre)"
        cell.detailTextLabel?.text = "Carreras: \(maestro.carreras)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let maestroSeleccionado = tableView.indexPathForSelectedRow,
            let maestrosVC = segue.destination as? MaestrosViewController
        {
            maestrosVC.maestros = manager.leerMaestro(at: maestroSeleccionado.row, seccion: maestroSeleccionado.section)
            maestrosVC.delegado = self
        }
            
        else if let navContro = segue.destination as? UINavigationController,
            let maestrosControl = navContro.topViewController as? MaestrosViewController
        {
            maestrosControl.delegado = self
        }
        
    }

}
