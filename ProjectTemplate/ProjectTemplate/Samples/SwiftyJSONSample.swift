//
// Created by Nic Wise on 19/01/16.
//

import Foundation
import SwiftyJSON

class SwiftyJSONSample {
    init() {

    }

    func test() -> Void {
        var jsonString = " { \"user\": \"bobsmith\" } "

        var json = JSON.parse(jsonString)

        if let user = json["user"].string {
            print("json username: \(user)")
        }


        var usersAndDogs = "{\"user\": \"dogman\", \"dogs\": [{\"name\": \"buster\", \"breed\": \"cairn terrior\"},{\"name\": \"shep\", \"breed\": \"border collie\"}]}"
        var user = User.unpack(JSON.parse(usersAndDogs))

        print("username: \(user.username!)")
        for dog in user.dogs {
            print("\tdog name: \(dog.name!) - \(dog.breed!)")
        }



    }
}

protocol Deserialise {
    typealias T
    static func unpack(json: JSON) -> T
}

class User {
    var username : String?
    var dogs : [Doge]

    init() {
        dogs = [Doge]()
    }


}

extension User : Deserialise<User> {
    static func unpack(json: JSON) -> User {

        var user = User()
        var doglist = [Doge]()

        if let un = json["user"].string {
            user.username = un
        }

        if let dogs = json["dogs"].array {
            for dog in dogs {
                doglist.append(Doge.unpack(dog))
            }

            user.dogs = doglist
        }

        return user
    }
}

class Doge {
    var name : String?
    var breed : String?
    init() {

    }

}

extension Doge : Deserialise {
    class func unpack(json: JSON) -> Doge {
        var dog = Doge()
        if let name = json["name"].string {
            dog.name = name
        }

        if let breed = json["breed"].string {
            dog.breed = breed
        }

        return dog
    }

}
