//
//  RealmObjectTableView.swift
//  Barback
//
//  Created by Justin Duke on 8/6/15.
//  Copyright © 2015 Justin Duke. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmObjectTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var selectionAction: ((NSIndexPath) -> Void)?
    
    func initialize() {
        dataSource = self
        delegate = self
        
        self.setNeedsDisplay()
        self.reloadData()
        
        if (self.tableView(self, numberOfRowsInSection: 0) == 0) {
            self.removeFromSuperview()
        }

        separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    func textForHeaderInSection() -> String {
        return ""
    }
    
    public func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = DescriptionLabel(frame: CGRect(x: 0, y: 0, width: 320, height: 60))
        label.text = textForHeaderInSection()
        label.styleLabel()
        return label
    }
    
    public func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
  
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
  
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectionAction?(indexPath)
        deselectRowAtIndexPath(indexPath, animated: true)
    }
}