//
//  EpharmaApp.swift
//  Epharma
//
//  Created by Hervé Leka Ndombet on 2022-02-07.
//

import SwiftUI

@main
struct EpharmaApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ConnexionView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
        }
    }
}
