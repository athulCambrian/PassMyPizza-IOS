//
//  AddViewController.swift
//  Pass my Pizza
//
//  Created by Athul Babu on 2022-08-17.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var smallBtn:UIButton!
    @IBOutlet weak var largeBtn:UIButton!
    
    @IBOutlet weak var thinBtn:UIButton!
    @IBOutlet weak var thickBtn:UIButton!
    
    @IBOutlet weak var price:UILabel!
    
    @IBOutlet weak var buyNowBtn:UIButton!
    
    var price_val=15.0;
    let THICK_CRUST_PRICE=2.50
    let LARGE_PIZZA_PRICE=3.50
    @IBAction func thinAction(){
        thinBtn.setTitle("Thin", for: .normal)
        thinBtn.setTitleColor(.blue, for: .normal)
        
        thickBtn.setTitle("Thick", for: .normal)
        thickBtn.setTitleColor(.lightGray, for: .normal)
        price_val=price_val-THICK_CRUST_PRICE
        setPrice(price:price_val);
    }
    @IBAction func thickAction(){
        thinBtn.setTitle("Thin", for: .normal)
        thinBtn.setTitleColor(.lightGray, for: .normal)
        
        thickBtn.setTitle("Thick", for: .normal)
        thickBtn.setTitleColor(.blue, for: .normal)
        price_val=price_val+THICK_CRUST_PRICE
        setPrice(price:price_val);
      
    }
    
    @IBAction func smallBtnAction(){
        smallBtn.setTitle("Small", for: .normal)
        smallBtn.setTitleColor(.blue, for: .normal)
        
        largeBtn.setTitle("Large", for: .normal)
        largeBtn.setTitleColor(.lightGray, for: .normal)
        price_val=price_val-LARGE_PIZZA_PRICE
        setPrice(price:price_val);
    }
    @IBAction func largeBtnAction(){
        smallBtn.setTitle("Small", for: .normal)
        smallBtn.setTitleColor(.lightGray, for: .normal)
        
        largeBtn.setTitle("Large", for: .normal)
        largeBtn.setTitleColor(.blue, for: .normal)
        price_val=price_val+LARGE_PIZZA_PRICE
        setPrice(price:price_val);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.price.text="$ "+String(price_val)
        // Do any additional setup after loading the view.
    }
    
    func setPrice(price:Double){
        self.price.text="$ "+String(price_val)
    }
    
    @IBAction func buyNowAction(){
      
    }

}
