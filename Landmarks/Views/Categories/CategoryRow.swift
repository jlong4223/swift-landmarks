//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Jared  Long on 5/17/21.
//

import SwiftUI

struct CategoryRow: View {
//    defining the categoryName and array and using it within the preview
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0){
//                only looping through first 3 which comes from the prefix defined below
                    ForEach(items){landmark in
                        CategoryItem(landmark: landmark)
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarksArray
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
//            when looping over items in the array, this limits it to first 4
            items: Array(landmarks.prefix(4))
        )
    }
}
