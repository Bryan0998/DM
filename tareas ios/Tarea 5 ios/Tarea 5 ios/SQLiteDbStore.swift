//
//  SQLiteDbStore.swift
//  Tarea 5 ios
//
//  Created by CCDM19 on 12/11/19.
//  Copyright © 2019 Coppel. All rights reserved.
//

import Foundation
import os.log
import SQLite3

class SqliteDbStore {
    
    var fileURL:URL
    var database:FMDatabase
    
    init()
    {
        let fileURL = try! FileManager.default
            .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("Wishlist.sqlite")
        
        let database = FMDatabase(url: fileURL)
        self.fileURL=fileURL
        self.database=database
        crearTabla()
        
    }
    func open() -> Bool{
        return database.open()
    }
    func crearTabla() -> Bool{
        var b=true
        if open(){
            let createStatement = "create table if not exists Producto (id integer primary key autoincrement, nombre text not null, tienda text not null, costo real not null, grado integer not null, explicacion text not null)"
            do{
                try database.executeUpdate(createStatement, values: nil)
                print("Tabla creada")
            }
            catch{
                print("error al crear la tabla")
            }
            database.close()
        }
        else{
            b=false
        }
        return b
    }
    func inserta(){
        if database.open(){
            let insert="INSERT INTO Producto (nombre,tienda,costo,grado,explicacion) VALUES (?,?,?,?,?)"
            
            do{
                try database.executeUpdate(insert, values: ["audifonos","Sears",500.0,5,"Los quiero y punto."])
            }
            catch{
                print("No insertó")
            }
            
            database.close()
        }

    }
    func select()-> [Producto]{
        var productos:[Producto] = [Producto]()
        var nombre:String
        var id:Int
        var tienda:String
        var costo:Decimal
        var grado:Int
        var explicacion:String
        do{
           if database.open(){
               let rs = try database.executeQuery("select id, nombre, tienda, costo, grado, explicacion from Producto order by grado desc, costo desc", values: nil)
               while rs.next() {
                    id = Int(rs.string(forColumn: "id")!)!
                    nombre = rs.string(forColumn: "nombre")!
                    tienda = rs.string(forColumn: "tienda")!
                    costo = Decimal(Double(rs.string(forColumn: "costo")!)!)
                    grado = Int(rs.string(forColumn: "grado")!)!
                    explicacion = rs.string(forColumn: "explicacion")!
                    let producto = Producto(id: id, nombre: nombre, tienda: tienda, costo: costo, grado: grado, explicacion: explicacion)
                    productos.append(producto)
               }
               database.close()
           }
        }
        catch{
           print("Error con la base de datos")
        }
        return productos
    }
    func select(withId id:Int)-> Producto?{
        var producto:Producto?
        var nombre:String
        var tienda:String
        var costo:Decimal
        var grado:Int
        var explicacion:String
        do{
           if database.open(){
               let rs = try database.executeQuery("select nombre, tienda, costo, grado, explicacion from Producto where id = ?", values: [id])
               while rs.next() {
                    nombre = rs.string(forColumn: "nombre")!
                    tienda = rs.string(forColumn: "tienda")!
                    costo = Decimal(Double(rs.string(forColumn: "costo")!)!)
                    grado = Int(rs.string(forColumn: "grado")!)!
                    explicacion = rs.string(forColumn: "explicacion")!
                    producto = Producto(id: id, nombre: nombre, tienda: tienda, costo: costo, grado: grado, explicacion: explicacion)
               }
               database.close()
           }
        }
        catch{
           print("Error con la base de datos")
        }
        return producto
    }
    func inserta(producto product : Producto) -> Bool{
        var insertado = false
        if database.open(){
            let insert="INSERT INTO Producto (nombre,tienda,costo,grado,explicacion) VALUES (?,?,?,?,?)"
            
            do{
                try database.executeUpdate(insert, values: [product.nombre,product.tienda,product.costo,product.gradoDeNecesidad,product.explicacion])
                insertado=true
            }
            catch{
                print("No insertó")
                insertado=false
            }
            database.close()
        }
        return insertado
    }
    func update(producto product : Producto) -> Bool{
        var actualizado = false
        if database.open(){
            let update="update Producto set nombre = ?,tienda = ?,costo = ?,grado = ?,explicacion = ? where id = ?"
            
            do{
                try database.executeUpdate(update, values: [product.nombre,product.tienda,product.costo,product.gradoDeNecesidad,product.explicacion,product.id])
                actualizado=true
            }
            catch{
                print("No actualizó")
                actualizado=false
            }
            database.close()
        }
        return actualizado
    }
    func delete(withId id : Int) -> Bool{
        var eliminado = false
        if database.open(){
            let delete="delete from Producto where id = ?"
            
            do{
                try database.executeUpdate(delete, values: [id])
                eliminado=true
            }
            catch{
                print("No eliminó")
                eliminado=false
            }
            database.close()
        }
        return eliminado
    }
    func borrarTabla() -> Bool{
        var eliminado = false
        if database.open(){
            let delete="drop table if exists Producto"
            
            do{
                try database.executeUpdate(delete,values: nil)
                eliminado=true
            }
            catch{
                print("No borró  la tabla")
                eliminado=false
            }
            database.close()
        }
        return eliminado
    }
}
