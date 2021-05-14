//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Jared  Long on 5/13/21.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
//    defining angle and passing into the preview where it will be defined for the BadgeSymbol
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
