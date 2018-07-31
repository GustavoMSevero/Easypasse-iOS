//
//  CoreData.swift
//  Easypasse
//
//  Created by Gustavo Severo on 24/07/2018.
//  Copyright © 2018 Gustavo Severo. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    ///guardar objeto no core data
    class func guardarObj(nome: String, cpf: String, idusuario: String) {
        let context = getContext()
        
        let entity = NSEntityDescription.entity(forEntityName: "Usuario", in: context)
        
        let novoUsuario = NSManagedObject(entity: entity!, insertInto: context)
        novoUsuario.setValue(cpf, forKey: "cpf")
        novoUsuario.setValue(idusuario, forKey: "idusuario")
        novoUsuario.setValue(nome, forKey: "nome")
        
        do {
            try context.save()
            print("Salvo!")
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    class func verificaExistenciaUsuario() -> Int {
        
        //func count(for request: NSFetchRequest<NSFetchRequestResult>) throws -> In
        var qtd = 0
        
        let fetchRequest:NSFetchRequest<Usuario> = Usuario.fetchRequest()
        
        do {
            let fetchResult = try getContext().fetch(fetchRequest)
            var qtd = fetchResult.count
            //print(qtd)
            return qtd

        }catch {
            print(error.localizedDescription)
        }
        
        return qtd
    }
    
    ///fetch todos os objetos do core data
    class func fetchObj() -> [dadosUsuario]{
        var aray = [dadosUsuario]()
        
        let fetchRequest:NSFetchRequest<Usuario> = Usuario.fetchRequest()
        
        //        var predicate = NSPredicate(format: "name contains[c] %@", "001")
        //        predicate = NSPredicate(format: "by == %@" , "wang")
        //        predicate = NSPredicate(format: "year > %@", "2012")
        //
        //        fetchRequest.predicate = predicate
        
        do {
            let fetchResult = try getContext().fetch(fetchRequest)
            
            for item in fetchResult {
                let dados = dadosUsuario(nome: item.nome!, idusuario: item.idusuario!, cpf: item.cpf!)
                aray.append(dados)
                print("nome:"+dados.nome!+"\nidusuario:"+dados.idusuario!+"\ncpf:"+dados.cpf!+"\n")
            }
        }catch {
            print(error.localizedDescription)
        }
        
        return aray
    }
    
    //Apaga todos os dados do core data
    class func cleanCoreData() {
        
        let fetchRequest:NSFetchRequest<Usuario> = Usuario.fetchRequest()
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest:
            fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        
        do {
            print("Apagando todo conteúdo")
            try getContext().execute(deleteRequest)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    struct dadosUsuario {
        var nome:String?
        var idusuario:String?
        var cpf:String?
        
        init() {
            nome = ""
            idusuario = ""
            cpf = ""
        }
        
        init(nome:String,idusuario:String,cpf:String) {
            self.nome = nome
            self.idusuario = idusuario
            self.cpf = cpf
        }
        
    }
    
}
