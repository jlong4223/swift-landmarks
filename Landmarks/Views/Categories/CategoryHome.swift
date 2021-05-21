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
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
