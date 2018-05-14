//
//  MainVC.swift
//  Side Menu
//
//  Created by Gustavo Severo on 27/04/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
        //Observador. Para que o botão de menu seja "ativado" depois que a aplicação carregar
        NotificationCenter.default.addObserver(self,
                                            selector: #selector(showProfile),
                                            name: NSNotification.Name("ShowProfile"),
                                            object: nil)
        
        //Observador. Para que o botão de menu seja "ativado" depois que a aplicação carregar
        NotificationCenter.default.addObserver(self,
                                            selector: #selector(showSettings),
                                            name: NSNotification.Name("ShowSettings"),
                                            object: nil)
        
        //Observador. Para que o botão de menu seja "ativado" depois que a aplicação carregar
        NotificationCenter.default.addObserver(self,
                                            selector: #selector(showSignOut),
                                            name: NSNotification.Name("ShowSignIn"),
                                            object: nil)
    }
    
    @objc func showProfile() {
        performSegue(withIdentifier: "ShowProfile", sender: nil)
    }
    
    @objc func showSettings() {
        performSegue(withIdentifier: "ShowSettings", sender: nil)
    }
    
    @objc func showSignOut() {
        performSegue(withIdentifier: "ShowSignIn", sender: nil)
    }

    @IBAction func onMoreTapped() {
        //print("TOOGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }

}
