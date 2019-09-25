import UIKit

var str = "Hello, playground"

var precios = [1,2,3,4,5,6]

var f1 = {(precio:Int)
        -> Int in
            return precio + 1
}

let preciosNuevos = precios.map( { precio in precio + 1 } )
preciosNuevos
let preciosAltos = precios.filter({ $0 > 3 })
preciosAltos

let total = precios.reduce(0,
                           {suma, i in suma + i
})
total

let ordenados = precios.sorted(by: { (lhs:Int, rhs:Int) in return lhs > rhs })
ordenados
