//
//  ClaseViewController.swift
//  TableViewEjemplo
//
//  Created by CCDM19 on 16/10/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit

class ClaseViewController: UIViewController {
    
    var delegado: ClasesViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let clase = clase{
            nombre.text = clase.nombre
            maestro.text = clase.maestro
            hora.text = clase.hora
            aula.text = clase.aula
        }

        // Do any additional setup after loading the view.
    }
    
    var clase: MiClase?
    @IBOutlet weak var maestro: UITextField!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var hora: UITextField!
    @IBOutlet weak var aula: UITextField!
    
    
    
    @IBAction func touchGuardar(_ sender: Any) {
        
        let nuevaClase=MiClase(nombre: nombre.text!, maestro: maestro.text!, hora: hora.text!, aula: aula.text!)
        delegado?.guardarClase(nuevaClase)
        
        cerrarVentana()
    }
    @IBAction func touchCancelar(_ sender: Any) {
        cerrarVentana()
    }
    func cerrarVentana(){
        dismiss(animated: true, completion: nil)
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
