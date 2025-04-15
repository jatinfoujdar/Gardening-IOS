import Foundation
import SwiftData

let PreviewContainer: ModelContainer = {
   
    let container = try! ModelContainer(for: VegetableModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return container
}()
