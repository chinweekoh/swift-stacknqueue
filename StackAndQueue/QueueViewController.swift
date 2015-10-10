//
//  QueueViewController.swift
//  StackAndQueue
//
//  Created by Chinwee Koh on 10/10/15.
//  Copyright © 2015 Koh Chin Wee. All rights reserved.
//

import UIKit

class QueueViewController: UITableViewController {
    var queueArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0)
        
        self.navigationItem.title = "Enqueue N Dequeue"
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Enqueue", style: .Plain, target: self, action: "enqueue")
        self.navigationItem.leftBarButtonItem =  UIBarButtonItem(title: "Dequeue", style: .Plain, target: self, action: "dequeue")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return queueArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("QueueCell", forIndexPath: indexPath)
        cell.textLabel!.text = String(format: "%d", queueArray[indexPath.row])
        return cell
    }

    // MARK: - Enqueue & Dequeue
    
    func enqueue() {
        let random = 0 + Int(arc4random_uniform(UInt32(100 - 0 + 1)))
        
        queueArray.append(random)
        tableView.reloadData()
    }
    
    func dequeue() {
        if queueArray.count == 0 {
            let alertController = UIAlertController(title: "Oops", message:"Nothing to dequeue! Make a queue first!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        
        queueArray.removeFirst()
        tableView.reloadData()
    }
}
