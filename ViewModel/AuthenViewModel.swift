//
//  AuthenViewModel.swift
//  Manage_Money
//
//  Created by Uri on 9/12/20.
//  Copyright © 2020 Uri. All rights reserved.
//

import Foundation
import Firebase
class AuthenViewModel {
    func authenLogin(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if err != nil{
                //TODO
            }else{
                print("ERROR")
            }
            print("Success")
            UserDefaults.standard.set(true, forKey: "status")
            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
        }
    }
    func registerUser(email: String, password: String, rePassword: String){
        if password == rePassword{
            Auth.auth().createUser(withEmail: email, password: password){(res, err) in
                if err != nil{
                    
                    return
                }
                print("success")
            }
        }
    }
    func resetPassword(){
        let alert = UIAlertController(title: "Reset Password", message: "Enter your E-Mail ID to Reset Your Password", preferredStyle: .alert)
        
        alert.addTextField{(email) in
            email.placeholder = "Email"
        }
        let proceed = UIAlertAction(title: "Reset", style: .default){(_) in
//            self.model.resetEmail = alert.textFields![0].text!
  //          self.model.isLinkSend = true
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(proceed)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
    func verifySignIn(email: String, password: String) -> Bool {
        if email != "" && password != ""{
            return false
        }
        return true
    }
}
