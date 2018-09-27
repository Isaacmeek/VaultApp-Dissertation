//
//  LoginPageViewController.swift
//  VaultApp
//
//  Created by Isaac Meek on 14/04/2016.
//  Copyright © 2016 IsaacMeek. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginPageViewController: UIViewController {


    @IBOutlet weak var EmailTF: UITextField!
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    @IBOutlet weak var LogoutBtn: UIButton!
    
    override func viewDidLoad() {
   
        TouchID()
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    //see if user is logged into application
    override func viewDidAppear(animated: Bool) {
        
            super.viewDidAppear(animated)
    //checks with firebase data base and nsuserdefaults if dey is a user
        
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil && CURRENT_USER.authData != nil
        
        {
            self.LogoutBtn.hidden = false   // show logout button
        }
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
    @IBAction func LoginActn(sender: AnyObject)
        {
            //create variables from text fields
            
            let email = self.EmailTF.text
            let password = self.PasswordTF.text
            
            if email != "" && password != ""  //check if email and password is entered
            {
                FIREBASE_REF.authUser(email,password: password, withCompletionBlock: { ( error, authData) -> Void in
                    
                    if error == nil
                    {
                       NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                        print("Logged in")
                        self.LogoutBtn.hidden = false
                        self.performSegueWithIdentifier("HomeSeg", sender: nil)
                        
                        
                        
                        
                        
                    }
                    else
                    {
                        print(error)
                    }
            })
        }
            else  // if one the the fields is blank alert user
            {
                let alert = UIAlertController(title: "Oops", message: "Invalid Username or Password please try again", preferredStyle: .Alert)
                let action = UIAlertAction(title: "Okay", style: .Default, handler: nil)
                alert.addAction(action)
                self.presentViewController(alert, animated: true, completion: nil)
            }
    
    }
    
    

    @IBAction func LogoutActn(sender: AnyObject) {
        
        CURRENT_USER.unauth()
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: "uid")
        self.LogoutBtn.hidden = true
    }
    



    func TouchID() {
        
        let authContext: LAContext = LAContext()
        var error : NSError?
        
        if authContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error){
            
            authContext.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate to Continue ", reply: {
                (Authenticated: Bool, error: NSError?) in
                
                if Authenticated{
                    
                    NSLog("User Authenticated")
                }
                else{
                    NSLog ("Unsucceful Authentication ")
                    exit(0);
                }
            })
        }
        
 
 
    }


   

    @IBAction func resetPass(sender: AnyObject) {
    
    
    let email = EmailTF.text
    
        if email != "" {
            
            FIREBASE_REF.resetPasswordForUser(email, withCompletionBlock: {error -> Void in
                
                if error == nil{
                    print("password sent")
                    let Resetalert = UIAlertController(title: "Password Reset", message: "A new password has been emailed to you", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "Okay", style: .Default, handler: nil)
                    Resetalert.addAction(action)
                    self.presentViewController(Resetalert, animated: true, completion: nil)
                    
                }else
                {//display eroor
                    let Erroralert = UIAlertController(title: "Invalid Address", message: "Invalid Email Address please try again", preferredStyle: .Alert)
                    let action = UIAlertAction(title: "Okay", style: .Default, handler: nil)
                    Erroralert.addAction(action)
                    self.presentViewController(Erroralert, animated: true, completion: nil)
                
                    print(error)
                    
                    
                }
        })
            //invalid input
        }else{
            let EnterAddressalert = UIAlertController(title: "whoops", message: "Please Enter Email Address in the placeholder above", preferredStyle: .Alert)
            let action = UIAlertAction(title: "Okay", style: .Default, handler: nil)
            EnterAddressalert.addAction(action)
            self.presentViewController(EnterAddressalert, animated: true, completion: nil)
        }
        
    
    
    
    }


}
















