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
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.id, ascending: true)],animation: .default) var items: FetchedResults<Item>
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
        Text("Hello")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
