//
//  DTO.swift
//  Epharma
//
//  Created by Hervé Leka Ndombet on 2022-02-14.
//

import Foundation


struct AuthenticationDTO : Codable {
    var username : String = ""
    var password : String = ""
}

struct AccountDTO : Codable{
    var name : String = ""
    var lastname : String = ""
    var lastconnected : Date
    var sexe : String = ""
    var type : Int
    var email : String = ""
}

//----------new
struct DrugDTO:Codable{
    let id :Int
    let idDrug :String
    let name:String
    let  title :String
    let  description :String
}
//---------new
struct RequestDTO:Codable{
    let id :Int
    let idPharma :Int
    let idUser :Int
    let idDrug :Int
    let status:String
    let  comment :String
    let lastconnected:Date?
}

struct LatlonDTO : Codable {
    var latitude : Float
    var longitude : Float
}
//----------new
struct ClientDTO:Codable{
   
    let id :Int
    let name:String
    let  lastname :String
    let sexe:String
    let  email :String
    let lastconnected:Date?
    let  password :String
    let  type: Int
    let  username :String
}

enum UdKeys : String {
    case account = "account"
    case request = "request"
}
