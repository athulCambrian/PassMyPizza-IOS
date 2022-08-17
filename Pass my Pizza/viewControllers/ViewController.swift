//
//  ViewController.swift
//  Pass my Pizza
//
//  Created by Athul Babu on 2022-08-17.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
 
    

    @IBOutlet weak var table:UITableView!
    @IBAction func createPizzaButtonClick(){
        let viewControl=storyboard?.instantiateViewController(withIdentifier: "add_vc") as! AddViewController
        present(viewControl,animated: true)
    }
    
    struct pizzaModel{
        let pizzaName:String
        let price:String
    }
    let data :[pizzaModel]=[
    pizzaModel(pizzaName:"dcsdv" , price: "sacsdc"),
    pizzaModel(pizzaName:"dcsdv" , price: "sacsdc"),
    pizzaModel(pizzaName:"dcsdv" , price: "sacsdc"),
    pizzaModel(pizzaName:"dcsdv" , price: "sacsdc"),
    pizzaModel(pizzaName:"dcsdv" , price: "sacsdc"),
    pizzaModel(pizzaName:"dcsdv" , price: "sacsdc"),
    pizzaModel(pizzaName:"dcsdv" , price: "sacsdc"),
    pizzaModel(pizzaName:"dcsdv" , price: "sacsdc"),
    pizzaModel(pizzaName:"dcsdv" , price: "sacsdc")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource=self
        table.delegate=self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pizza=data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for :indexPath)as! PizzaTableViewCell
        cell.pizzaName.text=pizza.pizzaName
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

