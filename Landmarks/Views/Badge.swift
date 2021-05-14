//
//  Badge.swift
//  Landmarks
//
//  Created by Jared  Long on 5/14/21.
//

import SwiftUI

struct Badge: View {
    static let rotationCount = 8
//    brings in symbol and creates more symboles based on rotationCount and dynamically changes the angle of each
    var badgeSymbols: some View {
           ForEach(0..<Badge.rotationCount) { i in
               RotatedBadgeSymbol(
                   angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0
               )
           }
           .opacity(0.5)
       }
    
    var body: some View {
        ZStack{
            BadgeBackground()
            
//            need GeometryReader to use geometry to scale
            GeometryReader{ geometry in
            badgeSymbols
                .scaleEffect(1.0 / 4.0, anchor: .top)
                .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
//        uses scaledToFit to move it within the background
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
