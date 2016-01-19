//
// Created by Nic Wise on 19/01/16.
//

import Foundation
import RealmSwift

class RealmSample {

    //https://realm.io/docs/swift/latest

    let defaultRealm : Realm
    init() {
        defaultRealm = try! Realm()
    }

    func test() -> Void {
        let jim = Person()
        jim.name = "Jim"
        let rex = Dog()
        rex.name = "Rex"
        rex.owner = jim

        do {
            try defaultRealm.write {
                defaultRealm.add([jim, rex])
            }
        } catch _ {
            print("error writing to the realm")
        }

        let dogs = defaultRealm.objects(Dog)

        for dog in dogs {
            print("name: \(dog.name) owner: \(dog.owner!.name)")
        }

        do {
            try defaultRealm.write {
                defaultRealm.delete(dogs)
            }
        } catch _ {
            print("error writing to the realm")
        }
    }
}

class Dog: Object {
    dynamic var name = ""
    dynamic var owner: Person? // Properties can be optional
}

// Person model
class Person: Object {
    dynamic var name = ""
    dynamic var birthdate = NSDate(timeIntervalSince1970: 1)
    let dogs = List<Dog>()
}
