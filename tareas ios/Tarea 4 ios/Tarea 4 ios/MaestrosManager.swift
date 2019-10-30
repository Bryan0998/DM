//
//  MaestrosManager.swift
//  Tarea 4 ios
//
//  Created by CCDM19 on 29/10/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import Foundation

class MaestrosManager{
    private lazy var maestros : [Maestro] = self.CargarMaestros();
    
    var numeroMaestros : Int { return maestros.count }
    
    
    func leerMaestro(at indice:Int) -> Maestro {
        return maestros[indice]
    }
    func guardarMaestro(nuevoMaestro: Maestro){
        maestros.append(nuevoMaestro)
    }
    func actualizaMaestro(at indice:Int, with maestro: Maestro){
        maestros[indice] = maestro
    }
    func numeroDeSecciones() -> Int{
        return 1
    }
    
    private func CargarMaestros() -> [Maestro] {
        return maestrosEjemplo()
    }
    
    private func maestrosEjemplo() -> [Maestro] {
        let misMaestros = [
            Maestro(nombre: "Katy", sexo: "Femenino", grado: "Mt.", calificacion: 5, facultad: "Sistemas y Computación", carreras: ["Sistemas","TIC´s"], materias: ["POO","Programación II"]),
            Maestro(nombre: "Barrón", sexo: "Femenino", grado: "Dra.", calificacion: 4, facultad: "Sistemas y Computación", carreras: ["Sistemas","TIC´s"], materias: ["POO","Fundamentos de programación"])
        ]
        
        return misMaestros
    }
}
