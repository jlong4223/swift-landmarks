//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Jared  Long on 5/16/21.
//

import SwiftUI

struct CategoryHome: View {
//    bringing in the environmental Object and attaching it to the view
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView{
            List {
//                showing the featured image on the top
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
//                    makes the photo the the width of the phone (edge to edge)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
//            adds a profile icon to the toolbar
            .toolbar{
                Button(action: {showingProfile.toggle()}){
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }
//            this is what is presented when the button is toggled - the profileHost view
            .sheet(isPresented: $showingProfile){
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
