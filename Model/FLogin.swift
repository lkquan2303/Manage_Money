//
//  FLogin.swift
//  Manage_Money
//
//  Created by Uri on 9/7/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import SwiftUI

//MVVM Model
class ModelData: ObservableObject{
    @Published var isShowSignUp = false
    @Published var email = ""
    @Published var password = ""
    @Published var emailSignup = ""
    @Published var passwordSignup = ""
}
