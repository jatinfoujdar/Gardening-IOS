import SwiftUI
import SwiftData

struct MyGardenView: View {
    @Query private var myGardenVegetables : [MyGardenVegetableModel]
    
    var body: some View {
        List(myGardenVegetables){myGardenVegetable in
            Text(myGardenVegetable.vegetableModel.name)
        }
    }
}

#Preview {
    NavigationStack{
        MyGardenView()
    }.modelContainer(PreviewContainer)
}
