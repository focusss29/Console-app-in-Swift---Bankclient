enum Status: String {
    case active = "Активен"
    case blocked = "Заблокирован"
    case closed = "Закрыт"
}
enum Currency: String, CaseIterable {
    case kzt = "₸"
    case usd = "$"
    case euro = "€"
    case rus = "₽"
}
enum PaymentSystem: String {
    case visa = "Visa"
    case masterCard = "MasterCard"
}
