//
//  ProfileView.swift
//  With (iOS)
//
//  Created by Nhất Minh on 18/06/2022.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var vm : AuthPageViewModel
    var body: some View {
        VStack(){
            Button {
                vm.SignOut()
            } label: {
                Label("Logout", systemImage: "arrowshape.turn.up.left")
                    .font(.title)
                    .padding()
            }

        }.frame(maxWidth:.infinity, maxHeight: .infinity,alignment: .bottomLeading)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthPageViewModel())
    }
}
