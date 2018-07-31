//
//  ViewController.swift
//  Easypasse
//
//  Created by Gustavo Severo on 08/02/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit
import CoreData
import SwiftyJSON
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {
    
    @IBOutlet weak var campoCPF: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CoreDataManager.verificaExistenciaUsuario() != 0 {
            print("Existe usuário")
            self.performSegue(withIdentifier: "seguePrincipal", sender: nil)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func botaoAcesse(_ sender: Any) {
        
        let cpf = self.campoCPF.text
        let senha = self.campoSenha.text
        let plat = "ios"
        
        let param = ["cpf": cpf, "senha": senha, "method": "app-get-login", "plataforma": plat]
        var _: HTTPHeaders = ["Content-Type": "application/json"]
        let url = "http://easypasse.com.br/gestao/wsLogin.php"
        
        Alamofire.request(url, method:.post, parameters:param,encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                //let nome = response.registro.usuario.nome as? String tentar quando puder
                if let json = response.result.value as? [String: Any],
                    let registro = json["registro"] as? [String: Any],
                    let usuario = registro["usuario"] as? [String: Any],
                    let nome = usuario["nome"] as? String {
                    //print(nome)
                    
                }
                
            case .failure(let error):
                print(0,"Error")
            }
        }
    }
    
}




