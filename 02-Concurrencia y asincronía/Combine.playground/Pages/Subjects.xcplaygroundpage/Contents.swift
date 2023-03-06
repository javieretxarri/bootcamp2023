import Combine
import Foundation

var subject = PassthroughSubject<Int, Never>()

var subscribers = Set<AnyCancellable>()

subject.send(0)

subject.sink { num in
    print(num)
}
.store(in: &subscribers)

subject.send(2)
subject.send(3)

subject.send(completion: .finished)

subject.send(4)

var currentValue = CurrentValueSubject<Int, Never>(9)

currentValue.value
// currentValue.send(10)

// según se crea el subscriptor emite el primer valor
currentValue.sink { num in
    print("currentValue \(num)")
}
.store(in: &subscribers)

currentValue.send(12)
sleep(1)
currentValue.send(13)
sleep(1)
currentValue.value

currentValue.send(completion: .finished)

currentValue.send(14)
