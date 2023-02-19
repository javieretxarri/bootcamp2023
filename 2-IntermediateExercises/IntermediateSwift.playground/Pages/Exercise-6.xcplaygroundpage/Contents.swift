import Foundation

/*
 Ejercicio 6:
 Enviada a una función un array de números enteros, devuelve un
 diccionario en cuya clave esté cada número único en dicho array y en el
 valor las veces que aparece consecutivamente dentro del array enviado.
 */

let nums = [1, 1, 2, 3, 3, 4, 4, 1, 1, 1, 3, 5, 5, 5, 5, 5, 6, 5, 5]
let nums2 = [0, 1, 1, 2, 2]
let nums3 = [1, 2, 1, 2, 1, 1, 2, 2, 3, 3, 3]

func numberRepetitionCounts(nums: [Int]) -> [Int: Int] {
    var result: [Int: Int] = [:]
    var i = 0
    while i < nums.count {
        let num = nums[i]
        var j = i + 1
        while j < nums.count, nums[i] == nums[j] {
            j += 1
        }
        if (j - i) > 1 {
            result[num, default: 0] += (j - i)
        }
        i = j
    }

    return result
}

numberRepetitionCounts(nums: nums).forEach { print("The number \($0.key) has been present in \($0.value) times") }
print("----------------------------------")
numberRepetitionCounts(nums: nums2).forEach { print("The number \($0.key) has been present in \($0.value) times") }
print("----------------------------------")
numberRepetitionCounts(nums: nums3).forEach { print("The number \($0.key) has been present in \($0.value) times") }
