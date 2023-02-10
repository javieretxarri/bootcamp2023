import Foundation

/*
 Ejercicio 4:
 Realice un programa capaz de determinar si una cadena contiene un valor
 que sea palíndromo. Deberá rechazar cuando la cadena contenga más de una
 palabra para evitar errores.
 ALGORITMO: Una palabra palíndroma se lee igual en ambos sentidos.
 */

func isPalindrome(string: String) -> Bool? {
    guard string.components(separatedBy: " ").count == 1 else { return nil }

    var wordToAnanlyze = string.lowercased()
    var leftPointer = 0
    var rightPointer = wordToAnanlyze.count - 1
    var leftIndex = wordToAnanlyze.startIndex
    var rightIndex = wordToAnanlyze.index(string.startIndex, offsetBy: rightPointer)

    while leftPointer < rightPointer {
        if wordToAnanlyze[leftIndex] != wordToAnanlyze[rightIndex] {
            return false
        }

        leftPointer += 1
        rightPointer -= 1
        leftIndex = string.index(string.startIndex, offsetBy: leftPointer)
        rightIndex = string.index(string.startIndex, offsetBy: rightPointer)
    }

    return true
}

for word in ["Pamplona", "Navarra", "nada", "ama", "aaabbbaaa", "amar - rama"] {
    guard let isPalindrome = isPalindrome(string: word) else {
        print("The word \(word) is not accepted")
        continue
    }

    print(#"The word "\#(word)" is palindrome: \#(isPalindrome) "#)
}
