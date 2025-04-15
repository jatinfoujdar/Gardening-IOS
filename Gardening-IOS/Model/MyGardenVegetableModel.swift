import Foundation
import SwiftData

@Model
class MyGardenVegetableModel{
    var vegetablemodel: VegetableModel
    var planOption: PlantOption
    var datePlanted: Date = Date()
    
    
    init(vegetablemodel: VegetableModel, planOption: PlantOption) {
        self.vegetablemodel = vegetablemodel
        self.planOption = planOption
    }
}


