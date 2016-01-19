//
// Created by Nic Wise on 19/01/16.
//

import Foundation
import RxSwift

class RxSwiftSample {
    init() {

    }

    func test() -> Void {
        var obs : Observable<String> = Observable.create { observer in
            observer.on(.Next("Hello World"))
            observer.on(.Completed)
            return NopDisposable.instance
        }

        var sub = obs.subscribeNext { input in
            print ("subbed to... \(input)")
        }





    }
}
