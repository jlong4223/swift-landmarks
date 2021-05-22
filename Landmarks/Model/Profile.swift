//
//  Profile.swift
//  Landmarks
//
//  Created by Jared  Long on 5/21/21.
//

import Foundation

struct Profile {
        var username: String
        var prefersNotifications = true
        var seasonalPhoto = Season.winter
        var goalDate = Date()
    
    static let `default` = Profile(username: "j_long")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String {self.rawValue}
    }
}
