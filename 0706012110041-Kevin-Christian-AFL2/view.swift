//
//  view.swift
//  0706012110041-Kevin-Christian-AFL2
//
//  Created by MacBook Pro on 04/04/23.
//

import Foundation

func run(){
    setCafeFirst()
    setMenuFirst()
    for _ in 1...100{
        print("\n")
    }
    program()
}

func program(){
    var choiceCafe: String = ""
    var choiceCafeInt: Int
    repeat{
        mainPanel()
        choiceCafe = String(readLine()!)
        if choiceCafe > "0" && choiceCafe <= String(cafetaria.count){
            choiceCafeInt = Int(choiceCafe) ?? -1
            goToCafe(choiceCafeInt: choiceCafeInt)
        }else if choiceCafe.lowercased() == "s"{
            goToCart()
        }else if choiceCafe.lowercased() == "q"{
            print("Thankyou\nSee you\n...\n..\n.\n\n\n")
            exit(0)
        }else{
            print("Cafe \""+choiceCafe+"\" is invalid\n\n\n")
        }
    }while choiceCafe.lowercased() != "q"
}

func mainPanel(){
    print("\n\n======\nWelcome to UC-Walk Cafeteria 👨🏻‍🍳👩🏻‍🍳")
    print("Please choose cafeteria:\n")
    showCafetaria()
    print("---")
    print("[S] Shoping Cart")
    print("[Q] Quit\n")
    print("Your cafeteria choice? ", terminator: "")
}

func goToCart(){
        var cartChoice: String
    repeat{
        let countTotal = showCart()
        print("\n\nPress [B] to go Back")
        if countTotal > 0{
            print("Press [P] to pay / checkout")
        }
        print("Your choice?", terminator: " ")
        cartChoice = readLine()!.lowercased()
        
        if cartChoice == "p"{
            goToCheckout()
        }
    }while cartChoice != "b" && cartChoice != "p"
}

func goToCafe(choiceCafeInt: Int){
    var choiceMenu: String = ""
    var choiceMenuInt: Int
    repeat{
        showMenu(cafe: choiceCafeInt)
        print("---")
        print("[B] Back to Main Menu")
        print("Your menu choice? ", terminator: "")
        choiceMenu = readLine()!.lowercased()
        
        if choiceMenu == "b"{
            print("")
        }else {
            print("")
            if choiceMenu > "0" && choiceMenu <= String(cafetaria[choiceCafeInt-1].menu.count){
                choiceMenuInt = Int(choiceMenu) ?? 0
                //go to order screen
                goToOrder(choiceCafeInt: choiceCafeInt, choiceMenuInt: choiceMenuInt)
            }else{
                print("Menu \""+choiceMenu+"\" is invalid\n\n\n")
            }
        }
    }while choiceMenu != "b"
}

func goToOrder(choiceCafeInt: Int, choiceMenuInt: Int){
    var quantity: Double
    print("\n")
    
    print(cafetaria[choiceCafeInt-1].menu[choiceMenuInt-1].name, "@", cafetaria[choiceCafeInt-1].menu[choiceMenuInt-1].price)
    
    repeat{
        print("How many", cafetaria[choiceCafeInt-1].menu[choiceMenuInt-1].name.lowercased(), "do you want to buy?", terminator: " ")
        quantity = Double(readLine()!) ?? 0
        if quantity <= 0{
            print("Amount", quantity, "is invalid")
            print("\n")
        }
    }while quantity <= 0
    
    
    //add to cart
    addCart(cafe: choiceCafeInt-1, menu: cafetaria[choiceCafeInt-1].menu[choiceMenuInt-1], quantity: quantity)
}

func goToCheckout(){
    
    let bayar = checkout()
    
    
    var money: Double
    var change: Double
    print("Your total order", totalPrice)
    
    repeat{
        print("Enter the ammount of your money:", terminator: " ")
        money = Double(readLine()!) ?? 0
        
        if money <= 0 && money < totalPrice{
            print("Please enter a valid amount")
        }else if money > 0 && money < totalPrice{
            print("Please add more ammount")
        }
    }while money < totalPrice
    
    bayar.totalOrder(totalPrice)
    change = money - totalPrice
    bayar.totalPay(money)
    print("Change:", bayar.change())
    print("Enjoy your meals!")
    
    for cafe in cafetaria{
        cafe.cart = []
    }

    totalPrice = 0
    
    
    print("Press [return] to go back to main screen", terminator: "")
    let _ = readLine()
}


class checkout: pembayaran{
    var order: Double = 0
    var pay: Double = 0
    
    func change() -> Double {
        return pay - order
    }
    
    func totalOrder(_ order: Double) {
        print("Your total order \(order)")
        self.order = order
    }
    
    func totalPay(_ pay: Double) {
        print("You pay:", pay)
        self.pay = pay
    }
    
    
    
    
}
