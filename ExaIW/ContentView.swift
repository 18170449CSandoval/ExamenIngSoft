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
    @State var newpedid = ""
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
                    TextField("ID", text: self.$newpedid).multilineTextAlignment(.center)
                    TextField("Articulo", text: self.$newarticulo).multilineTextAlignment(.center)
                    TextField("Cliente", text: self.$newcliente).multilineTextAlignment(.center)
                    TextField("Direccion", text: self.$newdireccion).multilineTextAlignment(.center)
                    TextField("Estado", text: self.$newestado).multilineTextAlignment(.center)
                    TextField("Fecha Entrega", text: self.$newfechaentrega).multilineTextAlignment(.center)
                    TextField("Total", text: self.$newtotal).multilineTextAlignment(.center)

                    Button("Guardar"){
                        coreDM.guardarPedido(codigo: newpedid, articulo: newarticulo, cliente: newcliente, direccion: newdireccion, estado: newestado, fechaentrega: newfechaentrega, total: newtotal)
                        newpedid = ""
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
                    }.onDelete(perform: {
                        indexSet in
                        indexSet.forEach({ index in
                        let pedido = prodArray[index]
                            coreDM.borrarPedido(pedido: pedido)
                        mostrarPedido()
                        })
                    })
                }.padding()
                    .onAppear(perform: {mostrarPedido()})
                NavigationLink("",destination: VStack{
                                TextField("ID", text: self.$codigoped).multilineTextAlignment(.center)
                                TextField("Articulo", text: self.$articuloped).multilineTextAlignment(.center)
                                TextField("Cliente", text: self.$clienteped).multilineTextAlignment(.center)
                                TextField("Direccion", text: self.$direccionped).multilineTextAlignment(.center)
                                TextField("Estado", text: self.$estadoped).multilineTextAlignment(.center)
                                TextField("Fecha Entrega", text: self.$fechaentregaped).multilineTextAlignment(.center)
                                TextField("Total", text: self.$totalped).multilineTextAlignment(.center)
                                   Button("Actualizar"){
                                       seleccionado?.idped = codigoped
                                       seleccionado?.articulo = articuloped
                                       seleccionado?.cliente = clienteped
                                       seleccionado?.direccion = direccionped
                                       seleccionado?.estado = estadoped
                                       seleccionado?.fechaentrega = fechaentregaped
                                       seleccionado?.total = totalped
                                       coreDM.actualizarpedido(pedido: seleccionado!)
                                       codigoped = ""
                                       articuloped = ""
                                       clienteped = ""
                                       direccionped = ""
                                       estadoped = ""
                                       fechaentregaped = ""
                                       totalped = ""
                                       mostrarPedido()
                                   }
                               }, isActive: $isTapped)
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
