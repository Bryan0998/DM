//
//  MaestrosViewController.swift
//  Tarea 4 ios
//
//  Created by Edna Camacho on 06/11/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit

class MaestrosViewController: UIViewController {
    
    var delegado: TableViewController?
    var maestros: Maestro?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let maestro = maestros {
            textNombre.text = maestro.nombre
            sexo.selectedSegmentIndex = maestro.sexo == "Masculino" ? 0 : 1
            textGrado.text = maestro.grado
            textMaterias.text = maestro.materias
            textCarreras.text = maestro.carreras
            textFacultad.text = maestro.facultad
            textCalificacion.text = String(maestro.calificacion)
            
        }

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textNombre: UITextField!
    @IBOutlet weak var sexo: UISegmentedControl!
    @IBOutlet weak var textGrado: UITextField!
    @IBOutlet weak var textCalificacion: UITextField!
    @IBOutlet weak var textFacultad: UITextField!
    @IBOutlet weak var textCarreras: UITextField!
    @IBOutlet weak var textMaterias: UITextField!
    
    
    @IBAction func btnGuadar(_ sender: Any) {
        let calificacion : Int? = Int(textCalificacion.text!)
        
        let nuevoMaestro = Maestro(nombre: textNombre.text!, sexo: sexo.titleForSegment(at: sexo.selectedSegmentIndex)!, grado: textGrado.text!, calificacion: calificacion!, facultad: textFacultad.text!, carreras: textCarreras.text!, materias: textMaterias.text!)
        
        delegado?.guardarMaestro(nuevoMaestro)
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
