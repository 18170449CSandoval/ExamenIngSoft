//
//  ContentView.swift
//  ExaIW
//
//  Created by CCDM31 on 14/11/22.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CoreDataManager
    @State var codigo = ""
    @State var articulo = ""
    @State var cliente = ""
    @State var direccion = ""
    @State var estado = ""
    @State var fechaentrega = ""
    @State var total = ""
    @State var newcodigo = ""
    @State var newarticulo = ""
    @State var newcliente = ""
    @State var newdireccion = ""
    @State var newestado = ""
    @State var newfechaentrega = ""
    @State var newtotal = ""
    @State var seleccionado: Pedido?
    @State var prodArray = [Pedido]()
    
    @State var codigoped = ""
    @State var articuloped = ""
    @State var clienteped = ""
    @State var direccionped = ""
    @State var estadoped = ""
    @State var fechaentregaped = ""
    @State var totalped = ""
    @State var isTapped = false


    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: VStack{
                    TextField("ID", text: self.$codigo).multilineTextAlignment(.center)
                    TextField("Articulo", text: self.$newarticulo).multilineTextAlignment(.center)
                    TextField("Cliente", text: self.$newcliente).multilineTextAlignment(.center)
                    TextField("Direccion", text: self.$newdireccion).multilineTextAlignment(.center)
                    TextField("Estado", text: self.$newestado).multilineTextAlignment(.center)
                    TextField("Fecha Entrega", text: self.$newfechaentrega).multilineTextAlignment(.center)
                    TextField("Total", text: self.$newtotal).multilineTextAlignment(.center)

                    Button("Guardar"){
                        coreDM.guardarPedido(codigo: newcodigo, articulo: newarticulo, cliente: newcliente, direccion: newdireccion, estado: newestado, fechaentrega: newfechaentrega, total: newtotal)
                        newcodigo = ""
                        newarticulo = ""
                        newcliente = ""
                        newdireccion = ""
                        newestado = ""
                        newfechaentrega = ""
                        newtotal = ""
                        mostrarPedido()
                    }
                    }){
                    Text("Agregar")
                }

                List{
                    ForEach(prodArray, id: \.self){
                        ped in
                        VStack{
                            Text(ped.articulo ?? "")
                        }
                        .onTapGesture{
                            seleccionado = ped
                            codigo = ped.idped ?? ""
                            seleccionado = ped
                            codigoped =
                            ped.idped ?? ""
                            articuloped =
                            ped.articulo ?? ""
                            clienteped =
                            ped.cliente ?? ""
                            direccionped =
                            ped.direccion ?? ""
                            estadoped =
                            ped.estado ?? ""
                            fechaentregaped =
                            ped.fechaentrega ?? ""
                            totalped =
                            ped.total ?? ""
                            isTapped.toggle()
                        }
                    }
                    
                }.padding()
                    .onAppear(perform: {mostrarPedido()})
            }
        }
    }
    func mostrarPedido(){
            prodArray = coreDM.leerTodosLosPedidos()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CoreDataManager())
    }
}
