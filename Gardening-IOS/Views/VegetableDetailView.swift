import Foundation
import SwiftUI
import SwiftData

struct VegetableDetailView: View {
    let vegetable : VegetableModel
    
    @Environment(\.modelContext) private var context
    
    @State private var showSeedOrSeedlingMenu = false
    private func saveVegetableToGarden(with plantOption: PlantOption){
        let myGardenVegetable = MyGardenVegetableModel(vegetableModel: vegetable, plantOption: plantOption)
        context.insert(myGardenVegetable)
    
        
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16){
                AsyncImage(url: vegetable.thumbnailImage){image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(16)
                        .shadow(radius: 10)
                }placeholder:{
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 200)
                        .overlay(
                            ProgressView()
                                .scaleEffect(1.5)
                                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                        )
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .padding(.bottom,8)
                
            
                
                Text(vegetable.body)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineSpacing(4)
                    .padding(.bottom,8)
                
                Divider()
                
                Text("Quick Facts")
                    .font(.title2)
                    .fontWeight(.bold)
                DetailRow(icon: "leaf", title: "Seed Depth", value: vegetable.seedDepth)
                DetailRow(icon: "thermometer", title: "Germination Temp", value: vegetable.germinationSoilTemp)
                DetailRow(icon: "calendar", title: "Days to Germination", value: "\(vegetable.daysToGermination) days")
                DetailRow(icon: "sun.max", title: "Light Requirement", value: vegetable.light)
                DetailRow(icon: "drop", title: "Watering", value: vegetable.watering)
                DetailRow(icon: "leaf.arrow.triangle.circlepath", title: "Companions", value: vegetable.goodCompanions)
                DetailRow(icon: "exclamationmark.triangle", title: "Bad Companions", value: vegetable.badCompanions)
                DetailRow(icon: "heart.fill", title: "Health Benefits", value: vegetable.healthBenefits.isEmpty ? "N/A" : vegetable.healthBenefits)
                
                Divider()
                
                SectionHeader(title: "Growing Tips")
                Text(vegetable.growingDescription)
                    .font(.body)
                    .foregroundStyle(.secondary)
                
                SectionHeader(title: "Harvesting Tips")
                Text(vegetable.harvestDescription)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing){
                Button{
                    showSeedOrSeedlingMenu = true
                }label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundStyle(.green)
                }
            }
        })
        .sheet(isPresented: $showSeedOrSeedlingMenu, content: {
            SeedOrSeedlingView(onSelected: {option in
                saveVegetableToGarden(with: option)
            })
            .presentationDetents([.fraction(0.25)])
            .background(Color(.systemGray6))
        })
        
        .navigationTitle(vegetable.name)
    }
}

struct DetailRow: View {
    
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: icon)
                .foregroundStyle(.green)
                .frame(width: 24, height: 24)
            VStack(alignment: .leading){
                Text(title)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(value)
                    .font(.body)
                    .foregroundStyle(.primary)
            }
        }
        .padding(.vertical,4)
    }
}

struct SectionHeader: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(.primary)
            .padding(.top)
    }
}

#Preview {
    NavigationStack{
        VegetableDetailView(vegetable: PreviewData.loadVegetable()[0])
    }
    .modelContainer(PreviewContainer)
}
