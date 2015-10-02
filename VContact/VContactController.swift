//
//  VContactController.swift
//  Example Contact
//
//  Created by Vu Dao on 9/30/15.
//  Copyright © 2015 Vu Dao. All rights reserved.
//

import UIKit
import AddressBook

public class VContactController: NSObject {
    private let addressBookRef: ABAddressBook?
    override init() {
        self.addressBookRef = ABAddressBookCreateWithOptions(nil, nil).takeRetainedValue()
    }
    
    /*
    params : result (Bool)
    if result = true : you can get data of contact
    else result = false : do not everything
    */
    public func askForPermission (handleResult : (result: Bool!) ->()) {
        let authorizationStatus = ABAddressBookGetAuthorizationStatus()
        
        switch authorizationStatus {
        case .Denied, .Restricted:
            //Denied
            handleResult(result: false)
        case .Authorized:
            //Authorized
            handleResult(result: true)
        case .NotDetermined:
            //Not Determined
            ABAddressBookRequestAccessWithCompletion(self.addressBookRef!, { (granted, error) -> Void in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if !granted {
                        //just denied
                        handleResult(result: false)
                    } else {
                        //just authorized
                        handleResult(result: true)
                    }
                })
            })
        }
    }
    
    
}
