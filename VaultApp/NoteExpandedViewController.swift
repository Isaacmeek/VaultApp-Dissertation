//
//  NoteExpandedViewController.swift
//  VaultApp
//
//  Created by Isaac Meek on 16/04/2016.
//  Copyright © 2016 IsaacMeek. All rights reserved.
//

import UIKit
import Firebase
class NoteExpandedViewController: UIViewController {
    
    var note: Note!
    
    var ref = Firebase(url: "https://vaultapp-isaacmeek.firebaseio.com/")
    
    ///var titleRef = ref.childByAppendingPath("Title")
    
    
    @IBOutlet weak var titleNotetF: UITextField!
    
    @IBOutlet weak var contentTF: UITextView!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        titleNotetF.text = note.title
        contentTF.text = note.content
        
        }
        

    
    
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        note.title = titleNotetF.text!
        note.content = contentTF.text
        let titleRef = ref.childByAppendingPath("Title")
        let contentRef = ref.childByAppendingPath("Content")
        titleRef.updateChildValues(["Title":note.title])
        contentRef.updateChildValues(["Content":note.content])
        
        
    }



    
    
    
    
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

}
