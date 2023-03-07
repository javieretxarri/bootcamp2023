import UIKit

actor BankAccount {
    var balance: Decimal
    nonisolated let name: String

    init(name: String, balance: Decimal) {
        self.name = name
        self.balance = balance
    }

    nonisolated func showName() -> String {
        name.uppercased()
    }

    func deposit(amount: Decimal) {
        balance += amount
    }

    func transfer(amount: Decimal, to bankAccount: BankAccount) async {
        guard balance > amount else { return }
        balance -= amount
        await bankAccount.deposit(amount: amount)
    }
}

let cuenta1 = BankAccount(name: "cuenta1", balance: 10000)
let cuenta2 = BankAccount(name: "cuenta2", balance: 15000)

print(cuenta1.name)
print(cuenta1.showName())

Task.detached(priority: .high) {
    await cuenta1.balance
    await cuenta1.deposit(amount: 5000)
    await cuenta1.transfer(amount: 7000, to: cuenta2)
}

Task.detached(priority: .high) {
    await cuenta2.balance
    await cuenta2.deposit(amount: 5000)
    await cuenta2.transfer(amount: 7000, to: cuenta1)

    await cuenta2.balance
    await cuenta1.balance
}
