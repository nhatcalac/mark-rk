//
//  hello.swift
//  With (iOS)
//
//  Created by Nhất Minh on 17/06/2022.
//

import SwiftUI
struct LoginView: View {
    var body : some View {
        VStack{
            Rectangle()
                .foregroundColor(.blue)
        }
    }
}
struct LoginView_Previewprovider : PreviewProvider{
    static var previews: some View{
        LoginView()
    }
}
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
