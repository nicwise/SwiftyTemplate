//
// Created by Nic Wise on 19/01/16.
//

import Foundation

class ValetSample {

    init() {

    }

    func test() -> Void {
        Settings.shared.username = "[the username]"

        if let username = Settings.shared.username {
            print("username: \(username)")
        }
    }
}
