//
//  RegisterView.swift
//  Epharma
//
//  Created by Usager on 2022-02-20.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var clients: FetchedResults<Users>
    
        @State var username1 : String = ""
        @State var email1 : String = ""
        @State var password1 : String = ""
        @State var passwordConfirmed : String = ""
        @State var message : String = ""
        @State var type = ""
        @State var connected = false
    
    let types = ["Pharmacien","Client"]
    
    private var validated: Bool {
        !username1.isEmpty || !password1.isEmpty || !email1.isEmpty || !passwordConfirmed.isEmpty
        
    }
    
    private var validated2: Bool {
        password1 == passwordConfirmed
    }
    
        var body: some View {
                VStack(spacing:10){
                    Image("logo2-1")
                        .resizable()
                        .background(Color.white)
                        .clipShape(Circle())
                        .frame(width:150 , height: 150)
                        .padding(.top, 50)
                    NavigationLink("", destination: HomeView(), isActive: $connected)
                    VStack{
                        HStack{
                            Image(systemName: "envelope.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                            TextField("Email", text: $email1)
                                .cornerRadius(5.0)
                        }.padding()
                        Divider()
                        HStack{
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                            TextField("Username", text: $username1)
                                .cornerRadius(5.0)
                        }.padding()
                        Divider()
                        HStack{
                            Image(systemName: "lock.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(.blue)
                            SecureField("Mot de passe", text: $password1)
                                .cornerRadius(5.0)
                            Button(action: {}){Image(systemName: "eye.circle.fill")
                                .foregroundColor(.blue)}
                        }.padding()
                        Divider()
                        HStack{
                            Image(systemName: "lock.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20, alignment: .center)
                                .foregroundColor(.blue)
                            SecureField("Confirmer mot de passe", text: $passwordConfirmed)
                                .cornerRadius(5.0)
                            Button(action: {}){Image(systemName: "eye.circle.fill")
                                .foregroundColor(.blue)}
                        }.padding()
                    }.padding()
                    .background(Color.white)
                    
                    HStack{
                        Text($message.wrappedValue)
                    }
                    
                    Button(action: {self.validation()},
                           label: {
                            Text("S'enregistrer")
                           }).font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 154, height: 45)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                    Spacer()
                }.background(Image("back2")
                                .resizable()
                                .opacity(0.8))
                .padding()
                .navigationTitle("S'enregistrer")
        }
    
    func validation(){
        if validated == false {
            message = "Veuillez remplir tous les champs"
        }
        else if validated2 == false && validated{
            message = "Mots de passe différents"
        }
        else {
            message = ""
            register()
            connected.toggle()
        }
        
    }
    
    func register(){
        let newUser = Users(context: moc)
            newUser.userID = UUID()
            newUser.username = username1
            newUser.email = email1
            newUser.type = type
            newUser.password = password1
            
        do{
            try moc.save()
            print("Enregistré")
            UserDefaults.standard.account?.email = email1
            UserDefaults.standard.account?.name = username1
            for client in clients {
                print("\(client.username)")
            }
        }
        catch
        {
         let nserror = error as NSError
         fatalError("error \(nserror), \(nserror.userInfo)")
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
