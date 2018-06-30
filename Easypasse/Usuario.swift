//
//  Usuario.swift
//  Easypasse
//
//  Created by Gustavo Severo on 29/06/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import Foundation
import ObjectMapper

class dadosUsuario: NSObject, Mappable {
    
    var idUsuario: Int?
    var nome: String?
    var cpf: String?
    var senha: String?
    
    override init() {
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        idUsuario <- map["idUsuario"]
        nome <- map["nome"]
        cpf <- map["cpf"]
        senha <- map["senha"]
    }
    
}
