//
//  Size.swift
//  JohnTea
//
//  Created by 蔡尚諺 on 2021/12/9.
//

import Foundation
enum Size: Int {
case M = 0 , L , ML
    
    func getString() -> String {
        var string = ""
        
        switch self {
        case .M:
            string = "M"
        case .L:
            string = "L"
        case .ML:
            break
        }
        
        return string
    }
}
