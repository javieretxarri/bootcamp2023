import SwiftUI

// Forma más simple
UserDefaults.standard.setValue("little", forKey: "Fichas")
let fichasValue = UserDefaults.standard.string(forKey: "Fichas")

// Wrapper for UserDefaults
// @AppStorage("language") var language: String = "es"

let texto = """
JSON (acrónimo de JavaScript Object Notation, 'notación de objeto de JavaScript') es un formato de texto sencillo para el intercambio de datos. Se trata de un subconjunto de la notación literal de objetos de JavaScript, aunque, debido a su amplia adopción como alternativa a XML, se considera un formato independiente del lenguaje.

Una de las supuestas ventajas de JSON sobre XML como formato de intercambio de datos es que resulta mucho más sencillo escribir un analizador sintáctico (parser) para él. En JavaScript, un texto JSON se puede analizar fácilmente usando la función eval(), algo que (debido a la ubicuidad de JavaScript en casi cualquier navegador web) ha sido fundamental para que haya sido aceptado por parte de la comunidad de desarrolladores AJAX.

En la práctica, los argumentos a favor de la facilidad de desarrollo de analizadores o de sus rendimientos son poco relevantes, debido a las cuestiones de seguridad que plantea el uso de eval() y el auge del procesamiento nativo de XML incorporado en los navegadores modernos. Por esa razón, JSON se emplea habitualmente en entornos donde el tamaño del flujo de datos entre cliente y servidor es de vital importancia (de aquí su uso por Yahoo!, Google, Mozilla, etc, que atienden a millones de usuarios) cuando la fuente de datos es explícitamente de fiar y donde no es importante el hecho de no disponer de procesamiento XSLT para manipular los datos en el cliente.

Si bien se tiende a considerar JSON como una alternativa a XML, lo cierto es que no es infrecuente el uso de JSON y XML en la misma aplicación; así, una aplicación de cliente que integra datos de Google Maps con datos meteorológicos en SOAP (Simple Object Access Protocol) necesita hacer uso de ambos formatos.

En diciembre de 2005, Yahoo! comenzó a dar soporte opcional de JSON en algunos de sus servicios web.1
"""

let url = URL.documentsDirectory.appending(path: "texto.txt")
let url2 = URL.documentsDirectory.appending(path: "texto2.txt")

try? texto.write(to: url,
                 atomically: true,
                 encoding: .utf8)

if let data = texto.data(using: .utf8) {
    try? data.write(to: url2, options: .atomic)
}

print(url)
if let data = try? Data(contentsOf: url) {
    print(data)
    let cadena = String(data: data, encoding: .utf8)
}

let textoLeido = try? String(contentsOf: url)
if let textoLeido {
    print(textoLeido)
}
