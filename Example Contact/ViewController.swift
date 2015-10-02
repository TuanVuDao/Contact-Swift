//
//  ViewController.swift
//  Example Contact
//
//  Created by Vu Dao on 9/30/15.
//  Copyright © 2015 Vu Dao. All rights reserved.
//

import UIKit
import VContact

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let vContact = VContactController()
        vContact.bar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

