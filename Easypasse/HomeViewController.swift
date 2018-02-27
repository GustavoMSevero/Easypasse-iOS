//
//  HomeViewController.swift
//  Easypasse
//
//  Created by Gustavo Severo on 22/02/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var menuShow = false
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func OpenMenu(_ sender: Any) {
        
        if(menuShow){
            leadingConstraint.constant = -125
        } else {
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        
        menuShow = !menuShow
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
