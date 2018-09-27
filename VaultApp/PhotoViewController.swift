//
//  PhotoViewController.swift
//  VaultApp
//
//  Created by Isaac Meek on 17/04/2016.
//  Copyright © 2016 IsaacMeek. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    @IBOutlet weak var Image: UIImageView!
    var images :[String] = []
    
    
    //image 1 code
    
    @IBAction func PhotoLibrary(sender: AnyObject) {
        
         let photoPicker = UIImagePickerController()
         photoPicker.delegate = self
         photoPicker.sourceType = .PhotoLibrary
         self.presentViewController(photoPicker, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        Image.image = image
        dismissViewControllerAnimated(true, completion: nil)
    
   
    }
    
    @IBAction func TakePhoto(sender: AnyObject) {
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .Camera
        
        presentViewController(photoPicker, animated: true, completion:nil)
        
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        
        
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

    
    
  
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

