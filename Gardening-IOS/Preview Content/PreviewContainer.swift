import Foundation
import SwiftData

let PreviewContainer: ModelContainer = {
   
    let container = try! ModelContainer(for: VegetableModel.self,MyGardenVegetableModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return container
}()
