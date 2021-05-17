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
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    Text(key)
                }
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
