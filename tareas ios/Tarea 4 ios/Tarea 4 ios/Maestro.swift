//
//  Maestro.swift
//  Tarea 4 ios
//
//  Created by CCDM19 on 29/10/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import Foundation

class Maestro{
    
    var nombre:String
    var sexo:String
    var grado:String
    var calificacion:Int
    var facultad:String
    var carreras:[String]
    var materias:[String]
    
    init(nombre:String, sexo:String,grado:String,calificacion:Int,facultad:String,carreras:[String],materias:[String]) {
        self.nombre = nombre
        self.sexo = sexo
        self.grado = grado
        self.calificacion = calificacion
        self.facultad = facultad
        self.carreras = carreras
        self.materias = materias
    }
    
    
}
