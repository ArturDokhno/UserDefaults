//
//  ViewController.swift
//  UserDefaults
//
//  Created by Артур Дохно on 18.02.2022.
//

import UIKit

enum UserDefaultsKeys {
    static let keyForBool = "boolKey"
}

class ViewController: UIViewController {
    
    var userDefaults = UserDefaults.standard
    let keyForBool = "someBool"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var someBool = true
        
        userDefaults.set(someBool, forKey: UserDefaultsKeys.keyForBool)
        userDefaults.synchronize()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let bool = userDefaults.bool(forKey: UserDefaultsKeys.keyForBool)
        print("\(bool)")
    }

}

