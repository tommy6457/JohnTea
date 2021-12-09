//
//  Sugar.swift
//  JohnTea
//
//  Created by 蔡尚諺 on 2021/12/3.
//
// free = "無糖" , quarter = "三分" , half = "五分" , less = "七分" , regular = "全糖"

import Foundation

enum Sugar: Int {
case free = 0 , quarter , half , less , regular
    
    func getString() -> String {
        var string = ""
        
        switch self {
        case .free:
            string = "無糖"
        case .quarter:
            string = "三分"
        case .half:
            string = "五分"
        case .less:
            string = "七分"
        case .regular:
            string = "全糖"
        }
        
        return string
    }
}
