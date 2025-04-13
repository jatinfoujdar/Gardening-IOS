import Foundation

struct PreviewData {
    static func loadVegetable() -> [VegetableModel] {
        guard let url = Bundle.main.url(forResource: "vegetable", withExtension: "json") else {
            print("❌ Failed to find vegetable.json in bundle")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let vegetables = try JSONDecoder().decode([VegetableModel].self, from: data)
            return vegetables
        } catch {
            print("❌ Failed to decode vegetable.json: \(error)")
            return []
        }
    }
}
