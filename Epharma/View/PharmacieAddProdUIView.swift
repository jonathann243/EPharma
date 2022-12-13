//
//  StockUIView.swift
//  Epharma
//
//  Created by Usager on 2022-03-28.
//

import SwiftUI

struct StockUIView: View {
    @State private var price=""
    @State private var desc=""
    @State private var headL=""
    @State private var name=""
    var disabledForm: Bool{
        price.isEmpty || desc.isEmpty   || desc.isEmpty||name.isEmpty
       }
    
    
    func SendData(){
    
       
    }
    var body: some View {
        VStack{
                Form {
                    Section(header: Text("Ajout produit")) {
                               
                                TextField("Nom",text:$name)
                                TextField("En-tete",text:$headL)
                                TextField("Description",text:$desc)
                                HStack{
                                    Text("$$ :").foregroundColor(Color.gray)
                                }
                               
                            }
                    Section {
                        Button(action: SendData) {Text("AJOUTER")}
                    }.disabled(disabledForm)
            
                }
                
                   
        }
        
    }
}

struct StockUIView_Previews: PreviewProvider {
    static var previews: some View {
        StockUIView()
    }
}
