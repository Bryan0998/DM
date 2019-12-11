//
//  TableViewController.swift
//  Tarea 6 ios
//
//  Created by CCDM20 on 12/6/19.
//  Copyright © 2019 empresa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    
    var dias:Int=0
    var clavePais:String?
    var año:String?
    var paises = ["MX":"México","BR":"Brasil","US":"USA","AT":"AUSTRIA"]
    var diasFestivos:[JSON]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Días Festivos en \(paises[clavePais!]!) \(año!)"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dias
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
       
        // Configure the cell...
       
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let fechaActual = formatter.string(from: date)
        
        let dia=diasFestivos![indexPath.row]
        let fechaFestivo = dia["date"].stringValue
        let componentes = fechaFestivo.split(separator: "-")
        let fecha = "\(componentes[2])-\(componentes[1])-\(componentes[0])"
        
        cell.imageView?.image = (fechaFestivo < fechaActual) ? UIImage(named: "cross") : UIImage(named: "check")
           
        cell.textLabel?.text = dia["localName"].stringValue
        cell.detailTextLabel?.text = "Fecha: \(fecha)      Nombre:\(dia["name"])"
        
        
        return cell
    }
    /*
    func tableView(tableView: UITableView, titleForHeaderInSection section:Int = 1) -> String?
    {
        
        return "Días Festivos en \(paises[clavePais!]!) \(año!)"
    }
    */

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

}
