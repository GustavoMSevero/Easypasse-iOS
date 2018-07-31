//
//  PrincipalViewController.swift
//  Easypasse
//
//  Created by Gustavo Severo on 20/02/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit
import CoreData

class PrincipalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        CoreDataManager.fetchObj()
        //CoreDataManager.cleanCoreData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
