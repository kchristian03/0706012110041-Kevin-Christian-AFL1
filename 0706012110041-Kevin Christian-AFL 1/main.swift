//
//  main.swift
//  0706012110041-Kevin Christian-AFL 1
//
//  Created by MacBook Pro on 03/03/23.
//

import Foundation


var cafeteria: [String] = []

var menu_tukutuku: [String:Int] = ["Nasi Goreng":12000, "Mie Goreng":12000, "Tahu Isi":6000, "Pop Mie":6000, "Air Mineral":3000]
var menu_gotri: [String:Int] = ["Nasi Goreng":25000, "Mie Goreng":25000]
var menu_madamlie: [String:Int] = ["Nasi Sayur":25000, "Ayam Geprek":25000, "Es Teh":5000]
var menu_kopte: [String:Int] = ["Kopi Hitam":20000, "Moca":12000, "Kopi Pahit":6000]
var menu_xiangjia: [String:Int] = ["Nasi Tim":25000, "Ayam Tim":25000, "Teh Manis":5000]
var menu_raburi: [String:Int] = ["Paket 1":30000, "Paket Valentine":50000, "Paket Spesial":100000]
var menu_enw: [String:Int] = ["America":25000, "Cheese Mexico":25000, "Japan Salad":25000]
var menu_gijoe: [String:Int] = ["Blue Ocean":12000, "Orange Splash":12000, "Paket Keluarga":50000]

var cafeteriaXmenu: [String:Dictionary] = ["Tuku - Tuku":menu_tukutuku, "Gotri":menu_gotri, "Madam Lie":menu_madamlie, "Kopte":menu_kopte, "Xiang Jia":menu_xiangjia, "Raburi":menu_raburi, "E&W":menu_enw, "GI Joe":menu_gijoe]

var cart_tukutuku: [String:Int] = [:]
var cart_gotri: [String:Int] = [:]
var cart_madamlie: [String:Int] = [:]
var cart_kopte: [String:Int] = [:]
var cart_xiangjia: [String:Int] = [:]
var cart_raburi: [String:Int] = [:]
var cart_enw: [String:Int] = [:]
var cart_gijoe: [String:Int] = [:]

var totalOrder: Int = 0

run()

func run(){
    var choiceCafe: String = ""
    var choiceCafeInt: Int
    setCafeteria()
    repeat{
        mainPanel()
        choiceCafe = String(readLine()!)
        if choiceCafe > "0" && choiceCafe <= String(cafeteria.count){
            choiceCafeInt = Int(choiceCafe) ?? -1
            goToCafe(choiceCafeInt: choiceCafeInt)
        }else if choiceCafe.lowercased() == "s"{
            printCart()
        }else if choiceCafe.lowercased() == "q"{
            print("Thankyou\nSee you\n...\n..\n.\n\n\n")
            exit(0)
        }else{
            print("Cafe \""+choiceCafe+"\" is invalid\n\n\n")
        }
    }while choiceCafe.lowercased() != "q"
}


func mainPanel(){
    var i = 1;
    print("\n\n======\nWelcome to UC-Walk Cafeteria 👨🏻‍🍳👩🏻‍🍳")
    print("Please choose cafeteria:\n")
    for cafe in cafeteria{
        print("["+String(i)+"]", cafe)
        i+=1
    }
    print("---")
    print("[S] Shoping Cart")
    print("[Q] Quit\n")
    print("Your cafeteria choice? ", terminator: "")
}

func setCafeteria(){
    cafeteria.append("Tuku - Tuku")
    cafeteria.append("Gotri")
    cafeteria.append("Madam Lie")
    cafeteria.append("Kopte")
    cafeteria.append("Xiang Jia")
    cafeteria.append("Raburi")
    cafeteria.append("E&W")
    cafeteria.append("GI Joe")
}

func goToCafe(choiceCafeInt: Int){
    var choiceMenu: String = ""
    var choiceMenuInt: Int
    repeat{
        var i: Int = 1
        print("\n\n======\nHi, welcome back to", cafeteria[choiceCafeInt - 1] + "!")
        print("What would you like to order?\n")
        
        if choiceCafeInt == 1{
            for menu in menu_tukutuku{
                print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
                i+=1
            }
        }else if choiceCafeInt == 2{
            for menu in menu_gotri{
                print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
                i+=1
            }
        }else if choiceCafeInt == 3{
            for menu in menu_madamlie{
                print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
                i+=1
            }
        }else if choiceCafeInt == 4{
            for menu in menu_kopte{
                print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
                i+=1
            }
        }else if choiceCafeInt == 5{
            for menu in menu_xiangjia{
                print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
                i+=1
            }
        }else if choiceCafeInt == 6{
            for menu in menu_raburi{
                print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
                i+=1
            }
        }else if choiceCafeInt == 7{
            for menu in menu_enw{
                print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
                i+=1
            }
        }else if choiceCafeInt == 8{
            for menu in menu_gijoe{
                print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
                i+=1
            }
        }
        
        
        
        print("---")
        print("[B] Back to Main Menu")
        print("Your menu choice? ", terminator: "")
        choiceMenu = readLine()!.lowercased()
        
        if choiceMenu == "b"{
            print("")
        }else {
            print("")
            print("choice menu int", choiceMenu)
            if choiceMenu > "0" && choiceMenu <= String(cafeteriaXmenu[cafeteria[choiceCafeInt - 1]]?.count ?? 0){
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
    var quantity: Int
    print("\n")
    var menuKey: String = ""
    let menu = cafeteriaXmenu[cafeteria[choiceCafeInt-1]]
    menuKey = indexToKey(indexMenu: choiceMenuInt, indexCafe: choiceCafeInt)
    
    print(menuKey, "@", menu?[menuKey] ?? "null")
    
    repeat{
        print("How many", menuKey.lowercased(), "do you want to buy?", terminator: " ")
        quantity = Int(readLine()!) ?? 0
        if quantity <= 0{
            print("Amount", quantity, "is invalid")
            print("\n")
        }
    }while quantity <= 0
    
    var totalPrice = (menu?[menuKey] ?? 0) * quantity
    totalOrder += totalPrice
    
    //add to cart
    addToCart(indexCafe: choiceCafeInt, menuKey: menuKey, quantity: quantity)
    
}

func printCheckout(){
    var money: Int
    var change: Int
    print("Your total order", totalOrder)
    
    repeat{
        print("Enter the ammount of your money:", terminator: " ")
        money = Int(readLine()!) ?? 0
        
        if money <= 0 && money < totalOrder{
            print("Please enter a valid amount")
        }else if money > 0 && money < totalOrder{
            print("Please add more ammount")
        }
    }while money < totalOrder
    
    print("Your total order", totalOrder)
    change = money - totalOrder
    print("You pay:", money, "Change:", change)
    print("Enjoy your meals!")
    
    cart_tukutuku = [:]
    cart_gotri = [:]
    cart_madamlie = [:]
    cart_kopte = [:]
    cart_xiangjia = [:]
    cart_raburi = [:]
    cart_enw = [:]
    cart_gijoe = [:]

    totalOrder = 0
    
    print("Press [return] to go back to main screen", terminator: "")
    let _skip = readLine()
}

func printCart(){
    var cartChoice: String
    repeat{
        let countTotal = cart_tukutuku.count + cart_gotri.count + cart_madamlie.count + cart_kopte.count + cart_xiangjia.count + cart_raburi.count + cart_enw.count + cart_gijoe.count
        if countTotal <= 0{
            print("\n\nYour cart is empty\n\n")
        }else{
            print("\n")
            if cart_tukutuku.count > 0{
                print("\nYour order from Tuku-Tuku:")
                for cart in cart_tukutuku{
                    print("-", cart.key, "x" + String(cart.value))
                }
            }
            if cart_gotri.count > 0{
                print("\nYour order from Gotri:")
                for cart in cart_gotri{
                    print("-", cart.key, "x" + String(cart.value))
                }
            }
            if cart_madamlie.count > 0{
                print("\nYour order from Madamlie:")
                for cart in cart_madamlie{
                    print("-", cart.key, "x" + String(cart.value))
                }
            }
            if cart_kopte.count > 0{
                print("\nYour order from Kopte:")
                for cart in cart_kopte{
                    print("-", cart.key, "x" + String(cart.value))
                }
            }
            if cart_xiangjia.count > 0{
                print("\nYour order from Xiang Jia:")
                for cart in cart_xiangjia{
                    print("-", cart.key, "x" + String(cart.value))
                }
            }
            if cart_raburi.count > 0{
                print("\nYour order from Raburi:")
                for cart in cart_raburi{
                    print("-", cart.key, "x" + String(cart.value))
                }
            }
            if cart_enw.count > 0{
                print("\nYour order from E&W:")
                for cart in cart_enw{
                    print("-", cart.key, "x" + String(cart.value))
                }
            }
            if cart_gijoe.count > 0{
                print("\nYour order from GiJoe:")
                for cart in cart_gijoe{
                    print("-", cart.key, "x" + String(cart.value))
                }
            }
        }
        
        print("\n\nPress [B] to go Back")
        if countTotal > 0{
            print("Press [P] to pay / checkout")
        }
        print("Your choice?", terminator: " ")
        cartChoice = readLine()!.lowercased()
        
        if cartChoice == "p"{
            printCheckout()
        }
    }while cartChoice != "b" && cartChoice != "p"
    
    
    
}

func addToCart(indexCafe: Int, menuKey: String, quantity: Int){
    if indexCafe == 1{
        if cart_tukutuku.isEmpty{
            cart_tukutuku.updateValue(quantity, forKey: menuKey)
        }else{
            for cart in cart_tukutuku{
                if cart.key == menuKey{
                    let oldQuantity = cart_tukutuku[menuKey]
                    cart_tukutuku.updateValue(oldQuantity! + quantity, forKey: menuKey)
                }else{
                    cart_tukutuku.updateValue(quantity, forKey: menuKey)
                }
            }
        }
    }else if indexCafe == 2{
        if cart_gotri.isEmpty{
            cart_gotri.updateValue(quantity, forKey: menuKey)
        }else{
            for cart in cart_gotri{
                if cart.key == menuKey{
                    let oldQuantity = cart_gotri[menuKey]
                    cart_gotri.updateValue(oldQuantity! + quantity, forKey: menuKey)
                }else{
                    cart_gotri.updateValue(quantity, forKey: menuKey)
                }
            }
        }
    }else if indexCafe == 3{
        if cart_madamlie.isEmpty{
            cart_madamlie.updateValue(quantity, forKey: menuKey)
        }else{
            for cart in cart_madamlie{
                if cart.key == menuKey{
                    let oldQuantity = cart_madamlie[menuKey]
                    cart_madamlie.updateValue(oldQuantity! + quantity, forKey: menuKey)
                }else{
                    cart_madamlie.updateValue(quantity, forKey: menuKey)
                }
            }
        }
    }else if indexCafe == 4{
        if cart_kopte.isEmpty{
            cart_kopte.updateValue(quantity, forKey: menuKey)
        }else{
            for cart in cart_kopte{
                if cart.key == menuKey{
                    let oldQuantity = cart_kopte[menuKey]
                    cart_kopte.updateValue(oldQuantity! + quantity, forKey: menuKey)
                }else{
                    cart_kopte.updateValue(quantity, forKey: menuKey)
                }
            }
        }
    }else if indexCafe == 5{
        if cart_xiangjia.isEmpty{
            cart_xiangjia.updateValue(quantity, forKey: menuKey)
        }else{
            for cart in cart_xiangjia{
                if cart.key == menuKey{
                    let oldQuantity = cart_xiangjia[menuKey]
                    cart_xiangjia.updateValue(oldQuantity! + quantity, forKey: menuKey)
                }else{
                    cart_xiangjia.updateValue(quantity, forKey: menuKey)
                }
            }
        }
    }else if indexCafe == 6{
        if cart_raburi.isEmpty{
            cart_raburi.updateValue(quantity, forKey: menuKey)
        }else{
            for cart in cart_raburi{
                if cart.key == menuKey{
                    let oldQuantity = cart_raburi[menuKey]
                    cart_raburi.updateValue(oldQuantity! + quantity, forKey: menuKey)
                }else{
                    cart_raburi.updateValue(quantity, forKey: menuKey)
                }
            }
        }
    }else if indexCafe == 7{
        if cart_enw.isEmpty{
            cart_enw.updateValue(quantity, forKey: menuKey)
        }else{
            for cart in cart_enw{
                if cart.key == menuKey{
                    let oldQuantity = cart_enw[menuKey]
                    cart_enw.updateValue(oldQuantity! + quantity, forKey: menuKey)
                }else{
                    cart_enw.updateValue(quantity, forKey: menuKey)
                }
            }
        }
    }else if indexCafe == 8{
        if cart_gijoe.isEmpty{
            cart_gijoe.updateValue(quantity, forKey: menuKey)
        }else{
            for cart in cart_gijoe{
                if cart.key == menuKey{
                    let oldQuantity = cart_gijoe[menuKey]
                    cart_gijoe.updateValue(oldQuantity! + quantity, forKey: menuKey)
                }else{
                    cart_gijoe.updateValue(quantity, forKey: menuKey)
                }
            }
        }
    }
}


func indexToKey(indexMenu: Int, indexCafe: Int) -> String{
    var menuKey: String = "null"
    var i: Int = 1
    
    if indexCafe == 1{
        for menu in menu_tukutuku{
            if i == indexMenu{
                menuKey = menu.key
                break
            }
            i+=1
        }
    }else if indexCafe == 2{
        for menu in menu_gotri{
            if i == indexMenu{
                menuKey = menu.key
                break
            }
            i+=1
        }
    }else if indexCafe == 3{
        for menu in menu_madamlie{
            if i == indexMenu{
                menuKey = menu.key
                break
            }
            i+=1
        }
    }else if indexCafe == 4{
        for menu in menu_kopte{
            if i == indexMenu{
                menuKey = menu.key
                break
            }
            i+=1
        }
    }else if indexCafe == 5{
        for menu in menu_xiangjia{
            if i == indexMenu{
                menuKey = menu.key
                break
            }
            i+=1
        }
    }else if indexCafe == 6{
        for menu in menu_raburi{
            if i == indexMenu{
                menuKey = menu.key
                break
            }
            i+=1
        }
    }else if indexCafe == 7{
        for menu in menu_enw{
            if i == indexMenu{
                menuKey = menu.key
                break
            }
            i+=1
        }
    }else if indexCafe == 8{
        for menu in menu_gijoe{
            if i == indexMenu{
                menuKey = menu.key
                break
            }
            i+=1
        }
    }
    return menuKey
}
