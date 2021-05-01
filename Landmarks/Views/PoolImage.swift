//
//  PoolImage.swift
//  Landmarks
//
//  Created by Jared  Long on 4/30/21.
//

import SwiftUI

struct PoolImage: View {
    var body: some View {
        Image("hamltonpool")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct PoolImage_Previews: PreviewProvider {
    static var previews: some View {
        PoolImage()
    }
}
