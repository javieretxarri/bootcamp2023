import Foundation

/*
 Ejercicio 10:
 Escribe un programa que guarde varios tipos de alimentos y su precio por
 kilo en un diccionario. Cree una forma para mostrar qué precio tendría
 cualquiera de los productos al indicar un número de kilos específico.
 */

func calculatePricesWithGivenKilograms(list: [String: Double], kg: Double) -> [String: Double] {
    var foodAndPrices: [String: Double] = [:]
    for item in list {
        foodAndPrices[item.key] = item.value * kg
    }
    return foodAndPrices
}

let foodAndPrices = ["Meet": 100.0, "Banana": 3.0, "Apple": 4200.0, "Oragne": 2.0]
let kilogramsToBuy = 5.8

print("For list \(foodAndPrices) and buying \(kilogramsToBuy) Kg the prices are \(calculatePricesWithGivenKilograms(list: foodAndPrices, kg: kilogramsToBuy))")
