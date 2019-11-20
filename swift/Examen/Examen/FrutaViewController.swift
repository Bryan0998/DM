//
//  FrutaViewController.swift
//  Examen
//
//  Created by CCDM19 on 15/11/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit

class FrutaViewController: UIViewController {
    
    var fruta:Fruta?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fruta = self.fruta{
            textNombre.text=fruta.nombre
            textTipo.text=fruta.tipo
            textSabor.text=fruta.sabor
            if (fruta.tipo=="Fruta"){
                image.image = UIImage(named: "frutas")
            }
            else{
                image.image = UIImage(named: "verduras")
            }
        }
        

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var textNombre: UITextField!
    @IBOutlet weak var textTipo: UITextField!
    @IBOutlet weak var textSabor: UITextField!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
