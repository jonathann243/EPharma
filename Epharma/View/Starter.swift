//
//  Starter.swift
//  Epharma
//
//  Created by Hervé Leka Ndombet on 2022-02-20.
//

import SwiftUI

struct Starter: View {
    var body: some View {
        ConnexionView()
            .navigationTitle("Connexion")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct Starter_Previews: PreviewProvider {
    static var previews: some View {
        Starter()
    }
}
