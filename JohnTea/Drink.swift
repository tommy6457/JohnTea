//
//  Drink.swift
//  JohnTea
//
//  Created by 蔡尚諺 on 2021/12/3.
//

import Foundation
struct Drink {
    
    var ice: Ice        //冰塊
    var sugar: Sugar    //甜度
    var name: String    //名稱
    var realSize = Size.M    //實際尺寸
    var size: Size      //規定尺寸
    var price = 0       //實際價錢
    var quantity = 0    //實際數量
    var priceM: Int     //中杯定價
    var priceL: Int     //大杯定價
    var bubble = false  //白玉珍珠
    
    init(ice: Ice, sugar: Sugar, name: String, size: Size, priceM: Int,  priceL: Int) {
        self.ice = ice
        self.sugar = sugar
        self.name = name
        self.size = size
        self.priceM = priceM
        self.priceL = priceL
    }
    
    func getAmount() -> Int{
        var amount = 0
        
        amount = self.price
        //珍珠+5塊錢
        if self.bubble {
            print("加珍珠")
            amount += 5
        }
        
        amount *= quantity
        
        return amount
    }
    
}
