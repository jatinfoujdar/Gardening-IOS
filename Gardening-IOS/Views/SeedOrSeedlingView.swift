import SwiftUI

enum PlantOption: String, Codable {
    case seed
    case seedling

    var title: String {
        switch self {
        case .seed:
            return "Seed"
        case .seedling:
            return "Seedling"
        }
    }

    var icon: String {
        switch self {
        case .seed:
            return "leaf.fill"
        case .seedling:
            return "leaf.arrow.circlepath"
        }
    }
}


struct SeedOrSeedlingView: View {
    let onSelected : (PlantOption) -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Text("Choose an Option")
                .font(.headline)
            HStack(spacing: 24){
                OptionView(option: .seed, action: { option in
                    onSelected(option)
                    dismiss()
                })
                OptionView(option: .seedling, action: { option in
                    onSelected(option)
                    dismiss()
                })
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
        .padding()
    }
}


struct OptionView: View {
    let option: PlantOption
    let action: (PlantOption) -> Void

    var body: some View {
        Button(action: {
            action(option)
        }) {
            VStack(spacing: 8) {
                Image(systemName: option.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.green)
                Text(option.title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
        }
        .buttonStyle(.plain)
    }
}


#Preview {
    SeedOrSeedlingView(onSelected: {_ in})
}
