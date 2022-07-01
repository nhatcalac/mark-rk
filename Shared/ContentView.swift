import SwiftUI
import CoreData
struct ContentView : View{
    @EnvironmentObject var ap : AuthPageViewModel
    @EnvironmentObject var vm : PersistenceViewModel
    @State var text : String = ""
   
    var body: some View{
//        if vm.currentUser == nil {
//            AuthPageView()
//        }else{
//            MainPage()
//        }
        VStack{
            VStack{
                TextField("add Fruit", text: $text)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .background(Color(.cyan))
                    .cornerRadius(10)
                    .padding(.horizontal)
                Button {
                    guard !text.isEmpty else { return }
                    vm.addFruits(text: text)
                    text = ""
                } label: {
                    Text("add")
                        .frame(maxWidth:.infinity)
                        .frame(height:20)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(20)
                        .padding(.horizontal,80)
                        
                }

            }
            List{
                ForEach(vm.fruits){
                    fruits in
                    Text(fruits.name ?? "hello")
                }
                .onDelete { IndexSet in
                    vm.deleteFruit(index: IndexSet)
                }
            }
        }
    }
}
struct ContentView_PreviewProvider : PreviewProvider{
    static var previews: some View{
        NavigationView {
            ContentView()
                .environmentObject(AuthPageViewModel())
                .environmentObject(PersistenceViewModel())
        }
    }
}

