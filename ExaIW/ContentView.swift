//
//  ContentView.swift
//  ExaIW
//
//  Created by CCDM31 on 14/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Pedido.entity(),sortDescriptors: []) var pedidos: FetchedResults<Pedido>
           @State private var newPedidoID = ""
           @State private var newPedidoCliente = ""
           @State private var newPedidoArticulo = ""
           @State private var newPedidoFechaEntrega = ""
           @State private var newPedidoDireccion = ""
           @State private var newPedidoTotal = ""
           @State private var newPedidoEstado = ""
           //Variables para actualizar 
           @State private var PedidoID = ""
           @State private var PedidoCliente = ""
           @State private var PedidoArticulo = ""
           @State private var PedidoFechaEntrega = ""
           @State private var PedidoDireccion = ""
    
    var body: some View {
        VStack{
            TextField("Agregar nuevo", text: self.$newPedidoID).multilineTextAlignment(.center)
            Button("Agregar"){self.guardar()}
            List{
                ForEach(pedidos, id: \.self) { pedido in
                    Text("\(pedido.cliente!)")
            }
            }
        }
            
        
    }
    
    func guardar(){
        let newPedido = Pedido(context: self.context)
        newPedido.cliente = newPedidoCliente
        try? self.context.save()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
