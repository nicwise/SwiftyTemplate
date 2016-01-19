//
//  ViewController.swift
//  ProjectTemplate
//
//  Created by Nic Wise on 17/01/16.
//
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let valet = ValetSample()
        valet.test()


        let realm = RealmSample()
        realm.test()

        let rxSwift = RxSwiftSample()
        rxSwift.test()

        let swiftyJson = SwiftyJSONSample()
        swiftyJson.test()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



