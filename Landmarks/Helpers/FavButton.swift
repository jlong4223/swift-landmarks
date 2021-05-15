//
//  FavButton.swift
//  Landmarks
//
//  Created by Jared  Long on 5/6/21.
//

import SwiftUI

struct FavButton: View {
//    binding indicates current state and provides a constant value
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
                    isSet.toggle()
                }) {
                    Image(systemName: isSet ? "star.fill" : "star")
                        .foregroundColor(isSet ? Color.yellow : Color.gray)
                }
    }
}

struct FavButton_Previews: PreviewProvider {
    static var previews: some View {
        FavButton(isSet: .constant(true))
    }
}
