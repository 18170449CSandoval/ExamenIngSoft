//
//  CoreDataManager.swift.swift
//  ExaIW
//
//  Created by el mencho on 17/11/22.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistentContainer: NSPersistentContainer

    init(){
        persistentContainer = NSPersistentContainer(name: "Pedido")
        persistentContainer.loadPersistentStores(completionHandler:{
            (descripcion, error) in
            if let error = error {
                fatalError("Core data failed \(error.localizedDescription)")
            }
        })
    }

    func guardarPedido(codigo: String, articulo: String, cliente: String, direccion: String, estado: String, fechaentrega: String, total: String){
        let pedido = Pedido(context: persistentContainer.viewContext)
        pedido.idped = codigo
        pedido.articulo = articulo
        pedido.cliente = cliente
        pedido.direccion = direccion
        pedido.estado = estado
        pedido.fechaentrega = fechaentrega
        pedido.total = total

        do{
            try persistentContainer.viewContext.save()
            print("producto guardado")
        }
        catch{
            print("failed to save error")
        }
    }

    func leerTodosLosPedidos() -> [Pedido]{
        let fetchRequest: NSFetchRequest<Pedido> = Pedido.fetchRequest()

        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }
        catch{
            return []
        }
    }

    func borrarPedido(pedido: Pedido){
        persistentContainer.viewContext.delete(pedido)

        do{
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
            print("Failed to save context")
        }
    }

    func actualizarpedido(pedido: Pedido){
        let fetchRequest: NSFetchRequest<Pedido> = Pedido.fetchRequest()
        let predicate = NSPredicate(format: "id = %@", pedido.idped ?? "")
        fetchRequest.predicate = predicate


        do{
            let datos = try persistentContainer.viewContext.fetch(fetchRequest)
            let p = datos.first
            p?.articulo = pedido.articulo
            p?.cliente = pedido.cliente
            p?.direccion = pedido.direccion
            p?.estado = pedido.estado
            p?.fechaentrega = pedido.fechaentrega
            p?.total = pedido.total
            
            //Segui asi con los demas atributos
            try persistentContainer.viewContext.save()
            print("pedido guardado")
        }catch{
            print("failed to save error en \(error)")
        }
    }

    func leerPedido(id: String) -> Pedido?{
        let fetchRequest: NSFetchRequest<Pedido> = Pedido.fetchRequest()
        let predicate = NSPredicate(format: "id = %@", id)
        fetchRequest.predicate = predicate
        do{
            let datos = try persistentContainer.viewContext.fetch(fetchRequest)
            return datos.first
        }catch{
            print("failed to save error en \(error)")
        }
        return nil
    }
}
