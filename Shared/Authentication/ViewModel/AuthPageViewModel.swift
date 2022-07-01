//
//  RegistionViewModel.swift
//  With (iOS)
//
//  Created by Nhất Minh on 17/06/2022.
//

import SwiftUI
import Firebase
import FirebaseFirestore
class AuthPageViewModel: ObservableObject{
    // Login propertis
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var showpassword : Bool = false
    
    // Registion propertis
    @Published var Retype_Enterpassword : String = ""
    @Published var createAcount : Bool = false
    @Published var showRetype_password : Bool = false
    
    //current USer
    @Published var currentUser : FirebaseAuth.User?
    
    // Error login
    @Published var errorlogin : Error?
    @Published var errorsignUp : Error?
    
    // Login
    func SignIn(){
        Auth.auth().signIn(withEmail: email, password: password){
            result , error in
            if let error = error {
                print("error SignIn : \(error.localizedDescription) ")
                self.errorlogin = error
                return
            }
            if let resulf = result {
                self.currentUser = resulf.user
            }
        }
    }
    func SignUp(){
        Auth.auth().createUser(withEmail: email, password: password){
            result , error in
            if let error = error {
                print("error SignUp : \(error.localizedDescription) ")
                self.errorsignUp = error
                return
            }
            if let resulf = result {
                let data = ["email": self.email , "password" : self.password]
                Firestore.firestore().collection("User").document().setData(data){
                    error in
                    if let error = error {
                        print("error dowload Data firebase : \(error.localizedDescription)")
                        return
                    }
                    self.currentUser = resulf.user
                }
            }
        }
    }
    func SignOut(){
        try? Auth.auth().signOut()
        currentUser = nil
    }
}
