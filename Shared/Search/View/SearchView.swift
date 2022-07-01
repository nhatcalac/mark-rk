//
//  SearchView.swift
//  With (iOS)
//
//  Created by Nhất Minh on 19/06/2022.
//

import SwiftUI

struct SearchView: View {
    @State var isshowSheet = false
    @State var isshow = false
    var body: some View {
        VStack{
            Button {
                withAnimation(.easeInOut) {
                    isshowSheet.toggle()
                }
            } label: {
                    if isshowSheet {
                        Text("showSheetsdfsdf")
                    }
                    else{
                        Text("Sheet")
                    }
            }
            Text(isshow.description)
        }
        .sheet(isPresented: $isshowSheet,onDismiss: {
            isshow.toggle()
        }) {
            Button {
                withAnimation() {
                    isshowSheet.toggle()
                }
            } label: {
                Text("hello")
            }
                .frame(maxWidth:.infinity , maxHeight: .infinity)
                
        }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchView()
        }
    }
}
