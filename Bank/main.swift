import Foundation

protocol Account {
    var iban: [String] { get set }
    var card: Card? { get set }
    var status: Status { get set }
    var currency: Currency { get }
    var balance: Double { get set }
    
    //------------- методы необходимые для счета
    
    func checkBalance() -> String // проверка баланса
    func changeStatus(newStatus: Status) // меняет статус счета - активный/закрытый
    func createAccount() // метод должен создать рандомно счет с условной приставкой KZ77
    func closeAccount() // закрытие счета
    func transaction(from: Int, at: Int) // метод будет реализовывать переводы со счета на другой свой счет
}
protocol Card {
    var numberCard: String { get }
    var date: Int { get }
    var cvv: Int { get }
    var holder: String { get }
    var pinCode: Int { get set }
    var paymentSystem: PaymentSystem { get }
    
    // ------------ методы необходимые для карты
    
    func changePinCode(newPinCode: Int)
    func createCard() // метод должен создавать карту с рандомными цифрами и рандомный cvv и сделать привязку карты к счету если нам нужна будет карта или только счет
}
class BankAccount: Account {
    var iban: [String]
    var card: Card?
    var status: Status
    var currency: Currency
    var balance: Double
    
    init(iban: [String], card: Card?, status: Status, currency: Currency, balance: Double) {
        self.iban = iban
        self.card = card
        self.status = status
        self.currency = currency
        self.balance = balance
    }
    
    func checkBalance() -> String {
        return "Ваш баланс составляет \(balance) \(currency)"
    }
    func changeStatus(newStatus: Status) {
        status = newStatus
    }
    
    func createAccount() {
        var newIban: String = ""
        var randomIban = ""
        for _ in 1...16 {
            let ibanGenerate = Int.random(in: 1...9)
            randomIban += "\(ibanGenerate)"
        }
        newIban = "IBAN: KZ77" + randomIban
        iban.append(newIban)
    }
    
    func closeAccount() {
        iban.removeAll()
        status = .closed
        balance = 0
        card = nil
    }
    
    func transaction(from: Int, at: Int) {
        
    }
    
}

class BankCard: Card {
    var numberCard: String
    var date: Int
    var cvv: Int
    var holder: String
    var pinCode: Int
    var paymentSystem: PaymentSystem
    
    init(numberCard: String, date: Int, cvv: Int, holder: String, pinCode: Int, paymentSystem: PaymentSystem) {
            self.numberCard = numberCard
            self.date = date
            self.cvv = cvv
            self.holder = holder
            self.pinCode = pinCode
            self.paymentSystem = paymentSystem
    }
    
    func changePinCode(newPinCode: Int) {
        pinCode = newPinCode
    }
    func createCard() {
        
    }
}


