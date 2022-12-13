//
//  ExtensionTools.swift
//  Epharma
//
//  Created by Hervé Leka Ndombet on 2022-02-21.
//

import Foundation


extension Decodable {
    static func decode (data:Data) -> Self? {
        
        do {
            let decoder = JSONDecoder()
            let RFC3339DateFormatter = DateFormatter()

            RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

            RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

            decoder.dateDecodingStrategy = .formatted(RFC3339DateFormatter)

            decoder.keyDecodingStrategy = .useDefaultKeys
            return try decoder.decode(Self.self, from: data)
        }
        catch {
            print(error)
        }
        return nil
    }
}

extension Encodable {
    var toJson : Data? {
        let encoder = JSONEncoder()
        let RFC3339DateFormatter = DateFormatter()

        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

        RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)

        encoder.dateEncodingStrategy = .formatted(RFC3339DateFormatter)

        do{
            
            return try encoder.encode(self)
        }
        catch {
            print(error)
        }
        return nil
    }
}

extension UserDefaults {

    dynamic var account: AccountDTO? {

        get {

            let data = self.data(forKey: UdKeys.account.rawValue)

            return data != nil ?  AccountDTO.decode(data: data!) : nil

        }

        set{

            if newValue == nil {

                self.removeObject(forKey: UdKeys.account.rawValue)

                return

            }

            self.set(newValue.toJson, forKey: UdKeys.account.rawValue)

        }

    }
   
}
