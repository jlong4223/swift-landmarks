//
//  ContentView.swift
//  Landmarks
//
//  Created by Jared  Long on 4/30/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured

//    creating two tabs
    enum Tab {
            case featured
            case list
        }
    
    var body: some View {
        TabView(selection: $selection) {
                   CategoryHome()
//                    creating a tab label - the label is connected to this view so when clicked it will render this one
                    .tabItem {
                        Label("Featured", systemImage: "star")
                    }
                    .tag(Tab.featured)

                   LandmarkList()
                    .tabItem {
                        Label("List", systemImage: "list.bullet")
                    }
                    .tag(Tab.list)
               }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        adds the environment object here so that it is available in all child views
        ContentView()
                    .environmentObject(ModelData())
    }
}
