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
    let price_val=15.0;
  
    @IBAction func thinAction(){
        thinBtn.setTitle("Thin", for: .normal)
        thinBtn.setTitleColor(.blue, for: .normal)
        
        thickBtn.setTitle("Thick", for: .normal)
        thickBtn.setTitleColor(.lightGray, for: .normal)
        
        
    }
    @IBAction func thickAction(){
        thinBtn.setTitle("Thin", for: .normal)
        thinBtn.setTitleColor(.lightGray, for: .normal)
        
        thickBtn.setTitle("Thick", for: .normal)
        thickBtn.setTitleColor(.blue, for: .normal)
        
        
    }
    
    @IBAction func smallBtnAction(){
        smallBtn.setTitle("Small", for: .normal)
        smallBtn.setTitleColor(.blue, for: .normal)
        
        largeBtn.setTitle("Large", for: .normal)
        largeBtn.setTitleColor(.lightGray, for: .normal)
    }
    @IBAction func largeBtnAction(){
        smallBtn.setTitle("Small", for: .normal)
        smallBtn.setTitleColor(.lightGray, for: .normal)
        
        largeBtn.setTitle("Large", for: .normal)
        largeBtn.setTitleColor(.blue, for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.price.text="$ "+String(price_val)
        // Do any additional setup after loading the view.
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
