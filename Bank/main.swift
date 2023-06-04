import Foundation

protocol Account {
    var iban: String { get }
    var paymentSystem: PaymentSystem { get }
    var card: Card? { get set }
    var status: StatusCard { get set }
    var currency: Currency { get }
    var balance: Double { get set }
    
    func checkBalance() -> String // проверка баланса
    mutating func changeStatus(newStatus: StatusCard) // меняет статус счета - активный/закрытый
    func createAccount() // метод должен создать рандомно счет с условной приставкой KZ777
    func closeAccount() // закрытие счета
    func transaction() // метод будет реализовывать переводы со счета на другой свой счет
}
protocol Card {
    var numberCard: String { get }
    var date: Int { get }
    var cvv: Int { get }
    var holder: String { get }
    var pinCode: Int { get set }
    
    func changePinCode(newPinCode: Int)
    func createCard() // метод должен создавать карту с рандомными цифрами и рандомный cvv и сделать привязку карты к счету если нам нужна будет карта или только счет
}
struct BankAccount: Account {
    var iban: String
    var paymentSystem: PaymentSystem
    var card: Card?
    var status: StatusCard
    var currency: Currency
    var balance: Double
    
    func checkBalance() -> String {
        return "Ваш баланс составляет \(balance)"
    }
    mutating func changeStatus(newStatus: StatusCard) {
        status = newStatus
    }
    
    func createAccount() {
        
    }
    
    func closeAccount() {
        <#code#>
    }
    
    func transaction() {
        <#code#>
    }
    
}

class BankCard: Card {
    var numberCard: String
    var date: Int
    var cvv: Int
    var holder: String
    var pinCode: Int
    
    init(numberCard: String, date: Int, cvv: Int, holder: String, pinCode: Int) {
            self.numberCard = numberCard
            self.date = date
            self.cvv = cvv
            self.holder = holder
            self.pinCode = pinCode
    }
    
    func changePinCode(newPinCode: Int) {
        pinCode = newPinCode
    }
    func createCard() {
        
    }
    
    
    
}

