//
//  ProduitUIView.swift
//  Epharma
//
//  Created by Usager on 2022-05-03.
//

import SwiftUI

struct ProduitUIView: View {
    @ObservedObject var viewModel = ProduitViewModel()
    var body: some View {
       NavigationView {
          VStack {
             List(viewModel.items, id: \.id) { item in
                VStack(alignment: .leading) {
                     Text(item.name)
                     Text(item.title).font(.system(size: 13))
                    Text(item.description).font(.system(size: 11)).foregroundColor(.gray)
                    Text(" "+item.idDrug+" $")
                     .font(.system(size: 15))
                     .foregroundColor(.green)
            }
         }.listStyle(GroupedListStyle())
       }.onAppear(perform: {
          viewModel.fetchData()
       })
    }
    }}


struct ProduitUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProduitUIView()
    }
}
