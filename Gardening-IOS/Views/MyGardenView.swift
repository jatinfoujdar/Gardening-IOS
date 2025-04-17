import SwiftUI
import SwiftData

struct MyGardenView: View {
    @Query private var myGardenVegetables : [MyGardenVegetableModel]
    
    var body: some View {
        List(myGardenVegetables){myGardenVegetable in
            MyGardenCellView(myGardenVegetable: myGardenVegetable)
        }
        .listStyle(.plain)
        .navigationTitle("My Garden")
    }
}

#Preview {
    NavigationStack{
        MyGardenView()
    }.modelContainer(PreviewContainer)
}
