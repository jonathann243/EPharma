//
//  PharmacieView.swift
//  Epharma
//
//  Created by Usager on 2022-03-27.
//

import SwiftUI

struct PharmacieView: View {
    var body: some View {
        VStack{
            TabView{
               RequestView()
                    .tabItem {Image(systemName:"house.fill")
                        Text("Tableau de bord")
                        }
                Text("Contenu de la deuxieme video vue ")
                    .tabItem {
                    Image(systemName:"bag.fill.badge.plus")
                        Text("Gestion du stock")
                        }
                //Text(UserDefaults.standard.account!.name)
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

struct PharmacieView_Previews: PreviewProvider {
    static var previews: some View {
        PharmacieView()
    }
}
