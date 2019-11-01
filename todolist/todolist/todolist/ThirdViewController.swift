//
//  ThirdViewController.swift
//  todolist
//
//  Created by Nurzhan Ababakirov on 10/22/19.
//  Copyright © 2019 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            titleLabel.text = list[indexAt]
            desLabel.text = sList[indexAt]
    }
    

    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var desLabel: UITextField!
    
    @IBAction func backButton(_ sender: UIButton) {
        
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        list[indexAt] = titleLabel.text!
        sList[indexAt] = desLabel.text!
//        defaults.set(list, forKey: "list")
//        defaults.set(sList, forKey: "sList")
    }
}
