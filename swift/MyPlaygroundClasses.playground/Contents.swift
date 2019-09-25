import UIKit

class Alumno{
    static let origen = "México"
    var nombre:String
    var apellido:String
    init(nombre:String,apellido:String){
        self.nombre = nombre
        self.apellido = apellido
    }
    
    var nombreCompleto:String {
        get{
            return "\(nombre) \(apellido)"
        }
        set(nomCompleto){
            self.nombre = nomCompleto
            self.apellido = ""
        }
    }
    
    convenience init(nombreUnico:String){
        self.init(nombre: nombreUnico, apellido: "")
    }
    
    func diHola() -> String {
        return "\(nombre) dice hola !!!"
    }
    static func coff() -> String{
        return "Coff coff"
    }
}
protocol PuedeVolar{
    var velocidad:Int { get set }
    func volar()
    func aterrizar()
}

extension PuedeVolar{
    func volar(){
        print("Volando a \(velocidad)")
    }
    func aterrizar(){
        print("Aterrizando a \(velocidad)")
    }
}

class SuperAlumno : Alumno , PuedeVolar{
    var velocidad:Int = 0
    
    func beSuper() -> String{
        return "\(self.nombre) dice hola !!!"
    }
    
    override func diHola() -> String {
        return "Super dice super, \(self.nombre) dice hola !!!"
    }
    
    func aterrizar(){
        print("Aterrizando")
    }
    func volar(){
        print("Volando")
    }
}



class Persona{
    var nombre:String = ""
    var edad:Int = 0
}

let jorge = Alumno(nombre: "Jorge",apellido: "Moya")

Alumno.origen

let msg = "hola " + jorge.nombre
jorge.diHola()

var superM = SuperAlumno(nombre: "Clark", apellido: "Kent")
superM.diHola()
superM.beSuper()



struct colorStruct {
    var name:String = "blanco"
}

var rojo = colorStruct()

rojo.name = "rojo"
let red = colorStruct(name: "red")
rojo.name
red.name

extension Alumno{
    func pasaMateria(mat:String) -> String {
        return "\(self.nombre) \(self.apellido) pasa la materia \(mat)"
    }
}

jorge.pasaMateria(mat: "POO")

extension Dictionary{
    func add(otro:Dictionary) -> Dictionary{
        var retDictionary : Dictionary = self
        for (key, value) in otro {
            retDictionary[key] = value
        }
        return retDictionary
    }
    static func +(left:Dictionary, right:Dictionary) -> Dictionary{
        var retDictionary : Dictionary = left
        for (key, value) in right {
            retDictionary[key] = value
        }
        return retDictionary
    }

}
func +<TKey,TValue>(left:[TKey:TValue], right:[TKey:TValue]) -> [TKey:TValue]{
    var retDictionary = left
    for (key, value) in right {
        retDictionary[key] = value
    }
    return retDictionary
}

var lenguaje1 = ["eng":"English", "esp":"Español"]
var lenguaje2 = ["due":"Alemnán","chi": "chino"]

lenguaje1.add(otro: lenguaje2)
