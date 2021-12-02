//
//  ViewController.swift
//  JohnTea
//
//  Created by 蔡尚諺 on 2021/12/2.
//

import UIKit

class MainVC: UIViewController {
    
    
    @IBOutlet var typeButtons: [UIButton]!
    @IBOutlet weak var typeStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickedMenu(_ sender: UIButton) {
        
        
        for teaType in typeButtons where teaType.tag != 0 {
            //讓消失有動畫效果。withDuration：幾秒內完成動畫
            UIView.animate(withDuration: 0.2) {
                teaType.isHidden = !teaType.isHidden
            }
        }
        
        
        
    }
    
    @IBAction func clickedType(_ button: UIButton) {
        
        switch button.tag {
        case 1:
            print("經典")
        case 2:
            print("那提")
        case 3:
            print("調飲")
        default:
            break
        }
    }
    
    
}

