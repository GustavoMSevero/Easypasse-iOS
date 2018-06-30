//
//  ViewController.swift
//  Easypasse
//
//  Created by Gustavo Severo on 08/02/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var campoCPF: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func botaoAcesse(_ sender: Any) {
    }

    
}

