//
//  MainNavigationController.swift
//  Chatapp
//
//  Created by Majid Osman on 2018-12-12.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        if isLoggedIn() {
            let homeController = HomeController()
            viewControllers = [homeController]
        } else {
            perform(#selector(presentLoginController), with: nil, afterDelay: 0.01)
        }
    }
    
    
    func isLoggedIn() -> Bool {
        return UserDefaults.standard.isLoggedIn()
    }
    
    
    @objc func presentLoginController() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}
