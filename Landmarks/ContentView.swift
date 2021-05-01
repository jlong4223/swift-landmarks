//
//  ContentView.swift
//  Landmarks
//
//  Created by Jared  Long on 4/30/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//  using Vstack to vertically stack the text views
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
