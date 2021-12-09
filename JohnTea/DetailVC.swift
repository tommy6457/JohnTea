//
//  DetailVC.swift
//  JohnTea
//
//  Created by 蔡尚諺 on 2021/12/2.
//

import UIKit

class DetailVC: UIViewController {
    
    var drink: Drink!
    var drinks = [Drink]()
    
    @IBOutlet weak var sugarSegmented: UISegmentedControl!
    @IBOutlet weak var iceSegmented: UISegmentedControl!
    @IBOutlet weak var sizeSegmented: UISegmentedControl!
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var bubbleSwitch: UISwitch!
    
    @IBOutlet weak var resultTextView: UITextView!
    @IBOutlet weak var subTotalLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定UISegmentedControl字體
        sugarSegmented.setTitleTextAttributes([.font: UIFont(name: "SongTi TC", size: 12) as Any ], for: .normal)
        iceSegmented.setTitleTextAttributes([.font: UIFont(name: "SongTi TC", size: 12) as Any ], for: .normal)
        
        if var drink = drink {
            
            refreshUI(drink: &drink)
            
        }
    }
    
    func refreshUI(drink: inout Drink) {
        self.title = drink.name
        
        sugarSegmented.selectedSegmentIndex = drink.sugar.rawValue
        iceSegmented.selectedSegmentIndex = drink.ice.rawValue
        //判斷是否可以輸入Size
        if drink.size == .ML {
            for index in 0...1 {
                sizeSegmented.setEnabled(true, forSegmentAt: index)}
        }else {
            for index in 0...1 {
                if index != drink.size.rawValue{
                    sizeSegmented.setEnabled(false, forSegmentAt: index)}
                else{
                    sizeSegmented.setEnabled(true, forSegmentAt: index)
                    sizeSegmented.selectedSegmentIndex = index
                    drink.realSize = Size(rawValue: index)!
                }
            }
        }
        
        //判斷大小杯
        if sizeSegmented.selectedSegmentIndex == 0 {
            drink.price = drink.priceM
        }else{
            drink.price = drink.priceL
        }
        //數量標籤
        quantityLabel.text = "\(drink.quantity)"
        //判斷珍珠
        if bubbleSwitch.isOn {
            drink.bubble = true
        }else{
            drink.bubble = false
        }
        //更新小計
        let drinkPrice = drink.getAmount()
        drink.price = drinkPrice
        subTotalLabel.text = "$\(drinkPrice)"
        
    }
    
    @IBAction func sugarChanged(_ sender: UISegmentedControl) {
        drink.sugar = Sugar(rawValue: sender.selectedSegmentIndex)!
        refreshUI(drink: &drink)
    }
    
    @IBAction func iceChanged(_ sender: UISegmentedControl) {
        drink.ice = Ice(rawValue: sender.selectedSegmentIndex)!
        refreshUI(drink: &drink)
    }
    @IBAction func sizeChanged(_ sender: UISegmentedControl) {
        drink.realSize = Size(rawValue: sender.selectedSegmentIndex)!
        refreshUI(drink: &drink)
    }
    @IBAction func quantityChanged(_ sender: UIStepper) {
        drink.quantity = Int(sender.value)
        refreshUI(drink: &drink)
    }
    
    @IBAction func bubbleChanged(_ sender: UISwitch) {
        drink.bubble = sender.isOn
        refreshUI(drink: &drink)
    }
    
    @IBAction func addClicked(_ sender: UIButton) {
        //有數量才要做
        guard drink.quantity != 0 else {return}
        
        var result = ""
        var total = 0
        
        drinks.append(drink)
        
        for drink in drinks {
            var bubbleString: String {
                var string = ""
                
                if drink.bubble {
                    string = "加珍珠"
                }
                
                return string
            }
            total += drink.price
            result += " \(drink.name) \(drink.ice.getString()) \(drink.sugar.getString()) \(bubbleString) \(drink.quantity)杯 \(drink.realSize.getString()) 小計$\(drink.price)\n"
        }
        
        totalLabel.text = "$\(total)"
        resultTextView.text = result
        
    }
    
    @IBAction func clearClicked(_ sender: UIButton) {
        totalLabel.text = "$0"
        resultTextView.text = ""
        drinks.removeAll()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
