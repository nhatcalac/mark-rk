import SwiftUI
struct AuthPageView: View{
    @EnvironmentObject var vm: AuthPageViewModel
    @State var loipassKtrungkhop : Bool = false
    @State var showNhomatkhau : Bool = false
    var body: some View{
        VStack{
            Text("Welcome \nBlack")
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth:.infinity,maxHeight: getRect().height/3.5,alignment: .leading)
                .padding(.horizontal)
                .background(
                    ZStack{
                        LinearGradient(colors: [.orange,.orange.opacity(0.4),.orange], startPoint:.top   , endPoint: .bottom)
                            .frame(width: 100,height: 100)
                            .clipShape(Circle())
                        Circle()
                            .foregroundColor(.red)
                            .frame(width: 100,height: 100)
                            .opacity(0.5)

                    }.frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .ignoresSafeArea()
                        .offset(y: -34)


                )
            ScrollView {
                VStack(alignment: .leading){
                    Text(vm.createAcount ? "Registion" : "Login")
                        .font(.largeTitle)
                        .bold()
                    RowLogin(titleimage: "envelope", title: "Email", hint: "nhatcalac@gmail.com", text: $vm.email)
                    RowLogin(titleimage: "lock", title: "Password", hint: "123456", text: $vm.password)
                    
                    HStack{
                        Text("Nhớ mật khẩu")
                            .font(.caption)
                        Button(action: {
                            showNhomatkhau.toggle()
                        }, label: {
                                Image(systemName: showNhomatkhau ? "chevron.down" : "")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20,height: 20)
                                    .background(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 0.9))
                        })
                    }
                    .frame(maxWidth:.infinity,alignment: .trailing)
                    .foregroundColor(.black)
                    

                    if vm.createAcount {
                        RowLogin(titleimage: "lock", title: "Retype_EnterPassword", hint: "123456", text: $vm.Retype_Enterpassword)
                    }
                    if loipassKtrungkhop{
                        Label {
                            Text("Mật khẩu nhập không trùng khớp!")
                        } icon: {
                            Image(systemName: "xmark")
                        }
                    }else
                    {
                        if vm.errorlogin != nil || vm.errorsignUp != nil {
                            if vm.errorlogin != nil {
                                Label {
                                    Text("Tên tài khoản hoặc mật khẩu không đúng!")
                                } icon: {
                                    Image(systemName: "xmark")
                                }
                            }else {
                                Label {
                                    Text("Nhập Tên tài khoản hoặc mật khẩu không đúng!")
                                } icon: {
                                    Image(systemName: "xmark")
                                }
                            }
                        }
                    }
                    Button {
                        if vm.createAcount {
                            if vm.password != vm.Retype_Enterpassword {
                                loipassKtrungkhop = true
                            }else{
                                vm.SignUp()
                            }
                        }else{
                            vm.SignIn()
                        }
                    } label: {
                        Text(vm.createAcount ? "LogUp" : "Login")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth:.infinity,maxHeight: 80)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20))
                        
                    }
                    .disabled(vm.email == "" || vm.password == "" || vm.createAcount && vm.Retype_Enterpassword == "")
                    Button {
                        withAnimation {
                            vm.createAcount.toggle()
                            vm.errorlogin = nil
                            vm.errorsignUp = nil
                            loipassKtrungkhop = false
                        }
                    } label: {
                        Text(vm.createAcount ? "Login" : "Create Account")
                            .frame(maxWidth:.infinity)
                            .padding(.vertical,4)
                    }
                }
            }
            .padding()
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(.white)
            .clipShape(CustomCorner(corner: [.topLeft,.topRight], size: 25))
            .ignoresSafeArea()
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(
            Color.purple
        )
        .onAppear{
                vm.email = ""
                vm.password = ""
                vm.Retype_Enterpassword = ""
                vm.errorlogin = nil
                vm.errorsignUp = nil
        }
    }
    func RowLogin(titleimage: String,title : String ,hint: String, text: Binding<String>) -> some View{
        VStack(alignment: .leading){
            Label(title, systemImage: titleimage)
                .font(.body)
            if title == "Password" && vm.showpassword || title == "Retype_EnterPassword" && vm.showRetype_password{
                SecureField(hint, text: text)
                
            }else
            {
                TextField(hint, text: text)
                
            }
            Divider()
        }
        .padding(.vertical,10)
        .overlay(
            Group{
                if title == "Password" || title == "Retype_EnterPassword"{
                    Button(action: {
                        if title == "Password"{
                            vm.showpassword.toggle()
                        }else if title == "Retype_EnterPassword"{
                            vm.showRetype_password.toggle()
                        }
                    }, label: {
                        if title == "Password"{
                            Text(vm.showpassword ? "show" : "hide")
                                .foregroundColor(.blue)
                                .bold()
                        }else if title == "Retype_EnterPassword"{
                            Text(vm.showRetype_password ? "show" : "hide")
                                .foregroundColor(.blue)
                                .bold()
                        }
                    })
                }
            }
                .frame(maxWidth:.infinity,alignment:.trailing)
                .padding(.top,20)
        )
    }
    
}
struct LoginPage_previewProvider: PreviewProvider{
    static var previews: some View{
        AuthPageView()
            .previewDevice("iPhone 13")
            .environmentObject(AuthPageViewModel())
        AuthPageView()
            .previewDevice("iPhone 8")
            .environmentObject(AuthPageViewModel())
    }
}
extension View {
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}
