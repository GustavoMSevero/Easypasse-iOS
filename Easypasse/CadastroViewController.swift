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
        
        //let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //let context = appDelegate.persistentContainer.viewContext

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
        
        let param = ["nome": nomeUsuario, "cpf": cpf, "senha": senha, "method": "app-set-usuario"]
        var _: HTTPHeaders = ["Content-Type": "application/json"]
        let url = "http://easypasse.com.br/gestao/wsCadastrar.php"
        
        Alamofire.request(url, method:.post, parameters:param,encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                //print(response)
                let json = JSON(response.result.value as Any)
                let idusuario =  json["usuario"].arrayValue.map({$0["idUsuario"].stringValue})
                let nome =  json["usuario"].arrayValue.map({$0["nome"].stringValue})
                let cpf =  json["usuario"].arrayValue.map({$0["cpf"].stringValue})

                print(idusuario)
                print(nome)
                print(cpf)

            case .failure(let error):
                print(0,"Error")
            }
        }
        
//        Alamofire.request(url).validate().responseArray(keyPath: "usuario") { (response: DataResponse<[dadosUsuario]>) in
//            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            switch response.result {
//            case .success:
//                let usuarios = response.result.value ?? []
//                for usuario in usuarios {
//                    print(usuario.nome)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//        usuario =     (
//            {
//                ativo = 1;
//                cpf = 49516715141;
//                ddd = 000;
//                dtnascimento = "<null>";
//                email = "";
//                empresa = 0;
//                idGenero = 1;
//                idPerfil = 3;
//                idUsuario = 69;
//                idUsuarioAdm = 12;
//                logado = 1;
//                nome = "SERGIO AFONSO";
//                senha = d9bae3215f4677ddf2fa9972e0bf1c00;
//                telefone = 0;
//                username = "";
//            }
//        );

        

    }
    
}
