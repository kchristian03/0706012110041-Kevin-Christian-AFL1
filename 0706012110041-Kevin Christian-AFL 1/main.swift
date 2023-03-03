//
//  main.swift
//  0706012110041-Kevin Christian-AFL 1
//
//  Created by MacBook Pro on 03/03/23.
//

import Foundation

//print("Hello, World!")
var cafeteria: [String] = []

var menu_tukutuku: [String] = ["Nasi goreng", "Mie goreng", "Tahu isi"]
var menu_gotri: [String] = ["Nasi goreng", "Mie goreng", "Tahu isi"]
var menu_madamlie: [String] = ["Nasi goreng", "Mie goreng", "Tahu isi"]
var menu_kopte: [String] = ["Nasi goreng", "Mie goreng", "Tahu isi"]
var menu_xiangjia: [String] = ["Nasi goreng", "Mie goreng", "Tahu isi"]
var menu_raburi: [String] = ["Nasi goreng", "Mie goreng", "Tahu isi"]
var menu_enw: [String] = ["Nasi goreng", "Mie goreng", "Tahu isi"]
var menu_gijoe: [String] = ["Nasi goreng", "Mie goreng", "Tahu isi"]

run()

func run(){
    var choice0: String = ""
    var choice1: Int
    setCafeteria()
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
    cafeteria.append("Tuku - tuku")
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
    
    var i: Int = 1
    print("\n\n======\nHi, welcome back to", cafeteria[choice1-1]+"!")
    print("What would you like to order?\n")
    
    if choice1 == 1{
        for menu in menu_tukutuku{
            print("["+String(i)+"]", menu)
            i+=1
        }
    }else if choice1 == 2{
        for menu in menu_gotri{
            print("["+String(i)+"]", menu)
            i+=1
        }
    }else if choice1 == 3{
        for menu in menu_madamlie{
            print("["+String(i)+"]", menu)
            i+=1
        }
    }else if choice1 == 4{
        for menu in menu_kopte{
            print("["+String(i)+"]", menu)
            i+=1
        }
    }else if choice1 == 5{
        for menu in menu_xiangjia{
            print("["+String(i)+"]", menu)
            i+=1
        }
    }else if choice1 == 6{
        for menu in menu_raburi{
            print("["+String(i)+"]", menu)
            i+=1
        }
    }else if choice1 == 7{
        for menu in menu_enw{
            print("["+String(i)+"]", menu)
            i+=1
        }
    }else if choice1 == 8{
        for menu in menu_gijoe{
            print("["+String(i)+"]", menu)
            i+=1
        }
    }
    
    print("---")
    print("[B] Back to Main Menu")
    print("Your menu choice? ", terminator: "")
    choice2 = readLine()!
    
    switch choice2.lowercased(){
    case "B":
        
        
    }
}
