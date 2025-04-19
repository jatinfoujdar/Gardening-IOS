import Foundation
import SwiftData

@Model
class MyGardenVegetableModel {
    var vegetableModel: VegetableModel
    var plantOption: PlantOption
    var datePlanted: Date = Date()
    
    @Relationship(deleteRule: .cascade)
    var notes: [NoteModel]?
    
    init(vegetableModel: VegetableModel, plantOption: PlantOption) {
        self.vegetableModel = vegetableModel
        self.plantOption = plantOption
    }
    
    var daysToHarvest: Int{
        plantOption == .seed ? vegetableModel.daysToHarvestSeeds : vegetableModel.daysToHarvestSeedlings
        
    }
}
