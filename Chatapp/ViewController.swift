//
//  ViewController.swift
//  Chatapp
//
//  Created by Majid Osman on 2018-11-25.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//      let  ref = Database.database().reference(fromURL: "https://chatapp-35a28.firebaseio.com/")
//        ref.updateChildValues(["someValue": 123453])
//        
        
        
        
        
        
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handlelogout))
       
    }

   @objc func handlelogout()  {
    
    let loginController = LoginController()
    present(loginController, animated: true, completion: nil)
        
    }
  
}

