import Foundation

/*
 Tipos de datos nativos

 Int -> desde 8 a 64bits
 UInt(sin signo) -> desde 8 a 64bits
 Double -> 64bits y 15 decimales
 Float -> 32bits y 6 decimales; 16 bits y 3 decimales
 Bool -> true or false
 Character -> "u{\45}"
 -------------
 String -> Cadena
 Date -> Fecha
 Data -> Tipo de dato en bruto (array de bytes)
 URL -> Localizador uniforme de recursos
 esquema://dominio/rutas
 */

let cadenaConstante: String = "Hola"
var variableNumerica: Int

// cadenaConstante = "Adios" -- No se puede porque es una constante
variableNumerica = 99

print(variableNumerica)

variableNumerica = Int(55.78)

print(variableNumerica.isMultiple(of: 2))

cadenaConstante.count

let valor = 2
var cadena = "Agur"
let flotante: Double = .init(valor)

let flotante2 = Double(valor)

typealias Cadena = String
var cadenaSpanish: Cadena = "Egunon"

let value: Float16 = 8.75

var valor2: Character = "C"

let fecha = Date()
let now = Date.now

let bytes = Data(count: 300)

var execute = true

repeat {
    var city = "Iruña"
    print(city)
    execute = false && true
} while execute

var city = "Leon"
print(city)

_ = "Pamplona"

let cara = "😅"

let año = 2000

let 😅 = "AUCH!!!"

print(😅 == "AUCH!!!")
