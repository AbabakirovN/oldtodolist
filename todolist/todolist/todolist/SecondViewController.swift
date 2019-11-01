//
//  SecondViewController.swift
//  todolist
//
//  Created by Nurzhan Ababakirov on 10/10/19.
//  Copyright © 2019 Nurzhan Ababakirov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var input: UITextField!
    
    @IBOutlet weak var inputS: UITextField!
    @IBAction func addTask(_ sender: UIButton) {
        if(input.text != "" && inputS.text != ""){
            list.append(input.text!)
            input.text =  ""
            sList.append(inputS.text!)
            inputS.text = ""
            done.append(false)

//            defaults.set(list, forKey: "list")
//            defaults.set(sList, forKey: "sList")
//            defaults.set(done,  forKey: "done")
           
            
        }
    }
    
    @IBAction func cancelTask(_ sender: UIButton) {
        input.text = ""
        inputS.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == input {
            textField.resignFirstResponder()
            inputS.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true

    }
    
    
}

