//
//  SwiftUIView.swift
//  Epharma
//
//  Created by Hervé Leka Ndombet on 2022-03-28.
//

import SwiftUI

struct RequestView :View{

    @ObservedObject var viewModel = RequestViewModel()
    var body: some View {
       NavigationView {
          VStack {
             List(viewModel.items, id: \.id) { item in
                VStack(alignment: .leading) {
                    Text(item.status )
                        .multilineTextAlignment(.center)
                    Text(item.comment).font(.system(size: 12))
                    Text("Id :\(item.idPharma)").font(.system(size: 11)).foregroundColor(.gray)
                    
            }
         }
       }.onAppear(perform: {
          viewModel.fetchData()
       })
    }
   }

}

struct RequestView_Previews: PreviewProvider {
    static var previews: some View {
        RequestView()
    }
}
