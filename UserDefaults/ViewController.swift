//
//  ViewController.swift
//  UserDefaults
//
//  Created by Артур Дохно on 18.02.2022.
//

import UIKit

enum UserDefaultsKeys {
    static let userSettings = "userSettings"
    static let userSettingsStruct = "userSettingsStruct"
}

class ViewController: UIViewController {
    
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = UserSettings(authorized: true)
        
        let settingsData = try? NSKeyedArchiver.archivedData(withRootObject: [settings, settings], requiringSecureCoding: false)
        
        userDefaults.set(settingsData, forKey: UserDefaultsKeys.userSettings)
        
        let encoder = JSONEncoder()
        let settingsStruct = UserSettingsStruct(isAuthorized: true)
        let jsonData = try! encoder.encode(settingsStruct)
        userDefaults.set(jsonData, forKey: UserDefaultsKeys.userSettingsStruct)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let userSettingsData = userDefaults.object(forKey: UserDefaultsKeys.userSettings) as? Data,
           let userSettings = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userSettingsData) as? [UserSettings] {
            print("Settings: \(userSettings)")
        }
        
        if let userSettingsData = userDefaults.object(forKey: UserDefaultsKeys.userSettingsStruct) as? Data {
            
            let decoder = JSONDecoder()
            
            guard let model = try? decoder.decode(UserSettingsStruct.self, from: userSettingsData) else { return }
            
            print("SettingsStruct: \(model)")
        }
        
    }
    
}

