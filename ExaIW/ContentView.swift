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
    @State var newarticulo = ""
    @State var newcliente = ""
    @State var newdireccion = ""
    @State var newestado = ""
    @State var newfechaentrega = ""
    @State var newtotal = ""
    @State var seleccionado: Pedido?
    @State var prodArray = [Pedido]()


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
                        coreDM.guardarPedido(codigo: newcodigo, nombre: newnombre, precio: newprecio, existencia: newexistencia, categoria: newcategoria)
                        newnombre = ""
                        newcodigo = ""
                        newprecio = ""
                        newexistencia = ""
                        newcategoria = ""
                        mostrarProductos()
                    }
                    }){
                    Text("Agregar")
                }

                List{
                    ForEach(prodArray, id: \.self){
                        pedido in
                        VStack{
                            Text(pedido.articulo ?? "")
                        }
                        .onTapGesture{
                            seleccionado = pedido
                            codigo = pedido.id ?? ""
                        }
                    }.onDelete(perform: {
                        indexSet in
                        indexSet.forEach({ index in
                        let producto = prodArray[index]
                            coreDM.borrarPedido(pedido: <#T##Pedido#>)
                        mostrarPedido()
                        })
                    })
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
