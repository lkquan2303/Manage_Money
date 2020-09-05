//
//  ContentView.swift
//  Manage_Money
//
//  Created by Uri on 9/4/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        SignUpView()
    }
}
struct LoginView: View {
    @State var model = ModelData()
    var body: some View{
        VStack{
            Image("logo").padding(.horizontal).padding(.vertical).frame(width: UIScreen.main.bounds.width)
            HStack{
                Text("Manage").font(.system(size: 30)).fontWeight(.bold).foregroundColor(Color.white)
                Text("Your Money").font(.system(size: 30)).fontWeight(.bold).foregroundColor(Color(.yellow))
            }.padding(.top)
            VStack(spacing: 20){
                CustomTextField(image: "person", placeHolder: "Email", txt: $model.email)
                CustomTextField(image: "lock", placeHolder: "Password", txt: $model.password)
            }.padding(.top)
            Button(action: {
                
            }) {
                Text("LOGIN")
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .clipShape(Capsule())
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.top)
                
            }
            HStack{
                Text("Don't have an account?").opacity(0.5)
                Button(action: {
                    
                }) {
                    Text("Sign Up Now").foregroundColor(Color.white)
                }
            }.padding(.top, 8)
            Spacer()
            Button(action: {
                
            }) {
                Text("Forget Password?").foregroundColor(Color.white)
            }
            Spacer(minLength: 0)
        }
        .background(LinearGradient(gradient: .init(colors: [Color(.systemPink).opacity(0.5), Color(.purple).opacity(0.5)]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all))
    }
}
struct SignUpView: View {
    @State var model = ModelData()
    var body: some View{
        VStack{
            Image("logo")
                .frame(width: UIScreen.main.bounds.width)
                .padding(.horizontal)
                .padding(.vertical, 20)
            VStack{
                HStack{
                    Text("New").font(.system(size: 30)).fontWeight(.bold).foregroundColor(Color.white)
                    Text("Profile").font(.system(size: 30)).fontWeight(.bold).foregroundColor(Color(.yellow))
                }
                Text("Create a pofile for you !!!").opacity(0.5)
            }
            VStack(spacing: 20){
                CustomTextField(image: "person", placeHolder: "Email", txt: $model.emailSignup)
                CustomTextField(image: "lock", placeHolder: "Password", txt: $model.emailSignup)
                CustomTextField(image: "lock", placeHolder: "Re-Password", txt: $model.emailSignup)
            }
            .padding(.horizontal)
            .padding(.top)
            Button(action: {
                
            }) {
                Text("SIGNUP")
                    .foregroundColor(Color.purple)
                    .fontWeight(.bold)
            }
            .frame(width: UIScreen.main.bounds.width - 30)
            .padding(.vertical)
            .background(Color.white)
            .cornerRadius(30)
            .padding(.top, 15)
            Spacer(minLength: 0)
        }
        .padding(.top, 25)
        .background(LinearGradient(gradient: .init(colors: [Color(.systemPink).opacity(0.5), Color(.purple).opacity(0.5)]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}
struct CustomTextField: View {
    var image: String
    var placeHolder: String
    @Binding var txt: String
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            Image(systemName: image)
                .font(.system(size: 24))
                .foregroundColor(Color(.white))
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            ZStack{
                if placeHolder == "Password" || placeHolder == "Re-Password"{
                    SecureField(placeHolder, text: $txt)
                }else{
                    TextField(placeHolder, text: $txt)
                }
            }
            .padding(.horizontal)
            .padding(.leading, 55)
            .frame(height: 60)
            .background(Color.white.opacity(0.4))
            .clipShape(Capsule())
        }.padding(.horizontal)
    }
}
//MVVM Model
class ModelData: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var emailSignup = ""
    @Published var passwordSignup = ""
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
