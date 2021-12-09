//
//  ViewController.swift
//  JohnTea
//
//  Created by 蔡尚諺 on 2021/12/2.
//

import UIKit

class MainVC: UIViewController {
    
    var drink: Drink?
    var drinkItems = [Drink?]()
    
    @IBOutlet var typeButtons: [UIButton]!
    @IBOutlet weak var typeStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDrinkItems()
    }
    
    @IBAction func clickedMenu(_ sender: UIButton) {
        
        hiddenShowButton()
        
    }
    
    @IBAction func clickedType(_ button: UIButton) {
        
        hiddenShowButton()
        drink = getItem(tag: button.tag)
        performSegue(withIdentifier: "toDetailPage", sender: nil)
    }
    
    //去下一頁前會自動call
    @IBSegueAction func toDetailPage(_ coder: NSCoder) -> DetailVC? {
        
        let detailVC = DetailVC(coder: coder)
        detailVC?.drink = drink
        
        return detailVC
    }
    
    func hiddenShowButton() {
        for teaType in typeButtons where teaType.tag != 0 {
            
            //讓消失有動畫效果。withDuration：幾秒內完成動畫
            UIView.animate(withDuration: 0.6) {
                teaType.isHidden = !teaType.isHidden
                self.typeStackView.layoutIfNeeded()
                
            }
            
        }
    }
    func initDrinkItems() {
        drinkItems.append(nil)
        drinkItems.append(Drink(ice: .low, sugar: .quarter, name: "曼非紅茶",size: .ML ,priceM: 30 , priceL: 35))
        drinkItems.append(Drink(ice: .less, sugar: .less, name: "康提紅茶",size: .ML ,priceM: 25 , priceL: 30))
        drinkItems.append(Drink(ice: .less, sugar: .half, name: "雨果紅茶",size: .ML ,priceM: 30 , priceL: 35))
        drinkItems.append(Drink(ice: .low, sugar: .quarter, name: "茶中香檳",size: .ML ,priceM: 35 , priceL: 40))
        drinkItems.append(Drink(ice: .no, sugar: .free, name: "錫金紅茶",size: .M ,priceM: 45 , priceL: 0))
        drinkItems.append(Drink(ice: .no, sugar: .free, name: "灼香紅茶",size: .M ,priceM: 50 , priceL: 0))
        drinkItems.append(Drink(ice: .less, sugar: .half, name: "珍珠那提",size: .ML ,priceM: 55 , priceL: 60))
        drinkItems.append(Drink(ice: .less, sugar: .half, name: "雨果那提",size: .ML ,priceM: 50 , priceL: 55))
        drinkItems.append(Drink(ice: .less, sugar: .quarter, name: "曼非那提",size: .ML ,priceM: 50 , priceL: 55))
        drinkItems.append(Drink(ice: .less, sugar: .half, name: "抹茶那提",size: .M ,priceM: 60 , priceL: 60))
        drinkItems.append(Drink(ice: .less, sugar: .half, name: "煮濃那提",size: .M, priceM: 60 , priceL: 0))
        drinkItems.append(Drink(ice: .less, sugar: .half, name: "生乳灼香紅",size: .M ,priceM: 60 , priceL: 0))
        drinkItems.append(Drink(ice: .less, sugar: .half, name: "生乳紅茶",size: .M ,priceM: 50 , priceL: 0))
        drinkItems.append(Drink(ice: .less, sugar: .half, name: "糖檸紅茶",size: .M ,priceM: 55 , priceL: 0))
        drinkItems.append(Drink(ice: .less, sugar: .quarter, name: "玉釀紅茶",size: .L ,priceM: 0 , priceL: 55))
        drinkItems.append(Drink(ice: .less, sugar: .half, name: "冰淇淋紅茶",size: .L ,priceM: 0 , priceL: 60))
    }
        
    func getItem(tag: Int) -> Drink? {
        var drink: Drink
        
        if tag == 17 {
            drink = drinkItems[Int.random(in: 1...16)]!
        }else{
            drink = drinkItems[tag]!
        }
        return drink
    }
}

