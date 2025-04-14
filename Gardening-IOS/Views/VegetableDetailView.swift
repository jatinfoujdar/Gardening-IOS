
import SwiftUI

struct VegetableDetailView: View {
    let vegetable : VegetableModel
    var body: some View {
        ScrollView{
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
        }
    }
}

#Preview {
    VegetableDetailView(vegetable: PreviewData.loadVegetable()[0])
}
