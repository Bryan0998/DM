//
//  TableViewController.swift
//  Tarea 5 ios
//
//  Created by CCDM19 on 13/11/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var manager:ManagerProductos=ManagerProductos()
    var formulario:FormularioViewController=FormularioViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager=ManagerProductos()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func guardarProducto(_ producto: Producto){
        if let productoSeleccionado = tableView.indexPathForSelectedRow{
            manager.actualiza(Producto: producto)
        }else{
            manager.insert(producto: producto)
        }
        manager=ManagerProductos()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return manager.getProductos().count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELLID", for: indexPath)

        // Configure the cell...
        let producto=manager.getProducto(at: indexPath.row)
        
        
        cell.textLabel?.text=producto.nombre
        cell.detailTextLabel?.text="Grado de necesidad: \(producto.gradoDeNecesidad)  Costo: \(producto.costo.description)"
        
        //cell.textLabel?.text="hola"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let id = manager.getProducto(at: indexPath.row).id
            manager.delete(productoConID: id)
            manager=ManagerProductos()
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let productoSeleccionado = tableView.indexPathForSelectedRow,
            let formulario = segue.destination as? FormularioViewController
        {
            formulario.producto = manager.getProducto(at: productoSeleccionado.row)
            formulario.delegado = self
        }
            
        else if let navContro = segue.destination as? UINavigationController,
            let formularioNavControl = navContro.topViewController as? FormularioViewController
        {
            formularioNavControl.delegado = self
        }
        
    }

}
