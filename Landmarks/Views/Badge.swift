//
//  Badge.swift
//  Landmarks
//
//  Created by Jared  Long on 5/14/21.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View{
        RotatedBadgeSymbol(angle: Angle(degrees: 0))
            .opacity(0.5)
    }
    
    var body: some View {
        ZStack{
            BadgeBackground()
            
            badgeSymbols
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
