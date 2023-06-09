protocol Account {
    var iban: String { get set }
    var status: Status { get set }
    var balance: Double { get }
    var currency: Currency { get }
    
    func checkBalance() -> String
    mutating func changeStatus(newStatus: Status)
}
protocol Card {
    var numberCard: String { get }
    var holder: String { get }
    var pinCode: Int { get set }
    
    mutating func changePinCode(newPinCode: Int)
}

