//
//  StackViewController.swift
//  StackAndQueue
//
//  Created by Chinwee Koh on 23/9/15.
//  Copyright © 2015 Koh Chin Wee. All rights reserved.
//

import UIKit

class StackViewController: UITableViewController {
    var stackArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        
        self.navigationItem.title = "Push N Pop"
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Push", style: .Plain, target: self, action: "push")
        self.navigationItem.leftBarButtonItem =  UIBarButtonItem(title: "Pop", style: .Plain, target: self, action: "pop")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stackArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StackCell", forIndexPath: indexPath)
        cell.textLabel!.text = String(format: "%d", stackArray[indexPath.row])
        return cell
    }
    
    // MARK: - Push & Pop
    
    func push() {
        let random = 0 + Int(arc4random_uniform(UInt32(100 - 0 + 1)))
        
        stackArray.append(random)
        tableView.reloadData()
    }
    
    func pop() {
        if stackArray.count == 0 {
            let alertController = UIAlertController(title: "Oops", message:"Nothing to pop! Make a push first!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        
        stackArray.removeLast()
        tableView.reloadData()
    }
}
