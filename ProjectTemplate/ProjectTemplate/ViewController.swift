//
//  ViewController.swift
//  ProjectTemplate
//
//  Created by Nic Wise on 17/01/16.
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        Settings.shared.username = "foo"

        print("username: \(Settings.shared.username!)")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

