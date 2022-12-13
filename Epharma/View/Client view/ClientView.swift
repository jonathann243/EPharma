//
//  ItemView.swift
//  Epharma
//
//  Created by Usager on 2022-02-20.
//

import SwiftUI
//var players:[Product]=prodData

struct HomeView: View {

        var body: some View {
                VStack{
                    TabView{
                        RequestView()
                            .tabItem {
                            Image(systemName:"house.fill")
                                Text("Tableau de bord")
                                }
                       
                        Text("Contenu a venir")
                            .tabItem {Image(systemName: "magnifyingglass")
                               Text("Recherche")
                                }
                        ProfileView()
                            .tabItem {Image(systemName: "person.fill")
                               Text("Profil")
                                }
                     
                            }
                }.navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image("logo2-1")
                                .resizable()
                                .background(Color.white)
                                .clipShape(Circle())
                                .frame(width:40 , height: 50)
                              
                            Text("Epharma").font(.headline)
                               }
                                                        }
                        }

        }
}


struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
       
    }
}
