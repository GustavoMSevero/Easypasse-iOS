//
//  Usuario+CoreDataProperties.swift
//  
//
//  Created by Gustavo Severo on 19/07/2018.
//
//

import Foundation
import CoreData


extension Usuario {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuario> {
        return NSFetchRequest<Usuario>(entityName: "Usuario")
    }

    @NSManaged public var cpf: String?
    @NSManaged public var nome: String?
    @NSManaged public var idusuario: String?

}
