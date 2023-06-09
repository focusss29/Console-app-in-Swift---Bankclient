struct BankAccount: Account {
    var iban: String
    var status: Status
    var balance: Double
    var currency: Currency
    
    func checkBalance() -> String {
        return "Ваш баланс составляет \(balance)"
    }
    mutating func changeStatus(newStatus: Status) {
        status = newStatus
    }
}

struct BankCard: Card {
    
    var numberCard: String
    var holder: String
    var pinCode: Int
    
    mutating func changePinCode(newPinCode: Int) {
        pinCode = newPinCode
    }
}
struct BankApp {
    var accounts: [BankAccount]
    var cards: [BankCard]?
    
    mutating func createIban() {
        print("Создание счета займет несколько минут")
        print("Выберите валюту счета:")
        for (index, cur) in Currency.allCases.enumerated() {
            print("\(index + 1). \(cur.rawValue)")
        }
        let choiceCurrency = readLine() ?? ""
        guard let index = Int(choiceCurrency), index > 0,
              index <= Currency.allCases.count else {
            print("Недоступная валюта!")
            return
        }
        let currency = Currency.allCases[index - 1]
        var iban: String = ""
        var randomIban = ""
        for _ in 1...16 {
            let ibanGenerate = String(Int.random(in: 1...9))
            randomIban += ibanGenerate
        }
        iban = "KZ77" + randomIban
        print("--------------------")
        print("Ваш счет создан! IBAN: \(iban)")
        let account = BankAccount(iban: iban, status: .active, balance: 10_000.00, currency: currency )
        accounts.append(account)
        print("--------------------")
    }
    mutating func infoAccount() {
        print("Информация о счетах:")
        print("--------------------")
        for (index, account) in accounts.enumerated() {
            print("Счет №\(index + 1)")
            print("IBAN: \(account.iban)")
            print("Статус: \(account.status.rawValue)")
            print("Баланс: \(account.balance)")
            print("Валюта: \(account.currency.rawValue)")
            print("--------------------")
        }
    }
    mutating func createCard() {
        print("Создание карты займет несколько минут")
        print("Введите Имя и Фамилию:")
        let name = readLine()?.uppercased() ?? ""
        var numberCard = ""
        for _ in 1...20 {
            let numberGenerate = String(Int.random(in: 1...9))
            numberCard += numberGenerate
        }
        let card = BankCard(numberCard: numberCard, holder: name, pinCode: 1234)
        print("Карта успешна создана!")
        print("--------------------")
        print("Номер карты: \(card.numberCard)")
        print("Держатель карты: \(card.holder)")
        print("Пин-код: \(card.pinCode)")
        print("--------------------")
    }
    mutating func closeAccount() {
        print("Доступные счета:")
        for (index, iban) in accounts.enumerated() {
            print("\(index + 1). \(iban.iban)")
        }
        print("Выберите номер счета, который хотите закрыть:")
        if let closeAccount = readLine(),
           let accountIndex = Int(closeAccount),
           accountIndex > 0, accountIndex <= accounts.count {
            let index = accountIndex - 1
            let account = accounts[index]
            print("Вы уверены, что хотите закрыть счет \(account.iban)? Да / Нет")
            let answer = readLine()?.lowercased()
            if answer == "да" {
                accounts.remove(at: index)
                print("Счет успешно закрыт!")
                print("--------------------")
            } else {
                print("Отмена операции.")
                print("--------------------")
            }
        } else {
            print("Данного номера не существует!")
            print("--------------------")
        }
    }
    mutating func transfer() {
        print("Выберите счет-отправитель:")
        for (index, iban) in accounts.enumerated() {
            print("\(index + 1). \(iban.iban)")
        }
        if let transfer1 = readLine(),
           let accountIndex = Int(transfer1),
           accountIndex > 0, accountIndex <= accounts.count {
            let senderIndex = accountIndex - 1
            var senderAccount = accounts[senderIndex]
            print("--------------------")
            print("Выберите счет-получатель:")
            for (index, iban) in accounts.enumerated() {
                print("\(index + 1). \(iban.iban)")
            }
            if let transfer2 = readLine(),
               let accountIndex = Int(transfer2),
               accountIndex > 0, accountIndex <= accounts.count {
                let recipientIndex = accountIndex - 1
                var recipientAccount = accounts[recipientIndex]
                print("--------------------")
                print("Введите сумму перевода:")
                if let amount = readLine(),
                   let amountDouble = Double(amount),
                   amountDouble > 0 {
                    if senderAccount.balance >= amountDouble {
                        senderAccount.balance -= amountDouble
                        recipientAccount.balance += amountDouble
                        print("--------------------")
                        print("Перевод выполнен!")
                        print("Счет-отправитель: \(senderAccount.iban)")
                        print("Cчет-получатель: \(recipientAccount.iban)")
                        print("--------------------")
                        accounts[senderIndex] = senderAccount
                        accounts[recipientIndex] = recipientAccount
                    } else {
                        print("Недостаточно средств!")
                        print("--------------------")
                    }
                } else {
                    print("Некорректная сумма для перевода!")
                    print("--------------------")
                }
                
            } else {
                print("Некорректный счет-получателя!")
                print("--------------------")
            }
            
        } else {
            print("Некоректный счет-отправитель!")
            print("--------------------")
        }
    }
}
