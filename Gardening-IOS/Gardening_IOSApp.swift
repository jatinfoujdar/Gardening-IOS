//
//  Gardening_IOSApp.swift
//  Gardening-IOS
//
//  Created by jatin foujdar on 13/04/25.
//

import SwiftUI

@main
struct Gardening_IOSApp: App {
    var body: some Scene {
        WindowGroup {
            VegetableTabBarView()
                .modelContainer(for: [VegetableModel.self, MyGardenVegetableModel.self])
                .preferredColorScheme(.dark)
        }
    }
}
