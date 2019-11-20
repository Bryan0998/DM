//
//  ManagerFrutas.swift
//  Examen
//
//  Created by CCDM19 on 15/11/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import Foundation
class ManagerFrutas{
    private lazy var frutas:[Fruta] = self.cargarFrutas()
    
    private func cargarFrutas() -> [Fruta] {
        let frutas = [
            Fruta(nombre: "Manzana", tipo: "Fruta", sabor: "Rica"),
            Fruta(nombre: "Naranja", tipo: "Fruta", sabor: "Muy rica"),
            Fruta(nombre: "Calabaza", tipo: "Verdura", sabor: "Regular"),
            Fruta(nombre: "Uva", tipo: "Fruta", sabor: "Muy rica"),
            Fruta(nombre: "Chayote", tipo: "Verdura", sabor: "Mala")
        ]
        
        return frutas
    }
    
    func fruta(at indice:Int) -> Fruta{
        return frutas[indice]
    }
}
