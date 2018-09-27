//
//  CreateUserViewController.swift
//  VaultApp
//
//  Created by Isaac Meek on 14/04/2016.
//  Copyright © 2016 IsaacMeek. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController {
    
    @IBOutlet weak var EmailAddressTF: UITextField!

    @IBOutlet weak var PasswordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func CreateUserActn(sender: AnyObject)
    
    {
            let email = self.EmailAddressTF.text
            let password = self.PasswordTF.text
        
            if email != "" && password != ""
        {
            FIREBASE_REF.createUser(email, password: password, withValueCompletionBlock: {(error, authData) -> Void in
                
                if error == nil
                {
                    FIREBASE_REF.authUser(email, password: password, withCompletionBlock: {(error,authData) -> Void in
                        
                        if error == nil
                        {
                            NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey:"uid")
                            print("User Created")
                            self.dismissViewControllerAnimated(true, completion:nil)
                        }
                            else
                        {
                            print(error)
                        }
                    })
                }
                
                else
                
                {
                    print(error)
                }
                
            })
            
        }
        else
        {
            let alert = UIAlertController(title: "whoopsy", message: "Invalid entry please try again", preferredStyle: .Alert)
            
            let action = UIAlertAction(title: "Okay", style:.Default, handler: nil)
            
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
        
    
    @IBAction func CancelActn(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion:nil)
    }
                    
                    
                    
    
    
}
















