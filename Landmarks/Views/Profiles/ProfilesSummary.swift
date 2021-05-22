//
//  ProfilesSummary.swift
//  Landmarks
//
//  Created by Jared  Long on 5/21/21.
//

import SwiftUI

struct ProfilesSummary: View {
//    takes a Profile value here rather than a binding to the profile bc the parent view, ProfileHost, manages the state for this view.
    var profile: Profile
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            }
        }
    }
}

struct ProfilesSummary_Previews: PreviewProvider {
    static var previews: some View {
//        this view will use the default user defined in the model but when used within another view, a user param must be assigned to change user
        ProfilesSummary(profile: Profile.default)
    }
}
