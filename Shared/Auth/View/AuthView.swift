////
////  AuthView.swift
////  With (iOS)
////
////  Created by Nhất Minh on 15/06/2022.
////
//
//import SwiftUI
//struct AuthView: View {
//    @EnvironmentObject var vm : AuthModel
//    @State var textemail : String
//    @State var textpassword : String
//    var body: some View {
//            ZStack{
//                backgound
//                SingInView
//            }
//            .ignoresSafeArea()
//    }
//}
//
//struct AuthView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthView(textemail: "", textpassword: "")
//            .environmentObject(AuthModel())
//    }
//}
//extension AuthView{
//    var backgound : some View {
//        ZStack(alignment:.top){
//            LinearGradient(
//                gradient: Gradient(stops: [
//                    .init(color: Color(#colorLiteral(red: 0.8916666507720947, green: 0.11888885498046875, blue: 0.11888885498046875, alpha: 1)), location: 0),
//                    .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)), location: 1)]),
//                startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17),
//                endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))
//            .opacity(0.3)
//            //Ellipse 2
//            Ellipse()
//                .fill(Color(#colorLiteral(red: 0.8041666746139526, green: 0.39873263239860535, blue: 0.39873263239860535, alpha: 0.30000001192092896)))
//                .frame(width: 377, height: 335)
//                .offset(x: 201,y: -27)
//            //Ellipse 1
//            Ellipse()
//                .fill(Color(#colorLiteral(red: 0.8041666746139526, green: 0.39873263239860535, blue: 0.39873263239860535, alpha: 0.30000001192092896)))
//                .frame(width: 396, height: 335)
//                .offset(x: -134,y:484)
//
//        }
//    }
//
//
//    var SingInView: some View{
//        ZStack(alignment:.top){
//            //Rectangle 3
//            ZStack{
//                Rectangle().foregroundColor(Color(#colorLiteral(red: 0.8083333373069763, green: 0.19871526956558228, blue: 0.19871526956558228, alpha: 1)))
//                    .opacity(0.3)
//                LinearGradient(
//                            gradient: Gradient(stops: [
//                        .init(color: Color(#colorLiteral(red: 0.4958333373069763, green: 0.3842708468437195, blue: 0.3842708468437195, alpha: 1)), location: 0),
//                        .init(color: Color(#colorLiteral(red: 0.8083333373069763, green: 0.19871526956558228, blue: 0.19871526956558228, alpha: 0)), location: 1),
//                        .init(color: Color(#colorLiteral(red: 0.8541666865348816, green: 0.014236092567443848, blue: 0.014236092567443848, alpha: 0)), location: 1)]),
//                            startPoint: UnitPoint(x: 0.15285709675454007, y: 0.026785746819125933),
//                            endPoint: UnitPoint(x: 1.1814285573175383, y: 1.2247024173783139))
//            }
//            .frame(width: 350, height: 336)
//                .clipShape(RoudShape(corner: [.topLeft,.topRight,.bottomLeft], size: CGSize(width: 30, height: 30)))
//                .clipShape(RoudShape(corner: [.bottomRight], size: CGSize(width: 70, height: 70)))
//            VStack(spacing:20){
//                RowAuth(titleimage: "person", title: "Email", text: $textemail)
//                RowAuth(titleimage: "lock", title: "Mật khẩu", text: $textpassword)
//
//                buttonsignin
//                    .padding()
//                HStack{
//                    Text("Chưa có tài khoản?")
//                    NavigationLink{
//                        withAnimation(.easeIn){
//                            RegistionView(textemail: "", textpassword: "", textpasswordAuth: "")
//                                .navigationBarHidden(true)
//                        }
//                    }label: {
//                        Text("Đăng Ký")
//                            .fontWeight(.heavy)
//                    }
//                }
//                .foregroundColor(.white)
//                .padding(.top,20)
//            }
//                .padding(.top,40)
//            if vm.errorsignin{
//                withAnimation(.easeOut) {
//                    Text("Tài Khoản hoặc mật khẩu không đúng.")
//                        .foregroundColor(.white)
//                        .font(.caption)
//                        .padding(.top,165)
//                        .padding(.leading,40)
//                }
//            }
//        }
//    }
//
//
//    var buttonsignin : some View{
//        Button(action: {
//            vm.signin(email: textemail, password: textpassword)
//        }, label: {
//            ButtonSignIn(title: "Đăng Nhập")
//        })
//    }
//}
//
//
