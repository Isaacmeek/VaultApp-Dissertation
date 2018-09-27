//
//  BottomService.swift
//  VaultApp
//
//  Created by Isaac Meek on 14/04/2016.
//  Copyright © 2016 IsaacMeek. All rights reserved.
//

import Foundation
import Firebase

let Base_URL = "vaultapp-isaacmeek.firebaseIO.com"

//create reference to firebase datbase

let FIREBASE_REF = Firebase(url: Base_URL)

//create reference to current user (users logged into the application) saving unque indentifier in ns defaults

var CURRENT_USER: Firebase
{
    let UserID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
    
    let currentUser = Firebase(url: "\(FIREBASE_REF)").childByAppendingPath(UserID)
    return currentUser!
    //gets user from fire database then returns it
}
