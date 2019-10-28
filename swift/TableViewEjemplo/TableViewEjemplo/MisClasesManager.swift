//
//  MisClasesManager.swift
//  TableViewEjemplo
//
//  Created by CCDM19 on 10/15/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import Foundation

class MisClasesManager{
    private lazy var clases : [MiClase] = self.CargarClases();
    
    var numeroClases : Int { return clases.count }
    
    func leerClase(at indice:Int) -> MiClase {
        return clases[indice]
    }
    func guardarClase(nuevaClase: MiClase){
        clases.append(nuevaClase)
    }
    func actualizaClase(at indice:Int, with clase: MiClase){
        clases[indice] = clase
    }
    
    
    private func CargarClases() -> [MiClase] {
        return clasesEjemplo()
    }
    
    private func clasesEjemplo() -> [MiClase] {
        let misClases = [
        MiClase(nombre: "Móviles", maestro: "Moya", hora: "1300", aula: "DS"),
        MiClase(nombre: "Negocios", maestro: "Moya", hora: "1000", aula: "DS")
        ]
        
        return misClases
    }
}
