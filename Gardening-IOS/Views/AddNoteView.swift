//
//  AddNoteView.swift
//  Gardening-IOS
//
//  Created by jatin foujdar on 19/04/25.
//

import SwiftUI

struct AddNoteView: View {
    let myGardenVegetable: MyGardenVegetableModel
    
    @State private var noteTitle: String = ""
    @State private var noteBody: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form{
            TextField("Title", text: $noteTitle)
            TextEditor(text: $noteBody)
                .frame(minHeight: 200)
        }.toolbar{
            
            ToolbarItem(placement: .topBarTrailing){
                Button("Cancel"){
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing){
                Button("Save"){
                    
                }
            }
        }
    }
}

#Preview {
    AddNoteView(myGardenVegetable: MyGardenVegetableModel(vegetableModel: PreviewData.loadVegetable()[0], plantOption: .seed))
}
