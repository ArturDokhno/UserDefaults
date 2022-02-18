//
//  ViewController.swift
//  UserDefaults
//
//  Created by Артур Дохно on 18.02.2022.
//

import UIKit

enum UserDefaultsKeys {
    static let userSettings = "userSettings"
}

class ViewController: UIViewController {
    
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = UserSettings(authorized: true)
        
        let settingsData = try? NSKeyedArchiver.archivedData(withRootObject: [settings, settings], requiringSecureCoding: false)
        
        userDefaults.set(settingsData, forKey: UserDefaultsKeys.userSettings)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let userSettingsData = userDefaults.object(forKey: UserDefaultsKeys.userSettings) as? Data,
           let userSettings = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userSettingsData) as? [UserSettings] {
            print("\(userSettings)")
        }
    }
    
}

