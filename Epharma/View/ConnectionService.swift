//
//  ConnectionService.swift
//  Epharma
//
//  Created by Hervé Leka Ndombet on 2022-02-21.
//

import Foundation
import Combine

enum Completion {
    case success
    case error
}
class ConnectionService{
    var suscribe : Cancellable?

    func connect (auth: AuthenticationDTO,  onComplete: @escaping(_ status: Completion, _ accouunt : AccountDTO?)-> Void){
        let url = URL(string: "https://my-json-server.typicode.com/HervLeks/JSON/account")
        //let url = URL(string: "https://spring-boot-server-ios-tp.herokuapp.com/api/v1/client/get/josuelubaki@gmail.com/josue123")!//Client
        //Pour get le client via mail et pass word et sa te responce un client DTO
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        //request.httpBody = auth.toJson
        print("step1==================")
        let task = URLSession.DataTaskPublisher(request: request, session: .shared)
        self.suscribe = task.sink { complete in
            switch complete {
                case .finished:
                    print("Terminé")
                
                case .failure(let err) :
                    print(err)
                    DispatchQueue.main.async {
                        onComplete(.error, nil)
                    }
            }
            
        } receiveValue: { response in
            let code = (response.response as! HTTPURLResponse).statusCode
            print("step2==================")
            if code == 200{
                //print("step3=================\(String(data: response.data, encoding: .utf8))")
                let account = AccountDTO.decode(data: response.data)
                UserDefaults.standard.account = account
                DispatchQueue.main.async {
                    onComplete(.success, account)
                }
            }
        }

    }
    func posted (req: RequestDTO){
        let url = URL(string: "http://localhost/server.php")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        let datask = req.toJson

        let task = URLSession.shared.uploadTask(with: request, from: datask) { data, response, error in
            if error != nil {
                DispatchQueue.main.async
                {
                    print("Upload Didn't Work?")
                    print("Looks like the connection to the server didn't work.  Do you have Internet access?")

                }
            }
            else
            {
                if let unwrappedData = data {
                    
                    let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    
                    if returnedData == "1"
                    {
                        DispatchQueue.main.async
                        {
                            print("Upload OK?")
                            print("Looks like the upload and insert into the database worked.")
                        }
                    }
                    else
                    {
                        DispatchQueue.main.async
                        {

                        print("Upload Didn't Work")
                        print("Looks like the insert into the database did not worked.")
                        }
                    }
                }
            }
        }
        task.resume()
}
}
