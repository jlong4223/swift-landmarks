//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Jared  Long on 4/30/21.
//

import SwiftUI

//@main attr identifies the apps entry point - this is the "landing page"
@main
struct LandmarksApp: App {
//    when defining an environment object, need to start from the top and pass it down ; defined it as state and passes it down as an environmentObject to be used elsewhere
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
