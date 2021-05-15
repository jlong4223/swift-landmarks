//
//  PoolImage.swift
//  Landmarks
//
//  Created by Jared  Long on 4/30/21.
//

import SwiftUI

struct PoolImage: View {
    //creating a variable that is assigned to an Image
    var image: Image

    
    var body: some View {
//        whatever image is passed to the image var will recieve these styles
        image
            .frame(width: 250)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
//        TODO change image size bc hamilton pool img size messes up text
    }
}

struct PoolImage_Previews: PreviewProvider {
    static var previews: some View {
        PoolImage(image: Image("icybay"))
    }
}
