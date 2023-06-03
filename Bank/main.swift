import Foundation

protocol Account {
    var paymentSystem: PaymentSystem { get }
    var card: Card? { get set }
    var status: StatusCard { get set }
    var currency: Currency { get }
    var balance: Double { get set }
    
    func checkBalance() -> String
    func changePinCode(pinCode: Int)
    func changeStatus(status: StatusCard)
    func createCard(card: Card) -> [Card]
    func closeCard(card: Card) -> [Card]
    func transaction()
}
protocol Card {
    var numberCard: String { get }
    var date: Int { get }
    var cvv: Int { get }
    var holder: String { get }
    var pinCode: Int { get set }
}


