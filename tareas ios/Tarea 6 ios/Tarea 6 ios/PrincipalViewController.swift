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
    @IBOutlet weak var textSigFecha: UITextField!
    @IBOutlet weak var textSigNombre: UITextField!
    @IBOutlet weak var textSigTipo: UITextField!
    @IBOutlet weak var textEsFestivo: UITextField!
    
    let paises = ["México","Brasil","USA","AUSTRIA"]
    let claves = ["MX","BR","US","AT"]
    var dias:[JSON] = [JSON]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        picker.delegate = self
        picker.dataSource = self
        
        labelFechaActual.text = getDate()
        Ndias()
        esFestivo()
        sigFestivo()
        
        
    }
    
    func getDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
        return formatter.string(from: date)
    }
    
    func sigFestivo() {
        
        let clave = claves[picker.selectedRow(inComponent: 0)]
        
        Alamofire.request("https://date.nager.at/Api/v2/NextPublicHolidays/\(clave)", method: .get).validate().responseJSON { response in
            switch response.result
            {
            case .success(let value):
                let json = JSON(value)
                
                let date = json[0]["date"].stringValue
                let dateComponents = date.split(separator: "-")
                let fecha = "\(dateComponents[2])-\(dateComponents[1])-\(dateComponents[0])"
                let fijo = json[0]["fixed"].boolValue
                
                self.textSigNombre.text = json[0]["localName"].stringValue
                self.textSigFecha.text = fecha
                self.textSigTipo.text = (fijo) ? "Feriado" : "No feriado"
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func esFestivo(){
        var texto = "No es festivo"
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let año = formatter.string(from: date).split(separator: "-")[0]
        
        let clave = claves[picker.selectedRow(inComponent: 0)]
        
        Alamofire.request("https://date.nager.at/Api/v1/Get/\(clave)/\(año)", method: .get).validate().responseJSON { response in
            switch response.result
            {
            case .success(let value):
                let json = JSON(value)
                for item in json.array!{
                    if item["date"].stringValue == formatter.string(from: date){
                        texto = "Es festivo"
                        break
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
        textEsFestivo.text = texto
        
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Ndias()
        esFestivo()
        sigFestivo()
        
    }
    func Ndias(){
        self.dias.removeAll()
        var d = [JSON]()
        let clavePais = claves[picker.selectedRow(inComponent: 0)]
        let año = labelFechaActual.text!.split(separator: "-")[2]
        let url="https://date.nager.at/Api/v1/Get/\(clavePais)/\(año)"
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for item in json.array!{
                    d.append(item)
                }
                for item in d.reversed(){
                    self.dias.append(item)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if let tabla = segue.destination as? TableViewController
        {
            let año = labelFechaActual.text!.split(separator: "-")[2]
            tabla.clavePais = claves[picker.selectedRow(inComponent: 0)]
            tabla.año = año.description
            tabla.diasFestivos=dias
            tabla.dias=dias.count
        }
        // Pass the selected object to the new view controller.
    }
   

}
