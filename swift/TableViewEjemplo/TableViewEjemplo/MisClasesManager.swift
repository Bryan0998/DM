//
//  MisClasesManager.swift
//  TableViewEjemplo
//
//  Created by CCDM19 on 10/15/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import Foundation

class MisClasesManager{
    private lazy var clases : [[MiClase]] = self.CargarClases();
    
    var numeroClases : Int { return clases.count }
    
    func leerClase(at indice:Int) -> MiClase {
        return clases[seccion][indice]
    }
    func guardarClase(nuevaClase: MiClase){
        clases.append(nuevaClase)
    }
    func actualizaClase(at indice:Int, with clase: MiClase){
        clases[indice] = clase
    }
    func numeroSecciones() -> Int{
        return clases.count
    }
    func numeroDeRegistros() -> Int{
        return clases
    }
    
    private func CargarClases() -> [[MiClase]] {
        
        let todas = clasesEjemplo()
        var maestroActual = "?????"
        let final = [[MiClase]]()
        var i = -1
        
        let ordenadas = todas.sorted(by: {$0.maestro > $1.maestro})
        let grupos = ordenadas.reduce(into: final) { (res, el) -> () in
            if (maestroActual != el.maestro){
                maestroActual = el.maestro
                i += 1
                res.append([MiClase]())
            }
            
            res[i].append(el)
            
        }
        
        return grupos
    }
    
    private func clasesEjemplo() -> [MiClase] {
        let misClases = [
        MiClase(nombre: "Móviles", maestro: "Moya", hora: "1300", aula: "DS"),
        MiClase(nombre: "Negocios", maestro: "Moya", hora: "1000", aula: "DS")
        ]
        
        return misClases
    }
}
