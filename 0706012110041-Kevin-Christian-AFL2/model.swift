//
//  model.swift
//  0706012110041-Kevin-Christian-AFL2
//
//  Created by MacBook Pro on 04/04/23.
//

import Foundation

//Class untuk item
class Item{
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

//Class untuk menu item turunan item
class MenuItem: Item {
    var price: Double
    
    init(id: Int, name: String, price: Double) {
        self.price = price
        super.init(id: id, name: name)
    }
}

//Class untuk cafe item turunan item
class CafetariaItem: Item {
    var menu: [MenuItem]
    var cart: [cartItem]
    
    init(id: Int, name: String, menu: [MenuItem]) {
        self.menu = menu
        self.cart = []
        super.init(id: id, name: name)
    }
}

//Variabel untuk menyimpan cafe-cafe
var cafetaria: [CafetariaItem] = []

var totalPrice: Double = 0

//struct untuk model cart
struct cartItem{
    var quantity: Double
    var menuItem: MenuItem
    
    init(quantity: Double, menuItem: MenuItem) {
        self.quantity = quantity
        self.menuItem = menuItem
    }
}

var cart: [cartItem] = []


protocol pembayaran{
    func totalOrder(_ order: Double)
    func totalPay(_ pay: Double)
    func change() -> Double
}

