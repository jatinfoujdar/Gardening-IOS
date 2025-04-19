import SwiftUI

struct NoteListView: View {
    
    let myGardenVegetable: MyGardenVegetableModel
    @State private var addNotePresented : Bool = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("Add Note"){
                        addNotePresented = true
                    }
                }
            }.sheet(isPresented: $addNotePresented){
                AddNoteView(myGardenVegetable: myGardenVegetable)
            }
        
    }
}

#Preview {
    NavigationStack{
        NoteListView(myGardenVegetable: MyGardenVegetableModel(vegetableModel: PreviewData.loadVegetable()[0], plantOption: .seed))
    }
}
