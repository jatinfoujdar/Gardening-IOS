import SwiftUI

struct ContentView: View {
    @State private var vegetables: [VegetableModel] = []

    
    var body: some View {
        List(vegetables){ vegetable in
            VegetableCellView(vegetable: vegetable)
        }
        .listStyle(.plain)
        .task {
            do{
                let client = VegetableHttpClient()
                vegetables = try await client.fetchVegetable()
            }catch{
                print("error")
            }
        }.navigationTitle("Vegetables")
       
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
