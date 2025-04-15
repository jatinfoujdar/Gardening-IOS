import Foundation
import SwiftData

@Model
class MyGardenVegetableModel {
    var vegetableModel: VegetableModel
    var plantOption: PlantOption
    var datePlanted: Date = Date()
    
    init(vegetableModel: VegetableModel, plantOption: PlantOption) {
        self.vegetableModel = vegetableModel
        self.plantOption = plantOption
    }
}
