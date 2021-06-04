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
    @State private var currentPage = 0
    
    var body: some View {
//        using $ creates a binding to a value that is stored as state
        VStack {
            PageViewController(pages: pages, currentPage: $currentPage)
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                            .frame(width: CGFloat(pages.count * 18))
                            .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
//        passing the the array of views
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
