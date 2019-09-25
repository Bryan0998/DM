import UIKit

var str = "Hello, playground"

var shoppingList=["1","2","3"]
shoppingList[1]="4"
print(shoppingList)

for x in 0 ..< 10 {
    x*x
}

var color:UIColor = .purple

var slider = UISlider(frame:CGRect(x:10,y:10,width:100,height:200))

var nombre="Jorge"
var apellido="Moya"

var nombreCompleto = nombre + apellido
print(nombreCompleto)

var alumnos:[String] = [];
alumnos = [ "jorge","moya","pedro","luis","maría","conchita","efraín"]
alumnos.insert("Francisco", at: 2)
alumnos.append("el último")

for nom in alumnos {
    print(nom)
}

for (indice,nombre) in alumnos.enumerated(){
    print("# \(indice) : \(nombre) " )
}

alumnos.first
alumnos[8]
let v2 = alumnos[1...4]

var otraLista = ["3","3"]

alumnos + otraLista

var ingredientes = Set<String>()
ingredientes = ["Sal","Azúcar","Sal del Himalaya","Orégano","Pimienta","Sal"]
print(ingredientes)
ingredientes.insert("Mostaza")
ingredientes.remove("Sal")
print(ingredientes)

var dicc:[String:String] = [:]
dicc=["kg":"Kilogramo","mg":"miligramo","ton":"tonelada"]
dicc.values
dicc.keys

dicc["kg"] = nil
for (key,value) in dicc{
    print(key + value)
}


var numeros = 20

while numeros >= 0{
    if (numeros == 0){
        print("No hay màs nùmeros")
    }
    else if (numeros == 1 ){
        print("Oh no, solo queda uno.")
    }
    else{
        print("vas en el numero \(numeros)")
    }
    numeros -= 1
}

for index in 1...51{
    switch index{
        case 0:
            print("no hay nada")
        case 1:
            print("Solo queda 1")
        case 2...30:
            print("Todo va bien")
        case 31...50:
            print("Ya todo se va a acabar")
    default:
        print("I dont know")
        
        
    }
}

func servir(_ bebida:String = "Agua", a cliente:String) ->String{
    return ("\(cliente), tu \(bebida) está servida")
}
print(servir( "Cerveza", a: "Bryan"))
print(servir( a: "Bryan"))

var nombre2:String? = "Bryan"
var saludo:String? = "Hi"
//nombre2 = nil
if let nombreNoNulo = nombre2, let saludoNoNulo = saludo{
    let msg = "Hola " + nombreNoNulo + " " + saludoNoNulo
    print("\(msg) !!!")
}


func servir2(bebida:String) -> String {
    guard bebida != "Sidral" else{
        return "No tomes Sidral"
    }
    return "Tu \(bebida) está servida"
}

servir2(bebida:"Sidral")
servir2(bebida:"Agua")


let codigo:String? = "ABCD"
let precio:String? = "1234"

let codigoNoNulo = codigo != nil ? codigo! : "Sin código"
let precioNoNulo = precio ?? "0"

let reservas = [[true,false,true],
                [false,false,true],
                [true, true,true]]

if let firstRow = reservas.first,
    let firstTable = firstRow.first{
    let msg = firstTable ? "Reservado" : "Libre"
    print("La primera mesa está \(msg) !")
}

if let primeraMesa = reservas.first?.first{
    let msg = primeraMesa ? "Reservado" : "Libre"
    print("La primera mesa está \(msg) !")
}

var producto:(String, Double)
var producto2 = ("Reloj",12.3)
print("\(producto2.0) cuesta \(producto2.1)")

var producto3 = (nombre: "Reloj", precio: 123.3)
print("\(producto3.nombre) cuesta \(producto3.precio)")

func unProducto(conNombre nombre:String) -> (nombre:String, precio :Double){
    return(nombre, 1034.333)
}

let pro4 = unProducto(conNombre: "Producto 3")

var initValues = ("producto3", 123444)
var (nom,pre) = initValues;
nom
pre



