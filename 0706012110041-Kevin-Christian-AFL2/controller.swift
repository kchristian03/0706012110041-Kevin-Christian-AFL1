//
//  controller.swift
//  0706012110041-Kevin-Christian-AFL2
//
//  Created by MacBook Pro on 04/04/23.
//

import Foundation


//CAFE
func inputCafetaria(name: String){
    // cek apakah sudah ada atau belum
    let check = isNameAlready(name: name, items: cafetaria)
    if check == false{
        let newCafe = CafetariaItem(id: cafetaria.count + 1, name: name, menu: [])
        cafetaria.append(newCafe)
        print("Cafetaria \(name) successfuly added")
    }else{
        print("Cafetaria \(name) failed added")
    }
}

func showCafetaria(){
    if cafetaria.count <= 0{
        print("There are no cafes in this app")
    }else{
        for cafe in cafetaria{
            print("[" + String(cafe.id) + "] \(cafe.name)")
        }
    }
}


//MENU
func inputMenu(name: String, price: Double, toCafe: Int){
    //cek apakah sudah ada atau belum
    let check = isNameAlready(name: name, items: cafetaria[toCafe].menu)
    if check == false{
        let newMenu = MenuItem(id: cafetaria[toCafe].menu.count + 1, name: name, price: price)
        cafetaria[toCafe].menu.append(newMenu)
        print("Menu \(name) successfuly added")
    }else{
        print("Menu \(name) failed added")
    }
}

func showMenu(cafe: Int){
    if cafetaria[cafe-1].menu.count <= 0{
        print("There is no menu in this cafe")
    }else{
        print("\n\n======\nHi, welcome back to", cafetaria[cafe-1].name + "!")
        print("What would you like to order?\n")
        for menu in cafetaria[cafe-1].menu{
            print("[" + String(menu.id) + "] \(menu.name) --- Rp \(menu.price)")
        }
    }
}


//CART
func addCart(cafe: Int, menu: MenuItem, quantity: Double){
    var i: Int = 0
    if cafetaria[cafe].cart.isEmpty{
        var addCartItem = cartItem(quantity: quantity, menuItem: menu)
        cafetaria[cafe].cart.append(addCartItem)
    }else{
        for crt in cafetaria[cafe].cart{
            if crt.menuItem.name == menu.name{
                let oldQuantity = crt.quantity
                let update = cartItem(quantity: oldQuantity + quantity, menuItem: menu)
                cafetaria[cafe].cart[i] = update
            }
            i+=1
        }
    }
    
    
}

func showCart() -> Int{
    var i: Int = 0
    var countTotal: Int = 0
    for cafe in cafetaria{
        countTotal += cafe.cart.count
    }
    
    if countTotal <= 0{
        print("\n\nYour cart is empty\n\n")
    }else{
        for cafe in cafetaria{
            if cafe.cart.count > 0{
                print("\nYour order from \(cafe.name):")
                for cartCafe in cafetaria[i].cart{
                    print("-", cartCafe.menuItem.name, "x" + String(cartCafe.quantity))
                    totalPrice += cartCafe.menuItem.price * cartCafe.quantity
                }
            }
            i += 1
        }
    }
    return countTotal
}



//CHECKING
func isNameAlready(name: String, items: Array<Item>) -> Bool{
    var check = false
    for item in items{
        if item.name == name {
            print("The \(name) is already")
            check = true
            break
        }else{
            check = false
            break
        }
    }
    return check
}


func setCafeFirst(){
    inputCafetaria(name: "Tuku - Tuku")
    inputCafetaria(name: "Gotri")
    inputCafetaria(name: "Madam Lie")
    inputCafetaria(name: "Kopte")
    inputCafetaria(name: "Xiang Jia")
    inputCafetaria(name: "Raburi")
    inputCafetaria(name: "E&W")
    inputCafetaria(name: "GI Joe")
}

func setMenuFirst(){
    inputMenu(name: "Nasi Goreng", price: 12000, toCafe: 0)
    inputMenu(name: "Mie Goreng", price: 12000, toCafe: 0)
    inputMenu(name: "Tahu Isi", price: 6000, toCafe: 0)
    inputMenu(name: "Pop Mie", price: 6000, toCafe: 0)
    inputMenu(name: "Air Mineral", price: 3000, toCafe: 0)
    inputMenu(name: "Nasi Goreng", price: 25000, toCafe: 1)
    inputMenu(name: "Mie Goreng", price: 25000, toCafe: 1)
    inputMenu(name: "Nasi Sayur", price: 25000, toCafe: 2)
    inputMenu(name: "Ayam Geprek", price: 25000, toCafe: 2)
    inputMenu(name: "Es Teh", price: 5000, toCafe: 2)
    inputMenu(name: "Kopi Hitam", price: 20000, toCafe: 3)
    inputMenu(name: "Moca", price: 12000, toCafe: 3)
    inputMenu(name: "Kopi Pahit", price: 6000, toCafe: 3)
    inputMenu(name: "Nasi Tim", price: 25000, toCafe: 4)
    inputMenu(name: "Ayam Tim", price: 25000, toCafe: 4)
    inputMenu(name: "Teh Manis", price: 5000, toCafe: 4)
    inputMenu(name: "Paket 1", price: 30000, toCafe: 5)
    inputMenu(name: "Paket Valentine", price: 50000, toCafe: 5)
    inputMenu(name: "Paket Spesial", price: 100000, toCafe: 5)
    inputMenu(name: "America", price: 25000, toCafe: 6)
    inputMenu(name: "Cheese Mexico", price: 25000, toCafe: 6)
    inputMenu(name: "Japan Salad", price: 25000, toCafe: 6)
    inputMenu(name: "Blue Ocean", price: 12000, toCafe: 7)
    inputMenu(name: "Orange Splash", price: 12000, toCafe: 7)
    inputMenu(name: "Paket Keluarga", price: 50000, toCafe: 7)
}

