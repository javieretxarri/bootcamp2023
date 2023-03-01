import Foundation

extension Notification.Name {
    static let miNotificacion = Notification.Name("MINOTIFICACIONMOLONA")
}

final class Emisor {
    var timer: Timer!

    init(seconds: TimeInterval) {
        self.timer = Timer.scheduledTimer(withTimeInterval: seconds, repeats: false) { _ in
            NotificationCenter.default.post(name: .miNotificacion, object: "Mensaje secreto \(Int.random(in: 1 ... 20))")
        }
    }
}

final class Receptor {
    var mensaje: String = "" {
        didSet {
            print("Nuevo mensaje: \(mensaje)")
        }
    }

    init() {
        NotificationCenter.default.addObserver(forName: .miNotificacion, object: nil, queue: .main) { notification in
            if let msg = notification.object as? String {
                print(msg)
                self.mensaje = msg
            }
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: .miNotificacion, object: nil)
    }
}

let emisor = Emisor(seconds: 2)
let receptor = Receptor()
