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
            Text("Hamilton Pool Preserve")
                .font(.title)
                .fontWeight(.bold)
            HStack {
                Text("Travis County Parks")
                    .font(.subheadline)
                Spacer()
                Text("Austin, TX")
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
