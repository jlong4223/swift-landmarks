//
//  Badge.swift
//  Landmarks
//
//  Created by Jared  Long on 5/14/21.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View{
//        brought in the symbol and defines angle
        RotatedBadgeSymbol(angle: Angle(degrees: 0))
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
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
