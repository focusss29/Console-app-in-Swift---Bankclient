import Foundation


var bank = BankApp(accounts: [], cards: [])
var greeting: String = "Добро пожаловать в FocusBank!"
var start: Bool = true


while start {
    print("Выберите операцию:")
    print("1. Создание счета")
    print("2. Информация о доступных счетах")
    print("3. Создание карты")
    print("4. Закрытие счета")
    print("5. Перевод между своими счетами")
    print("6. Выход")
    
    if let input = readLine(),
       let bankMenu = Int(input) {
        
        switch bankMenu {
        case 1:
            bank.createIban()
        case 2:
            bank.infoAccount()
        case 3:
            bank.createCard()
        case 4:
            bank.closeAccount()
        case 5:
            bank.transfer()
        case 6:
            print("Выход из приложения")
            start = false
        default:
            print("Выберите доступную операцию из списка!")
        }
    }
}













