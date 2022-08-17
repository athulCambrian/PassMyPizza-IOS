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
      
        navigationController?.pushViewController(viewControl, animated: true)
    }
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
 
    var data:[PizzaItem]?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource=self
        table.delegate=self
        getDataFromDb();
    }
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
      
        getDataFromDb();
    }
    func getDataFromDb(){
        do{
            self.data =   try context.fetch(PizzaItem.fetchRequest())
            DispatchQueue.main.async {
                self.table.reloadData()
            }
           
        }catch{
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pizza = self.data![indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for :indexPath)as! PizzaTableViewCell
        cell.pizzaName?.text=pizza.name
        cell.price?.text="$"+String(pizza.price)
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete"){
            (action,view,completionHandler) in
            
            let pizzaRemoved=self.data![indexPath.row]
            self.context.delete(pizzaRemoved)
            do{
              try  self.context.save()}catch{}
            self.getDataFromDb()
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

