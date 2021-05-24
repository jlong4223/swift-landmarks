//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Jared  Long on 5/21/21.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modellData: ModelData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                            ProfilesSummary(profile: modellData.profile)
                        } else {
                            Text("Profile Editor")
                        }
                    }
                    .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
