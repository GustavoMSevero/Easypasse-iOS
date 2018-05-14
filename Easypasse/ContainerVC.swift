//
//  ViewController.swift
//  Side Menu
//
//  Created by Gustavo Severo on 27/04/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Observador. Para que o botão de menu seja "ativado" depois que a aplicação carregar
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(toggleSideMenu),
                                               name: NSNotification.Name("ToggleSideMenu"),
                                               object: nil)
    }

    @objc func toggleSideMenu() {
        if sideMenuOpen {
            sideMenuOpen = false
            sideMenuConstraint.constant = -204
        } else {
            sideMenuOpen = true
            sideMenuConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }


}

