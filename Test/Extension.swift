//
//  Extension.swift
//  Test
//
//  Created by Donald Nguyen on 9/22/16.
//  Copyright © 2016 Donald Nguyen. All rights reserved.
//

import Foundation

extension UserDefaults {
    func isFirstLaunched() -> Bool {
        
        if !(UserDefaults.standard.bool(forKey: "firstLaunched3")) {
            UserDefaults.standard.set(true, forKey: "firstLaunched3")
            UserDefaults.standard.synchronize()
            print("first Launched")
            return true
        } else {
            print("not first launched")
            return false
        }
    }
}
