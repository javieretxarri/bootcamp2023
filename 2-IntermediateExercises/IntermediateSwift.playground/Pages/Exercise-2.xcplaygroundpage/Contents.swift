import Foundation

/*
 Ejercicio 2:
 Realiza una función que analice un texto y devuelva el número de
 palabras del mismo, su longitud completa, y qué longitud tiene cada
 palabra que aparezca en dicho texto en un listado.
 */

extension String {
    var numberOfWords: Int {
        components(separatedBy: [" ", "\n", ".", ",", ";", ":"])
            .filter { $0.count > 0 }
            .count
    }

    var phraseLength: Int {
        self.count
    }

    var wordsLengthCount: [String: Int] {
        components(separatedBy: [" ", "\n", ".", ",", ";", ":"])
            .filter { $0.count > 0 }
            .reduce(into: [:]) { $0[$1, default: 0] = $1.count }
    }
}

let phrase = String("""
El Ayuntamiento de Pamplona podría licitar el proyecto de reurbanización de la Plaza de la Cruz sin contar con partida presupuestaria, pero necesita el respaldo del Pleno, donde Navarra Suma no tiene mayoría, para continuar el proyecto y evitar posibles reclamaciones.
RELACIONADAS
¿De dónde van a salir los 2,5 millones de euros del parking de la Plaza de la Cruz?
Esta es la conclusión del informe elaborado por el Secretario municipal a instancias de los tres grupos de la oposición para determinar la legalidad del expediente iniciado por el equipo de Gobierno para reformar la Plaza de la Cruz, proyecto que incluye la construcción un aparcamiento subterráneo.
El proyecto de parking en la plaza de la Cruz se complica: la oposición pide un informe por la financiación
El proyecto de parking en la plaza de la Cruz se complica: la oposición pide un informe por la financiación
Kepa García
La duda que el Secretario debía aclarar en su informe se refería a si era posible licitar las obras sin que exista partida presupuestaria municipal para ello, en concreto los 2,5 millones de euros de la reurbanización de la Plaza de la Cruz; y si el Pleno resultante de las próximas elecciones estaría comprometido en tal caso.
Evitar daños y perjuicios
La conclusión del Secretario es que el alcalde Maya necesita la autorización del Pleno con el fin de garantizar la aprobación presupuestaria del crédito con el que atender las obligaciones económicas futuras derivadas del contrato de las obras de reurbanización a adjudicar, de las que podrían derivar responsabilidades por daños y perjuicios a satisfacer por este Ayuntamiento.
Según explica, cuando se pretenda la tramitación anticipada de expedientes de contratación que no tengan su reflejo presupuestario, será necesario la autorización plenaria para no hurtar las legítimas competencias al Pleno de la Corporación a la hora de aprobar sus presupuestos, en una interpretación integradora de la legislación de régimen local.
El Secretario recuerda que lo contrario podría derivar en responsabilidades por daños y perjuicios a satisfacer por este Ayuntamiento y apela a los principios de buena fe y confianza legítima depositada por el futuro adjudicatario en esta Administración.
""")

func getSomePhraseProperties(phrase: String) -> (Int, Int, [String: Int]) {
    return (numberOfWords: phrase.numberOfWords, phraseLength: phrase.phraseLength, wordsLengthCount: phrase.wordsLengthCount)
}

let (numberOfWords, phraseLength, wordsLengthCount) = getSomePhraseProperties(phrase: phrase)
print("The number of words is \(numberOfWords), the length of the phrase is \(phraseLength) and the words length is ")
wordsLengthCount
    .sorted(by: { $0.value > $1.value })
    .forEach { print("\($0.key): \($0.value)") }
