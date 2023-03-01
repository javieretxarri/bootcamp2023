import UIKit

let JSON = """
{
  "departamento":8,
  "nombredepto":"Ventas",
  "director": "Juan Rodríguez",
  "empleados":[
    {
      "nombre":"Pedro",
      "apellido":"Fernández"
    },{
      "nombre":"Jacinto",
      "apellido":"Benavente"
    }
  ]
}
"""

let jsonDATA = JSON.data(using: .utf8)!

var departamente = try! JSONSerialization.jsonObject(with: jsonDATA) as! [String: Any]

departamente["empleados"]

let dptId = departamente["departamento"] as? Int
let director = departamente["director"] as? String

departamente["director"] = "Pepito flores"

let data = try! JSONSerialization.data(withJSONObject: departamente, options: .prettyPrinted)
print(String(data: data, encoding: .utf8)!)

