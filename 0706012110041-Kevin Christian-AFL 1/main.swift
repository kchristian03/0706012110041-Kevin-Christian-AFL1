//
//  main.swift
//  0706012110041-Kevin Christian-AFL 1
//
//  Created by MacBook Pro on 03/03/23.
//

import Foundation

//print("Hello, World!")
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

run()

func run(){
    var choice0: String = ""
    var choice1: Int
    setCafeteria()
//    print(">>> ", cafeteriaXmenu["Tuku - Tuku"]!.count)
//    var value = cafeteriaXmenu["Tuku - Tuku"]
//    print(cafeteriaXmenu["Tuku - Tuku"]?.count ?? 0)
//    print(menu_enw)
    repeat{
        mainPanel()
        choice0 = String(readLine()!)
        if choice0 > "0" && choice0 <= String(cafeteria.count){
            choice1 = Int(choice0) ?? -1
            goToCafe(choice1: choice1)
        }else if choice0.lowercased() == "s"{
            print("This is shoping cart")
        }else if choice0.lowercased() == "q"{
            print("Thankyou\nSee you\n...\n..\n.\n\n\n")
            exit(0)
        }else{
            print("Input \""+choice0+"\" is invalid\n\n\n")
        }
    }while choice0.lowercased() != "q"
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

func goToCafe(choice1: Int){
    var choice2: String = ""
    var choice3: Int
    repeat{
    var i: Int = 1
    print("\n\n======\nHi, welcome back to", cafeteria[choice1 - 1] + "!")
    print("What would you like to order?\n")
    
    if choice1 == 1{
        for menu in menu_tukutuku{
            print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
            i+=1
        }
    }else if choice1 == 2{
        for menu in menu_gotri{
            print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
            i+=1
        }
    }else if choice1 == 3{
        for menu in menu_madamlie{
            print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
            i+=1
        }
    }else if choice1 == 4{
        for menu in menu_kopte{
            print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
            i+=1
        }
    }else if choice1 == 5{
        for menu in menu_xiangjia{
            print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
            i+=1
        }
    }else if choice1 == 6{
        for menu in menu_raburi{
            print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
            i+=1
        }
    }else if choice1 == 7{
        for menu in menu_enw{
            print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
            i+=1
        }
    }else if choice1 == 8{
        for menu in menu_gijoe{
            print("["+String(i)+"]", menu.key, "--- Rp", menu.value)
            i+=1
        }
    }
    
    
        
        print("---")
        print("[B] Back to Main Menu")
        print("Your menu choice? ", terminator: "")
        choice2 = readLine()!.lowercased()
        
        if choice2 == "b"{
            print("")
        }else {
            print("")
            if choice2 > "0" && choice2 <= String(cafeteriaXmenu[cafeteria[choice1]]?.count ?? 0){
                choice3 = Int(choice2) ?? -1
                //go to order screen
                goToOrder(choice1: choice1, choice3: choice3)
            }else{
                print("Input \""+choice2+"\" is invalid\n\n\n")
            }
        }
    }while choice2 != "b"
}

func goToOrder(choice1: Int, choice3: Int){
    print("\n")
    var menu = cafeteriaXmenu[cafeteria[choice1-1]]
    var check1 = menu[0]
    var check2 =
}

func indexToKey(index: Int) -> String{
    var key: String = "null"
    
    return key
}
