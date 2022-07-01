//
//  AuthViewModel.swift
//  With (iOS)
//
//  Created by Nhất Minh on 16/06/2022.
import SwiftUI
import Firebase
import FirebaseFirestore
class AuthModel : ObservableObject {
    @Published var errorsignin : Bool = false
    @Published var errorsignup : Bool = false
    @Published var currentUser : FirebaseAuth.User?
    func signin(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in
            if let error = error {
                print("error signin : \(error.localizedDescription)")
                self.errorsignin = true
                return
            }
            self.currentUser = result?.user
        }
    }
    func signup(email : String , password : String){
        Auth.auth().createUser(withEmail: email, password: password){
            resulf , error in
            if let error = error {
                print("error create : \(error.localizedDescription)")
                self.errorsignup = true
                return
            }
            self.currentUser = resulf?.user
            let data = ["email": email , "password": password]
            Firestore.firestore().collection("User").document().setData(data){
                error in
                print("error loadData firebase : \(String(describing: error?.localizedDescription))")
            }
        }
    }
    func signout(){
        self.currentUser = nil
        try? Auth.auth().signOut()
    }
}
