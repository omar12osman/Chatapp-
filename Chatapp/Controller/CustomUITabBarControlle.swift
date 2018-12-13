//
//  CustomUITabBarControlle.swift
//  Chatapp
//
//  Created by Majid Osman on 2018-12-12.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import UIKit

class CustomUITabBarControlle : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homecontroller = HomeController()
        let MainPagehomcontroller = UINavigationController(rootViewController: homecontroller)
        MainPagehomcontroller.tabBarItem.image = UIImage(named: "icons8-user-filled-40")
        
        
       
        
        let messagesController = MessagesController()
        let MainMessagesPageController = UINavigationController(rootViewController: messagesController)
        MainMessagesPageController.tabBarItem.image = UIImage(named: "icons8-collaboration-filled-40")
        
        
       
        
        viewControllers = [MainPagehomcontroller , MainMessagesPageController ]
    }
}

