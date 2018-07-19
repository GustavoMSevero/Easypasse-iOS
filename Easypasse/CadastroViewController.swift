//
//  CadastroViewController.swift
//  Easypasse
//
//  Created by Gustavo Severo on 20/02/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit
import CoreData
import SwiftyJSON
import Alamofire
import AlamofireObjectMapper

class CadastroViewController: UIViewController {
    
    @IBOutlet weak var campoUsuario: UITextField!
    @IBOutlet weak var campoCPF: UITextField!
    @IBOutlet weak var campoSenha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func botaoSalvar(_ sender: Any) {
        
        let nomeUsuario = self.campoUsuario.text;
        let cpf = self.campoCPF.text;
        let senha = self.campoSenha.text;
        let plat = "ios"
        let method = "app-set-usuario"
        
        let param = ["nome": nomeUsuario, "cpf": cpf, "senha": senha, "method": method, "plataforma": plat]
        var _: HTTPHeaders = ["Content-Type": "application/json"]
        let url = "http://easypasse.com.br/gestao/wsCadastrar.php"
        
        Alamofire.request(url, method:.post, parameters:param, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                //print(response)
                if let json = response.result.value as? [String: Any],
                    let registro = json["registro"] as? [String: Any],
                    let usuario = registro["usuario"] as? [String: Any],
                    let nome = usuario["nome"] as? String {
                    let cpf = usuario["cpf"] as? String
                    let idusuario = usuario["idUsuario"] as? String
                    
                    let nomeUsuario: String = nome
                    let cpfUsuario: String = cpf!
                    let idUsuario: String = idusuario!
                    
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    let context = appDelegate.persistentContainer.viewContext

                    let dataUsuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
                    dataUsuario.setValue(nomeUsuario, forKey: "usuario")
                    dataUsuario.setValue(idUsuario, forKey: "idusuario")
                    dataUsuario.setValue(cpfUsuario, forKey: "cpf")

                    //Salvar os dados
                    do {
                        try context.save()
                        print("Os dados foram salvos corretamente")
                    } catch  {
                        print("Erro ao salvar os dados")
                    }
                    
                }
                
            case .failure(let error):
                print(0,"Error")
            }
        }
        
    }
    
}
