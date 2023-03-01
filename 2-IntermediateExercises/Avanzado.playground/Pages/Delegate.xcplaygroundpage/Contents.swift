import AVFoundation
import Foundation

protocol RelojDelegate {
    func llegoHora()
}

final class MiReloj {
    var timer: Timer!
    var delegate: RelojDelegate?

    init(seconds: TimeInterval) {
        self.timer = Timer.scheduledTimer(timeInterval: seconds,
                                          target: self,
                                          selector: #selector(fin),
                                          userInfo: nil,
                                          repeats: false)
    }

    @objc func fin() {
        print("FIN")
        delegate?.llegoHora()
    }
}

// let miReloj = MiReloj(seconds: 2.0)

final class MiPantalla: RelojDelegate {
    func arrancarTimer(seconds: TimeInterval) {
        let reloj = MiReloj(seconds: seconds)
        reloj.delegate = self // as RelojDelegate
    }

    func llegoHora() {
        print("Soy mi pantalla y he llegado al fin")
    }
}

let pantalla = MiPantalla()
pantalla.arrancarTimer(seconds: 2)

final class GameSFX: NSObject, AVAudioPlayerDelegate {
    let player: AVAudioPlayer

    init(file: String) throws {
        guard let url = Bundle.main.url(forResource: file, withExtension: "mp3") else {
            throw NSError(domain: "Sonido", code: 1)
        }
        self.player = try AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
    }

    func play() {
        player.delegate = self
        player.play()
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        player.delegate = nil
        if flag {
            print("Esto ha terminado de cojones")
        } else {
            print("Esto ha sido una catastrofe de cojones")
        }
    }
}

let gameAudio = try? GameSFX(file: "groan1")
gameAudio?.play()
