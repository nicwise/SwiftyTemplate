//
// Created by Nic Wise on 19/01/16.
//

import Foundation
import Valet

struct Settings {

    let valet : VALValet

    internal init() {
        if (VALSynchronizableValet.supportsSynchronizableKeychainItems()) {
            valet = VALSynchronizableValet(identifier: "com.yourProject", accessibility: .AfterFirstUnlock)!
        } else {
            valet = VALValet(identifier: "com.yourProject", accessibility: .AfterFirstUnlock)!
        }
    }

    static var shared = Settings()

    var username : String? {
        get {
            return valet.stringForKey("username")
        }
        
        set(value) {
            guard let value = value else {
                return
            }
            valet.setString(value, forKey: "username")
        }
    }
}
