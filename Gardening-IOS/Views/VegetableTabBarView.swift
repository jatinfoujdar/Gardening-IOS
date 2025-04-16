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
                MyGardenView()
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
        .modelContainer(PreviewContainer)
        .preferredColorScheme(.dark)
}
