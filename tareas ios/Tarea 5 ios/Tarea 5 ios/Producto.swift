//
//  Producto.swift
//  Tarea 5 ios
//
//  Created by CCDM19 on 12/11/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import Foundation

class Producto{
    var id:Int
    var nombre:String
    var tienda:String
    var costo:Decimal
    var gradoDeNecesidad:Int
    var explicacion:String
    
    init(id:Int,nombre:String,tienda:String,costo:Decimal,grado:Int,explicacion:String) {
        self.nombre=nombre
        self.tienda=tienda
        self.costo=costo
        self.gradoDeNecesidad=grado
        self.explicacion=explicacion
        self.id=id
    }
}

