//
//  ProduiVieuwModel.swift
//  Epharma
//
//  Created by Usager on 2022-05-03.
//

import Foundation
class ProduitViewModel: ObservableObject {
  @Published var items = [DrugDTO]()//liste de requete
  func fetchData() {//recuperation selon url
    let api = "https://spring-boot-server-ios-tp.herokuapp.com/api/v1/drug/getAll"//tout les produit
    guard let url = URL(string: api) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      do {
         if let data = data {
           let result = try JSONDecoder().decode([DrugDTO].self, from: data)
           DispatchQueue.main.async {
              self.items = result
           }
         } else {
           print("No data")
         }
      } catch (let error) {
         print(error.localizedDescription)
      }
     }.resume()
  }
}
