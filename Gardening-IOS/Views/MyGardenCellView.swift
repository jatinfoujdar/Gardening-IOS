import SwiftUI


struct MyGardenCellView: View {
    let myGardenVegetable : MyGardenVegetableModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MyGardenCellView(myGardenVegetable: MyGardenVegetableModel(vegetableModel: PreviewData.loadVegetable()[0],plantOption: .seed))
}
