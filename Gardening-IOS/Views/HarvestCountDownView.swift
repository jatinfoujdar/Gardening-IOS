//
//  HarvestCountDownView.swift
//  Gardening-IOS
//
//  Created by jatin foujdar on 16/04/25.
//

import SwiftUI

struct HarvestCountDownView: View {
    let plantingData : Date
    let harvestingDays: Int
    
    private var daysElapsed: Int{
        let calender = Calendar.current
        let components = calender.dateComponents([.day], from: plantingData, to: Date())
        return max(components.day ?? 0,0)
    }
    
    private var daysRemaining: Int{
        max(harvestingDays - daysElapsed, 0)
    }
    
    private var progress: CGFloat{
        CGFloat(daysElapsed) / CGFloat(harvestingDays)
    }
    var body: some View {
        ZStack{
            Circle()
                .stroke(
                    Color.green.opacity(0.2),
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
            
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.5), value: progress)
            
            
            VStack(spacing: 2){
                Text("\(daysRemaining)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.green)
                Text("Days")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }.frame(width: 60, height: 60)
            .padding()
    }
}

#Preview {
    HarvestCountDownView(plantingData: Date().daysAgo(30), harvestingDays: 90)
}
