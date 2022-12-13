//
//  ContentView.swift
//  Epharma
//
//  Created by Hervé Leka Ndombet on 2022-02-07.
//

import SwiftUI
import CoreData

struct ConnexionView:View{
    let service = ConnectionService()

    @Environment(\.managedObjectContext) var moc
    
        @State var auth = AuthenticationDTO()
        @State var connected = false
        @State var page = false
        @State var message : String = ""
    
    private var validated: Bool {
        !auth.username.isEmpty || !auth.password.isEmpty
        }
    
    var body: some View {
            NavigationView{
                VStack(spacing:10){
                    Image("logo2-1")
                        .resizable()
                        .background(Color.white)
                        .clipShape(Circle())
                        .frame(width:200 , height: 200)
                        .padding(.top, 50)
                    NavigationLink("", destination:HomeView(), isActive: $connected)
                    NavigationLink("", destination: RegisterView().navigationTitle("S'enregistrer")
                        .navigationBarTitleDisplayMode(.inline), isActive: $page)
                    VStack{
                        HStack{
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                            TextField("Username", text: $auth.username)
                                .cornerRadius(5.0)
                        }.padding()
                        Divider()
                        HStack{
                            Image(systemName: "lock.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(.blue)
                            SecureField("Password", text: $auth.password)
                                .cornerRadius(5.0)
                            Button(action: {}){Image(systemName: "eye.circle.fill")
                                    .foregroundColor(.blue)}
                        }.padding()
                    }
                    .padding()
                    .background(Color.white)
                   
                    HStack{
                        Text($message.wrappedValue)
                    }
                    
                    Button(action: self.validation,
                           label: {
                            Text("Se connecter")
                           }).font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 154, height: 45)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                    Spacer()
                    HStack(spacing:0){
                        Button(action: {}) {
                            Image("facebook")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        .background(Color.white)
                        .clipShape(Circle())
                        .frame(width: 70, height: 70)
                        .padding()
                        Button(action: {}) {
                            Image("google")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        .background(Color.white)
                        .clipShape(Circle())
                        .frame(width: 70, height: 70)
                        .padding()
                    }.padding(.bottom, 50)
                    HStack(spacing: 0) {
                        Text("Pas de compte? ")
                        Button(action: {page.toggle()}) {
                            Text("S'enregistrer")
                        }
                    }.padding(.bottom, 70)
                }.background(Image("back2")
                                .resizable()
                                .opacity(0.8))
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Connexion")
            }
        }
    func validation(){
        if validated == false {
            message = "Veuillez remplir tous les champs"
        }
        else {
            message = ""
            connect()
        }
    }
    
    func connect(){
        service.connect(auth: auth) { (status, acc) in
            if status == .success{
            do{
                let request = NSFetchRequest<Users>(entityName: "Users")
                
                request.predicate = NSPredicate(format: "username == %@ AND password == %@", auth.username, auth.password)
                
                
                request.sortDescriptors =
                 [NSSortDescriptor(key: "username", ascending: true),
                 NSSortDescriptor(key: "password", ascending: true)]
                
                print("reussi")
                let result = try moc.fetch(request)
                
                print("\(result)")
                
                if result.count == 0{
                    print("Utilisateur non trouvé")
                }
                else {
                    connected.toggle()
                    UserDefaults.standard.account?.name = auth.username
                    for client in result {
                    UserDefaults.standard.account?.email = (client.email)!
                        print("\(client.username)")
                    }
                    
                }
            }
            catch{
                 fatalError("Fail to fetch: \(error)")
                }
                //FetchRequest(entity: Users.entity(),sortDescriptors: []) var users : FetchedResults<Users>

            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConnexionView()
    }
}

