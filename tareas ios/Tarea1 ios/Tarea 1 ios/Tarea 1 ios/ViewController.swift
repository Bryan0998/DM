//
//  ViewController.swift
//  Tarea 1 ios
//
//  Created by CCDM19 on 10/1/19.
//  Copyright © 2019 CCDM19. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var label: UILabel!
    
    @IBAction func ClickGeneral(_ sender: Any) {
        let boton : UIButton = sender as! UIButton
        label.text=boton.currentTitle
        label.textColor=boton.backgroundColor
    }
}

