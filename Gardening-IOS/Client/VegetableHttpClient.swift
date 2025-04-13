import Foundation



struct VegetableHttpClient {
    func fetchVegetable() async throws -> [VegetableModel] {
        let url = URL(string: "https://azamsharp.com/vegetables.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([VegetableModel].self, from: data)
    }
}
