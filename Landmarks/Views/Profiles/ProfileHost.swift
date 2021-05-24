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
                if editMode?.wrappedValue == .active{
//                    adding a cancel button to disregard all changes made
                    Button("Cancel"){
                        draftProfile = modellData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                            ProfilesSummary(profile: modellData.profile)
                        } else {
//                            passing the draftProfile to the editor and showing view when edit clicked
                            ProfileEditor(profile: $draftProfile)
//                                appear and disapeear allows the view to udpdate in real time
                                .onAppear {
                                    draftProfile = modellData.profile
                            }
                                .onDisappear {
                                    modellData.profile = draftProfile
                            }
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
