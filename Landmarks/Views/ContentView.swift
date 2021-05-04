//
//  ContentView.swift
//  Landmarks
//
//  Created by Jared  Long on 4/30/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        adds the environment object here so that it is available in all child views
        ContentView()
                    .environmentObject(ModelData())
    }
}
