import UIKit

let serial = DispatchQueue(label: "com.acacademy.serialQueue")
let concurrent = DispatchQueue(label: "com.acacademy.concurrentQueue", attributes: .concurrent) // initially inactive para que no empiece a despachar nada más entrar

print("Comienzo")
// Cola global concurrente que empieza según se meten cosas
DispatchQueue.global().async {
    print("Pasan cositas")
}

DispatchQueue.global().sync {
    sleep(2)
    print("Pasan cositas xk soy Synchronized")
}

print("Finish")

// NUNCA USAR SYNC aquí
DispatchQueue.main.async {
    print("Soy el jefe de las colas")
}

serial.asyncAfter(deadline: .now() + 5) {
    print("Soy un async delayeado 5 segundos")
}

// Con respecto a asyncAfter es que le metemos una tolerancia
concurrent.schedule(after: .init(.now() + 6), tolerance: .milliseconds(200)) {
    print("Soy un schedule que va a los 6 segundos")
}

// serial.async {
//    print("T1 Begin")
//    sleep(2)
//    print("T1 Ends")
// }
//
// serial.async {
//    print("T2 Begin")
//    sleep(2)
//    print("T2 Ends")
// }
//
// serial.async {
//    print("T3 Begin")
//    sleep(2)
//    print("T3 Ends")
// }

concurrent.async {
    print("T1 Begin")
    sleep(2)
    print("T1 Ends")
}

concurrent.async {
    print("T2 Begin")
    sleep(2)
    print("T2 Ends")
}

concurrent.async {
    print("T3 Begin")
    sleep(2)
    print("T3 Ends")
}
