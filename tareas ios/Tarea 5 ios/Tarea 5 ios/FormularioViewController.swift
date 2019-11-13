//
//  FormularioViewController.swift
//  Tarea 5 ios
//
//  Created by CCDM19 on 12/11/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit

class FormularioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var textNombre: UITextField!
    @IBOutlet weak var textTienda: UITextField!
    @IBOutlet weak var textCosto: UITextField!
    @IBOutlet weak var textExplicacion: UITextField!
    @IBOutlet weak var labelGrado: UILabel!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func btnGuardar(_ sender: Any) {
        let nombre=textNombre.text!
        let tienda=textTienda.text!
        let costo=Double(textCosto.text!)
        let grado=Int(labelGrado.text!)
        let explicacion=textExplicacion.text!
        
        let producto=Producto(nombre: nombre, tienda: tienda, costo: Decimal(costo!), grado: grado!, explicacion: explicacion)
        
        var db=SqliteDbStore()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
