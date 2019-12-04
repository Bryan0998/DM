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

class PrincipalViewController: UIViewController {
    
    @IBOutlet weak var labelFechaActual: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        labelFechaActual.text = getDate()
        //= ["México","Brasil","USA"]
        
        
    }
    
    func getDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-mm-yyyy"
        
        return formatter.string(from: date)
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
