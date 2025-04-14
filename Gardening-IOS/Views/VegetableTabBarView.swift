import SwiftUI


struct VegetableTabBarView: View {
    var body: some View {
        TabView{
            NavigationStack{
                ContentView()
            }.tabItem{
                    Image(systemName: "leaf")
                    Text("Vegetables")
                }
            NavigationStack{
                Text("My Graden Screen")
            }    .tabItem{
                    Image(systemName: "house")
                    Text("My Garden")
                }
            NavigationStack{
                Text("Pests")
            }    .tabItem{
                    Image(systemName: "ladybug")
                    Text("Pests")
                }
        }
    }
}

#Preview {
    VegetableTabBarView()
        .preferredColorScheme(.dark)
}
