//: [Previous](@previous)

import Foundation

var movie1 = ("Interestelar", 1999, 9.8, "ciencia ficción")
// Copia el valor y lo devuelve
movie1.0

var (title, year, rate, type) = movie1

print(title)

var movie2: (String, Int, Double, String) = ("Tenet", 2020, 9.7, "no idea")

var movie3 = (title: "Scary movie", year: 1999, rate: 5.0, type: "comedy")

var title2 = movie1

switch movie2 {
case (_, 2021, _, _):
    print("Peli del 2020")
    fallthrough // curioso de pelotas
case (_, _, 9.3, _):
    print("Peli del 9.7")
case (_, _, 9.6, _):
    print("Peli del 9.7")
case (_, 2020, let score, _) where score > 9:
    print("Peli de más de 9 puntos y de 2020")
default: ()
}

if case (_, 1999, _, _) = movie1 { // pattern matching
    print("Peli del 1999")
}

var (a, b) = (1, 2)
(a, b) = (b, a)
print(a, b)

