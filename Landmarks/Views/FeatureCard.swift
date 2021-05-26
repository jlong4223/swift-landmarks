//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Jared  Long on 5/25/21.
//

//file for displaying the landmarks feature image

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
//            attaching the custom struct here
            .overlay(TextOverlay(landmarkText: landmark))
    }
}

//this struct is for the overlay text
struct TextOverlay: View {
    var landmarkText: Landmark

//    gradient styles
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

//    the view is using gradient styles above and a ZStack
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(landmarkText.name)
                    .font(.title)
                    .bold()
                Text(landmarkText.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}


struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[1])
    }
}
