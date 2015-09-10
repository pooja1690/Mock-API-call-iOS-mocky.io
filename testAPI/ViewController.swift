//
//  controller.swift
//  testAPI
//
//  Created by pooja shyam on 7/31/15.
//  Copyright (c) 2015 pooja shyam. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var profileTable: UITableView?

    var profileList: [String] = ["NAME", "DATE OF BIRTH","PHONE NUMBER","EMAIL", "ADDRESS"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.reloadInputViews()
        profileTable?.rowHeight = 70;
        
    }
    
    func countNumberOfRows() -> NSNumber{
        return 8
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profileList.count;
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
     {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProfileViewCell", forIndexPath:indexPath) as! ProfileViewCell
        cell.HeadingLabel.text = self.profileList[indexPath.row];
        cell.DescriptionLabel.text = profileService().startConnection(profileList[indexPath.row])
        return cell
    }
    
    
}