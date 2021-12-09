//
//  Ice.swift
//  JohnTea
//
//  Created by 蔡尚諺 on 2021/12/3.
//
// no = "去冰" , low = "微冰" , less = "少冰" , normal = "正常"
import Foundation

enum Ice: Int {
    case no = 0 , low, less, normal
    
    func getString() -> String {
        var string = ""
        
        switch self {
        case .no:
            string = "去冰"
        case .low:
            string = "微冰"
        case .less:
            string = "少冰"
        case .normal:
            string = "正常"
        }
        
        return string
    }
}


