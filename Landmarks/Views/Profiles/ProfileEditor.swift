//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Jared  Long on 5/23/21.
//

import SwiftUI

struct ProfileEditor: View {
//     including a binding to the draft/default profile of the user profile
    @Binding var profile: Profile
    
//    creating a date Range for a date picker and assigning year values
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List{
            HStack{
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
//            toggle that corresponds with the user’s preference for receiving notifications about landmark-related events
            Toggle(isOn: $profile.prefersNotifications){
                Text("Enable Notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20){
                Text("Seasonal Photo").bold()
                
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto){
                    ForEach(Profile.Season.allCases){season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
//            rendering a datePicker using the dateRange var dates defined 
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                    Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
