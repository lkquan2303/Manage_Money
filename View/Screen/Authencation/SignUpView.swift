//
//  SignUpView.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @Binding var isShowSignUp: Bool
    @Environment(\.presentationMode) var presentationMode
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
                withAnimation{
                    self.isShowSignUp = false
                    print("AA")
                }
            }) {
                Text("SIGNUP")
                    .foregroundColor(Color.orange)
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .padding(.vertical)
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding(.top, 15)
            }
            
            Spacer(minLength: 0)
        }
        .padding(.top, 25)
        .background(LinearGradient(gradient: .init(colors: [.yellow, .orange]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)
    }
}
