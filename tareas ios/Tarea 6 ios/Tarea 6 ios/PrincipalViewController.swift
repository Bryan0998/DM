//
//  PrincipalViewController.swift
//  Tarea 6 ios
//
//  Created by CCDM20 on 12/4/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class PrincipalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var labelFechaActual: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    let paises = ["México","Brasil","USA"]
    let claves = ["BR","MX","US"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        picker.delegate = self
        picker.dataSource = self
        
        
        labelFechaActual.text = getDate()
        
        
    }
    
    func getDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
        return formatter.string(from: date)
    }
    
    func esFestivo() -> Bool {
        var festivo=false
        
        
        
        return festivo
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return paises.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return paises[row]
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
