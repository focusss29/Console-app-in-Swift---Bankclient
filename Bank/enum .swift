enum Status: String {
    case available = "Доступен"
    case blocked = "Заблокирован"
    case closed = "Закрыт"
}
enum Currency: String {
    case kzt = "₸"
    case usd = "$"
    case euro = "€"
    case rus = "₽"
}
enum PaymentSystem: String {
    case visa = "Visa"
    case masterCard = "MasterCard"
}
