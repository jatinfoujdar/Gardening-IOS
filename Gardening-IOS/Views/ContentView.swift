import SwiftUI

struct ContentView: View {
    @State private var vegetables: [VegetableModel] = []

    var body: some View {
        
            List(vegetables) { vegetable in
                NavigationLink {
                    VegetableDetailView(vegetable: vegetable)
                } label: {
                    VegetableCellView(vegetable: vegetable)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Vegetables")
        
        .task {
            do {
                let client = VegetableHttpClient()
                vegetables = try await client.fetchVegetable()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    NavigationStack{
        ContentView()
            .preferredColorScheme(.dark)
    }
}
