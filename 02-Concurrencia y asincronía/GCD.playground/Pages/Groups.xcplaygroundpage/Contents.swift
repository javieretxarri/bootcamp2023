import UIKit

// let group = DispatchGroup()
//
// DispatchQueue.global().async(group: group) {
//    print("C1")
//    sleep(1)
//    print("F1")
// }
//
// DispatchQueue.global().async(group: group) {
//    print("C2")
//    sleep(1)
//    print("F2")
// }
//
// DispatchQueue.global().async(group: group) {
//    print("C3")
//    sleep(1)
//    print("F3")
// }
//
//// group.wait()
//
// group.notify(queue: .main) {
//    print("Notification se acabo")
// }

print("Finish")

func load(delay: Int, completion: @escaping () -> Void) {
    DispatchQueue.global().asyncAfter(deadline: .now() + TimeInterval(delay)) {
        completion()
    }
}

// let concurrent = DispatchQueue(label: "com.acacademy.concurrent", attributes: .concurrent)

// concurrent.async {
let group2 = DispatchGroup()

for i in 1 ... 5 {
    group2.enter()
    print("inicio carga\(i)")
    load(delay: 10 - i) {
        print("Fin Carga \(i)")
        group2.leave()
    }
}

group2.wait()
print("Se acabo todo")
// }
