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
    var toping:String="Tomato"
    var main:String="Chiken"
    var size:String="small"
    var crust:String="thin"
    var topingArray = [String]()

    var price_val=15.0;
    let THICK_CRUST_PRICE=2.50
    let LARGE_PIZZA_PRICE=3.50
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBAction func thinAction(){
        thinBtn.setTitle("Thin", for: .normal)
        thinBtn.setTitleColor(.blue, for: .normal)
        crust="thin"
        thickBtn.setTitle("Thick", for: .normal)
        thickBtn.setTitleColor(.lightGray, for: .normal)
        price_val=price_val-THICK_CRUST_PRICE
        setPrice(price:price_val);
    }
    @IBAction func thickAction(){
        thinBtn.setTitle("Thin", for: .normal)
        thinBtn.setTitleColor(.lightGray, for: .normal)
        crust="thick"
        thickBtn.setTitle("Thick", for: .normal)
        thickBtn.setTitleColor(.blue, for: .normal)
        price_val=price_val+THICK_CRUST_PRICE
        setPrice(price:price_val);
      
    }
    
    @IBAction func smallBtnAction(){
        smallBtn.setTitle("Small", for: .normal)
        smallBtn.setTitleColor(.blue, for: .normal)
        size="small"
        largeBtn.setTitle("Large", for: .normal)
        largeBtn.setTitleColor(.lightGray, for: .normal)
        price_val=price_val-LARGE_PIZZA_PRICE
        setPrice(price:price_val);
    }
    @IBAction func largeBtnAction(){
        smallBtn.setTitle("Small", for: .normal)
        smallBtn.setTitleColor(.lightGray, for: .normal)
        size="large"
        largeBtn.setTitle("Large", for: .normal)
        largeBtn.setTitleColor(.blue, for: .normal)
        price_val=price_val+LARGE_PIZZA_PRICE
        setPrice(price:price_val);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.price.text="$ "+String(price_val)
        topingArray.append("Onions")
        topingArray.append("Brocolli")
        // Do any additional setup after loading the view.
    }
    
    func setPrice(price:Double){
        self.price.text="$ "+String(price_val)
    }
    
    @IBAction func didChangeSegmentToping(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex==0{
            toping="Tomato"
        }else if sender.selectedSegmentIndex==1{
            toping="Pesto"
        }
    }
    @IBAction func didChangeSegmentMain(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex==0{
            main="Chiken"
        }else if sender.selectedSegmentIndex==1{
            main="Mushroom"
        }
    }
    @IBAction func onionSwitch(_ sender:UISwitch){
        if sender.isOn==true{
            topingArray.append("Onions")
        }else{
            topingArray.remove(at: 0)
        }
    }
    @IBAction func brocolliSwitch(_ sender:UISwitch){
        if sender.isOn==true{
            topingArray.append("Brocolli")
        }else{
            topingArray.remove(at: 0)
        }
    }
    @IBAction func buyNowAction(){
      let newPizza = PizzaItem(context: context)
        newPizza.name=main+" Pizza with "+toping+" Sauce"
        newPizza.price=price_val
        newPizza.size=size
        newPizza.crust=crust
        newPizza.topings=topingArray
        do{
           try self.context.save()
            let alert = UIAlertController(title: "Success", message: "Order Placed Succesfully", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                    case .default:
                    print("default")
                    
                    case .cancel:
                    print("cancel")
                    
                    case .destructive:
                    print("destructive")
                    
                @unknown default:
                    print("error")
                }
            }))
            self.present(alert, animated: true, completion: nil)
            
        }catch{
            
        }
    }

}
