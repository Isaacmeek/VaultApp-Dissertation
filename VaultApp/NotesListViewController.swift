//
//  NotesListViewController.swift
//  VaultApp
//
//  Created by Isaac Meek on 16/04/2016.
//  Copyright © 2016 IsaacMeek. All rights reserved.
//

import UIKit
import Firebase


class NotesListViewController: UITableViewController {

var Titleref = Firebase(url: "https://vaultapp-isaacmeek.firebaseio.com/Title")
var ContentRef = Firebase(url: "https://vaultapp-isaacmeek.firebaseio.com/Content")
    
var notes: [Note] = []

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let SavedNotes = Note()
        
        Titleref.observeEventType(.ChildAdded, withBlock: { (snap: FDataSnapshot!) in
            SavedNotes.title = snap.value as! String
            
            
            
           
        })
        
        ContentRef.observeEventType(.ChildAdded, withBlock: { (snap: FDataSnapshot!) in
            
            
            SavedNotes.content = snap.value as! String
            
            
            
        })
        
       notes.appendContentsOf([SavedNotes])
        
      
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return notes.count
    }
    
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NotesCell", forIndexPath: indexPath) as UITableViewCell
        

        cell.textLabel!.text = notes[indexPath.row].title

        // Configure the cell...

        return cell
        
        }

        
        

    
        

    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "displayNote" {
            let noteExpandedVC = segue.destinationViewController as! NoteExpandedViewController
        
            let indexPath = tableView.indexPathForSelectedRow
        
            noteExpandedVC.note = notes[indexPath!.row]
            
           
        }
    
    
            
            
            
    
    
        
    else if segue.identifier == "createNote"{
            
            let note = Note()
            
            notes.append(note)
            let noteExpandedVC = segue.destinationViewController as! NoteExpandedViewController
            noteExpandedVC.note = note
           
            
        }}
    

//reload table view
    override func viewDidAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    

      
    }
  


