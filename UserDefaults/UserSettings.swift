//
//  UserSettings.swift
//  UserDefaults
//
//  Created by Артур Дохно on 18.02.2022.
//

import Foundation



class UserSettings: NSObject, NSCoding {
    
    var isAuthorized: Bool = false
    
    fileprivate enum UserSettings {
        static let isAuthoized = "isAuthoized"
    }
    
    init(authorized: Bool) {
        isAuthorized = authorized
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(isAuthorized, forKey: UserSettings.isAuthoized)
    }
    
    required init?(coder: NSCoder) {
        isAuthorized = coder.decodeBool(forKey: UserSettings.isAuthoized)
    }
    
}
