//
//  RequestVieuwModel.swift
//  Epharma
//
//  Created by Usager on 2022-05-03.
//

import Foundation
class RequestViewModel: ObservableObject {
  @Published var items = [RequestDTO]()//liste de requete
  func fetchData() {
    let api = "https://spring-boot-server-ios-tp.herokuapp.com/api/v1/request/getByUser/1"
    //request get by id user toutes le requete dont le iduser  est 2(sera remplace par lid de user curent)
    guard let url = URL(string: api) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      do {
         if let data = data {
           let result = try JSONDecoder().decode([RequestDTO].self, from: data)
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
