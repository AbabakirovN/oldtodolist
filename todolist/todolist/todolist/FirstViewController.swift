//
//  FirstViewController.swift
//  todolist
//
//  Created by Nurzhan Ababakirov on 10/10/19.
//  Copyright © 2019 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

var list = [String]()
var sList = [String]()

var indexAt = 0
var done = [false]
//let defaults = UserDefaults.standard


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
  
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
//        sList = defaults.stringArray(forKey: "sList") ?? [String]()
//        list = defaults.stringArray(forKey: "list") ?? [String]()
//        done = defaults.array(forKey: "done") as! [Bool]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        sideMenu()
        
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = list[row]
        cell.detailTextLabel?.text = sList[row]
        if(done[row]){
            cell.backgroundColor = .green
        }
        else{
            cell.backgroundColor = .white
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        indexAt = indexPath.row
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "info") as UIViewController
        present(secondViewController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete{
            list.remove(at: indexPath.row)
            sList.remove(at: indexPath.row)
            done.remove(at: indexPath.row)
//            defaults.set(list, forKey: "list")
//            defaults.set(sList, forKey: "sList")
//            defaults.set(done,  forKey: "done")

            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            self.tableView.reloadData()
            
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let accept = UIContextualAction(style: .normal, title: "Done"){
            (action,view,nil)in
            if(done[indexPath.row]){
                done[indexPath.row]=false
            }else{
                done[indexPath.row]=true
            }
            tableView.reloadData()
            }
        accept.backgroundColor = .green
      
        
        return UISwipeActionsConfiguration(actions: [accept])
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        print(list[row])
    }
    


    
    func sideMenu(){
       if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
        revealViewController().rearViewRevealWidth = 275
         view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
  
    
    
}


