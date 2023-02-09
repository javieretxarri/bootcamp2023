//: [Previous](@previous)

import Foundation

// Unicode 15.0 [ASCIII] from ASCIII 255 -> 1 Million now with Unicode

// UTF-8

let cadena = "Hola 🏎️"
cadena.count
cadena.data(using: .utf8)

cadena.startIndex
cadena.endIndex

let inicio = cadena.index(after: cadena.startIndex)
let fin = cadena.index(cadena.startIndex, offsetBy: 2)

let c = cadena[inicio ... fin]

var cadena2 = "Pamplona"

cadena2.append(" es la leche")

print(cadena2)
cadena2.utf8CString

cadena2.lowercased()
cadena2.localizedUppercase

cadena2.contains(/Pamplona/)

/*
 #"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])"#
 */

// Fíjate en el # que es el que inicia el texto en bruto
let regex = #"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])"#

let multilinea = """
    hola
    como estás pedro
"""

let multilinea2 = "Hola pedro\nCómo estas?"

let fecha = Date.now

print(fecha)
fecha.description

let cadenaFecha = "hoy es \(fecha)"
let num = 2.45
let cadenaNum = "El valor es \(num)"

print(fecha.formatted(.iso8601))
print(fecha.formatted(date: .long, time: .shortened))
print(fecha.formatted(.dateTime.year(.twoDigits).month(.wide).day(.twoDigits)))

print(fecha.formatted(.dateTime.year(.twoDigits).month(.wide).day(.twoDigits).locale(Locale(identifier: "es"))))

let nombres = ["Javier", "Johana", "Mikel", "Pello"]

nombres.formatted(.list(type: .and))
nombres.formatted(.list(type: .or))

let string = "20:32 Wed, 30 Oct 2019"
let formatter4 = DateFormatter()
formatter4.dateFormat = "HH:mm E, d MMM y"
print(formatter4.date(from: string) ?? "Unknown date")
