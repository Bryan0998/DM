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
            let createStatement = "create table if not exists Producto (nombre text primary key not null, tienda text not null, costo real not null, grado integer not null, explicacion text not null)"
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
    
    
}
