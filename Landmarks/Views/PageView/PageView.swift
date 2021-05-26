//
//  PageView.swift
//  Landmarks
//
//  Created by Jared  Long on 5/25/21.
//

import SwiftUI

//this is a custom view that brings in the pageViewController view as the child view
struct PageView<Page: View>: View  {
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
//        passing the the array of views
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
