//
//  ManagerProductos.swift
//  Tarea 5 ios
//
//  Created by CCDM19 on 19/11/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import Foundation

class ManagerProductos{
    var managerdb:SqliteDbStore = SqliteDbStore()
    private lazy var productos:[Producto] = cargarProductos()
    
    func cargarProductos() -> [Producto]{
        let productos=managerdb.select()
        return productos
    }
    func getProductos() -> [Producto]{
        return productos
    }
    func getProducto(withId id:Int) -> Producto?{
        var producto:Producto?
        for p in productos{
            if p.id==id{
                producto=p
            }
        }
        return producto
    }
    func getProducto(at indice:Int) -> Producto{
        return productos[indice]
    }
    func actualiza(Producto producto:Producto) -> Bool{
        var actualizado:Bool
        actualizado = managerdb.update(producto: producto)
        return actualizado
    }
    func delete(productoConID id:Int) -> Bool{
        var eliminado:Bool
        eliminado = managerdb.delete(withId: id)
        return eliminado
    }
    func insert(producto p:Producto) -> Bool{
        var insertado:Bool
        insertado=managerdb.inserta(producto: p)
        return insertado
    }
    
}
