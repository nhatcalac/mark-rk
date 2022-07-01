//
//  TabView.swift
//  With (iOS)
//
//  Created by Nhất Minh on 18/06/2022.
//

import SwiftUI

struct MainPage: View {
    @State var currentTab : Tab = .Home
    @Namespace var animation
    @State var search: String = ""
    var body: some View {
        VStack{
            TabView(selection: $currentTab){
                HomeView()
                    .tag(Tab.Home)
                SearchView()
                    .tag(Tab.Magnifyingglass)
                ProfileView().tag(Tab.Person)
            }
            //Custom Tab View
            HStack(spacing:0){
                ForEach( Tab.allCases , id: \.self){
                    tab in
                    Spacer()
                    Button {
                        withAnimation {
                            currentTab = tab
                        }
                        
                    } label: {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(currentTab == tab ? .blue : .gray)
                            .background(
                                Group{
                                    if currentTab == tab {
                                        Capsule()
                                            .fill(Color(.blue))
                                            .matchedGeometryEffect(id: "animation", in: animation)
                                            .frame( width: 60,height: 4)
                                            .padding(.bottom,58)
                                            
                                            
                                    }
                                })
                            .frame(width: 25, height: 25)
                            
                    }

                    Spacer()
                }
            }
            .frame(maxWidth:.infinity,maxHeight: 60)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.black).opacity(0.1).ignoresSafeArea())
        }
    }
}


struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainPage()
        }
    }
}
enum Tab : String ,CaseIterable{
case Home = "house"
case Magnifyingglass = "magnifyingglass"
case Bell = "bell"
case Person = "person"
}
