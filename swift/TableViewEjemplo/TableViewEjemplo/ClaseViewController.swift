//
//  ClaseViewController.swift
//  TableViewEjemplo
//
//  Created by CCDM19 on 16/10/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit

class ClaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchGuardar(_ sender: Any) {
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
