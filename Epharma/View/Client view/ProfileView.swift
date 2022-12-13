//
//  ProfileView.swift
//  Epharma
//
//  Created by Usager on 2022-03-27.
//

import SwiftUI
var request = UserDefaults.standard.account!
var us:Usert = Usert (name:request.name,email: request.email,sexe:request.sexe)

struct ProfileView: View {
    @State private var userName=""
    @State private var Email=""
    @State private var naissance = Date()
    @State private var sexType = 0
    @State var disconnected = false

    // definition of Picker's items
       let sexTypes = ["Femme", "Homme"]
       // definition of the variable where we will save the value selected
    var disabledForm: Bool{
        userName.isEmpty || Email.isEmpty   || sexType==0
       }
    
    
    func SendData(){
    
        us.name=userName
        us.email=Email
        us.sexe=sexTypes[0]
        userName=""
        Email=""
        sexType=0
    }
       
    var body: some View {
        
        
        VStack{
            NavigationLink("", destination: ConnexionView().navigationBarTitle("")
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true), isActive: $disconnected)
            
            Form{
                Section(header: Text("Identite ")) {
                    Text("Nom :"+us.name)
                    Text("Email :"+us.email)
                    if(us.sexe == "Femme"){
                        Text("Sexe :Femme")
                    }else {Text("Sexe :Homme")}
                    
                }.lineSpacing(20.0)
                Section(header: Text("Modifier Infos ")) {
                    TextField("Nom",text:$userName)
                    TextField("Email",text:$Email)
                    Picker("Sexe", selection: $sexType){
                        ForEach(0..<self.sexTypes.count)
                            {Text(self.sexTypes[$0])}
                    }
                }
            Button(action: SendData) {
                        Text("Modifier")
                    }.font(.headline)
                       .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                       .background(Color.blue)
                       .cornerRadius(15.0)
            }
                .disabled(disabledForm)
            Spacer()
            Button (action: {disconnected.toggle()}) {
                        Text("Deconnexion")
                    }.font(.headline)
                       .foregroundColor(.white)
                       .padding()
                       .frame(width: 154, height: 45)
                       .background(Color.red)
                       .cornerRadius(15.0)
        }.padding()
        .navigationBarTitle("Informations")
        .navigationBarBackButtonHidden(true)
        
    }
}
           
     

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
