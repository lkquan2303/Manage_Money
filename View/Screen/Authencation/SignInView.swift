//
//  SignInView.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI
import Combine
struct SignInView: View {
    @State var model = UserData()
    @State var isLinkSend = false
    @State var isError = false
    @State var error = ""
    @State var isShowLoading = false
    @EnvironmentObject var session: AuthenSessionStore
    @EnvironmentObject var userData: UserData
    var body: some View{
        NavigationView{
            ZStack{
                ZStack{
                    NavigationLink(destination: HomePageView()){
                        EmptyView()
                    }
                }
                VStack{
                    Image("logo").padding(.horizontal).padding(.vertical).frame(width: UIScreen.main.bounds.width)
                    HStack{
                        Text("Manage").font(.system(size: 30)).fontWeight(.bold).foregroundColor(Color.white)
                        Text("Your Money").font(.system(size: 30)).fontWeight(.bold).foregroundColor(Color(.yellow))
                    }.padding(.top)
                    VStack(spacing: 20){
                        CustomTextField(image: Images.person, placeHolder: "Email", txt: $userData.email)
                        CustomTextField(image: Images.lock, placeHolder: "Password", txt: $userData.password)
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    Button(action: {
                        withAnimation {
                            self.isShowLoading = true
                            self.session.signIn(email: self.userData.email, password: self.userData.password) { (auth, error) in
                                if (error != nil) {
                                    withAnimation {
                                        self.userData.isAlert.toggle()
                                        self.isShowLoading = false
                                    }
                                }else{
//                                    self.isShowLoading = false
                                }
                            }
                        }
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
//                                self.isShowSignUp = true
                                self.userData.isSignUp = true
                            }
                        }) {
                            Text("Sign Up Now").foregroundColor(Color.white)
                        }
                    }.padding(.top, 8)
                    Spacer()
                    Button(action: {
                        self.session.resetPassword()
                    }) {
                        Text("Forget Password?").foregroundColor(Color.white)
                    }
                    Spacer(minLength: 0)
                }
                .background(LinearGradient(gradient: .init(colors: [.yellow, .orange]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
                .alert(isPresented: $userData.isLinkSend) {
                    Alert(title: Text("Message"), message: Text("Password Reset Link Has Been Sent."), dismissButton: .destructive(Text("OK")))
                }
//                ZStack{
//                    LoadingPageView()
//                }.offset(x: 0, y: self.isShowLoading ? 0 : UIScreen.main.bounds.height)
                ZStack{
                    SignUpView(isShowSignUp: self.$userData.isSignUp, isShowLoading: $isShowLoading)
                }.offset(x: 0, y: self.userData.isSignUp ? 0 : UIScreen.main.bounds.height)
                if self.userData.isAlert{
                    ErrorView(alert: self.$userData.isAlert)
                }
                if self.isShowLoading{
                    LoadingPageView()
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        
    }
}
