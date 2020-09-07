//
//  SignInView.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @State var model = ModelData()
    @State var isShowSignUp = false
    var body: some View{
        ZStack{
            VStack{
                Image("logo").padding(.horizontal).padding(.vertical).frame(width: UIScreen.main.bounds.width)
                HStack{
                    Text("Manage").font(.system(size: 30)).fontWeight(.bold).foregroundColor(Color.white)
                    Text("Your Money").font(.system(size: 30)).fontWeight(.bold).foregroundColor(Color(.yellow))
                }.padding(.top)
                VStack(spacing: 20){
                    CustomTextField(image: "person", placeHolder: "Email", txt: $model.email)
                    CustomTextField(image: "lock", placeHolder: "Password", txt: $model.password)
                }
                .padding(.top)
                .padding(.horizontal)
                Button(action: {
                    
                }) {
                    Text("SIGNIN")
                        .fontWeight(.bold)
                        .foregroundColor(Color.orange)
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
                        withAnimation{
                            self.isShowSignUp = true
                        }
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
            .background(LinearGradient(gradient: .init(colors: [.yellow, .orange]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all))
            ZStack{
                SignUpView(isShowSignUp: $isShowSignUp)
            }.offset(x: 0, y: self.isShowSignUp ? 0 : UIScreen.main.bounds.height)
        }
        
    }
}
