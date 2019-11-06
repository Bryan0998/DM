//
//  Maestro.swift
//  Tarea 4 ios
//
//  Created by CCDM19 on 29/10/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import Foundation

class Maestro{
    
    static var numeroDeMaestros=0
    var id:Int
    var nombre:String
    var sexo:String
    var grado:String
    var calificacion:Int
    var facultad:String
    var carreras:String
    var materias:String
    
    init(nombre:String, sexo:String,grado:String,calificacion:Int,facultad:String,carreras:String,materias:String) {
        Maestro.numeroDeMaestros+=1
        
        self.id=Maestro.numeroDeMaestros
        self.nombre = nombre
        self.sexo = sexo
        self.grado = grado
        self.calificacion = calificacion
        self.facultad = facultad
        self.carreras = carreras
        self.materias = materias
    }
    
}
