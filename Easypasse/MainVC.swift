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
                                            selector: #selector(showTelaInicial),
                                            name: NSNotification.Name("ShowTelaInicial"),
                                            object: nil)
        
        //Observador. Para que o botão de menu seja "ativado" depois que a aplicação carregar
        NotificationCenter.default.addObserver(self,
                                            selector: #selector(showLocalizarOnibus),
                                            name: NSNotification.Name("ShowLocalizarOnibus"),
                                            object: nil)
        
        //Observador. Para que o botão de menu seja "ativado" depois que a aplicação carregar
        NotificationCenter.default.addObserver(self,
                                            selector: #selector(showIndicar),
                                            name: NSNotification.Name("ShowIndicar"),
                                            object: nil)
        
        //Observador. Para que o botão de menu seja "ativado" depois que a aplicação carregar
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showCreditos),
                                               name: NSNotification.Name("ShowCreditos"),
                                               object: nil)
        
        //Observador. Para que o botão de menu seja "ativado" depois que a aplicação carregar
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showHistorico),
                                               name: NSNotification.Name("ShowHistorico"),
                                               object: nil)
        
        //Observador. Para que o botão de menu seja "ativado" depois que a aplicação carregar
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showConfiguracoes),
                                               name: NSNotification.Name("ShowConfiguracoes"),
                                               object: nil)
    }
    
    @objc func showTelaInicial() {
        performSegue(withIdentifier: "ShowTelaInicial", sender: nil)
    }
    
    @objc func showLocalizarOnibus() {
        performSegue(withIdentifier: "ShowLocalizarOnibus", sender: nil)
    }
    
    @objc func showIndicar() {
        performSegue(withIdentifier: "ShowIndicar", sender: nil)
    }
    
    @objc func showCreditos() {
        performSegue(withIdentifier: "ShowCreditos", sender: nil)
    }
    
    @objc func showHistorico() {
        performSegue(withIdentifier: "ShowHistorico", sender: nil)
    }
    
    @objc func showConfiguracoes() {
        performSegue(withIdentifier: "ShowConfiguracoes", sender: nil)
    }

    @IBAction func onMoreTapped() {
        //print("TOOGLE SIDE MENU")
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }

}
