//
//  FormularioViewController.swift
//  Tarea 5 ios
//
//  Created by CCDM19 on 12/11/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit

class FormularioViewController: UIViewController {
    
    var delegado:TableViewController?
    var producto:Producto?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.autorepeat=false
        stepper.maximumValue=5
        stepper.minimumValue=0
        
        if let p=producto{
            textNombre.text=p.nombre
            textTienda.text=p.tienda
            textCosto.text=p.costo.description
            labelGrado.text=p.gradoDeNecesidad.description
            textExplicacion.text=p.explicacion
        }

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var textNombre: UITextField!
    @IBOutlet weak var textTienda: UITextField!
    @IBOutlet weak var textCosto: UITextField!
    @IBOutlet weak var textExplicacion: UITextField!
    @IBOutlet weak var labelGrado: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        labelGrado.text = Int(stepper.value).description
    }
    @IBAction func btnGuardar(_ sender: Any) {
        let nombre=textNombre.text!
        let tienda=textTienda.text!
        let costo=Double(textCosto.text!)
        let grado=Int(labelGrado.text!)
        let explicacion=textExplicacion.text!
        var id:Int
        if let p=producto{
            id=p.id
        }
        else{
            id=1
        }
        
        let productoNuevo=Producto(id: id,nombre: nombre, tienda: tienda, costo: Decimal(costo!), grado: grado!, explicacion: explicacion)
        delegado?.guardarProducto(productoNuevo)
        cerrarVentana()
    }
    
    @IBAction func btnCancelar(_ sender: Any) {
        cerrarVentana()
    }
    func cerrarVentana(){
        if presentingViewController != nil{
        //navigationController!.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        }
        else{
            //dismiss(animated: true, completion: nil)
            navigationController!.popViewController(animated: true)
        }
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
