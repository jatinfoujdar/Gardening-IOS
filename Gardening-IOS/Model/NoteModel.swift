import Foundation
import SwiftData

@Model
class NoteModel{
    var title: String
    var body: String
    var dateCreated: Date
   
    
    var myGardenVagetable: MyGardenVegetableModel?
    
    init(title: String, body: String, dateCreated: Date = Date()) {
        self.title = title
        self.body = body
        self.dateCreated = dateCreated
    }
}

