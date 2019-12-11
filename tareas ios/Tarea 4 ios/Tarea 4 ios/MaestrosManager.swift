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
    
    func facultades() -> [String]{
        var facultades = [String]()
        for maestro in maestros{
            if !facultades.contains(maestro.facultad){
                facultades.append(maestro.facultad)
            }
        }
        
        return facultades
    }
    
    func numeroDeMaestros(facultad indice:Int) -> Int{
        var i=0
        for maestro in maestros{
            if maestro.facultad == facultades()[indice]{
                i+=1
            }
        }
        return i
    }
    
    func maestros(enFacultad indice:Int) -> [Maestro]{
        var maestrosEnFacultad = [Maestro]()
        let f=facultades()
        
        for maestro in maestros{
            if maestro.facultad==f[indice]{
                maestrosEnFacultad.append(maestro)
            }
        }
        
        return maestrosEnFacultad
    }
    
    
    func leerMaestro(at indice:Int, seccion sec:Int ) -> Maestro {
        return maestros(enFacultad: sec)[indice]
    }
    func guardarMaestro(nuevoMaestro: Maestro){
        maestros.append(nuevoMaestro)
    }
    func actualizaMaestro(at indice:Int,enFacultad seccion:Int,  with maestro: Maestro){
        let id=maestros(enFacultad: seccion)[indice].id
        for i in 0...(maestros.count-1){
            if maestros[i].id==id{
                
                maestros[i].calificacion=maestro.calificacion
                maestros[i].carreras=maestro.carreras
                maestros[i].facultad=maestro.facultad
                maestros[i].grado=maestro.grado
                maestros[i].materias=maestro.materias
                maestros[i].nombre=maestro.nombre
                maestros[i].sexo=maestro.sexo
                break
            }
        }
        
    }
    func borrarMaestro(at indice: Int, en seccion:Int){
        let id=maestros(enFacultad: seccion)[indice].id
        for i in 0...(maestros.count-1){
            if (maestros[i].id==id){
                maestros.remove(at: i)
                break
            }
        }
    }
    func numeroDeSecciones() -> Int{
        return 1
    }
    
    private func CargarMaestros() -> [Maestro] {
        return maestrosEjemplo()
    }
    
    private func maestrosEjemplo() -> [Maestro] {
        let misMaestros = [
            Maestro(nombre: "Katy", sexo: "Femenino", grado: "Mt.", calificacion: 5, facultad: "Sistemas y Computación", carreras: "Sistemas - TIC´s", materias: "POO - Programación II"),
            Maestro(nombre: "Barrón", sexo: "Femenino", grado: "Dra.", calificacion: 4, facultad: "Sistemas y Computación", carreras: "Sistemas - TIC´s", materias: "POO - Fundamentos de programación"),
            Maestro(nombre: "Cabanillas", sexo: "Masculino", grado: "Dr.", calificacion: 5, facultad: "Electrónica", carreras: "Electrónica", materias: "Fundamentos de electrónica"),
            Maestro(nombre: "Celia", sexo: "Femenino", grado: "Ing.", calificacion: 4, facultad: "Industrial", carreras: "Industrial - Gestión empresarial", materias: "Cálculo integral - Cálculo diferencial")
        ]
        
        return misMaestros
    }
}
