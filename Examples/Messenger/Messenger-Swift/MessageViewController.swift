//
//  MessageViewController.swift
//  Messenger-Swift
//
//  Created by Ignacio Romero Zurbuchen on 10/16/14.
//  Copyright (c) 2014 Slack Technologies, Inc. All rights reserved.
//

class MessageViewController: SLKTextViewController {

    override class func tableViewStyleForCoder(decoder: NSCoder) -> UITableViewStyle {
        return UITableViewStyle.Plain;
    }
    
    override func viewDidLoad() {
        
        // In progress in branch 'swift-example'
        super.viewDidLoad()
//        textView.placeholderColor = UIColor .redColor()
//        textView.font = UIFont.systemFontOfSize(11)
        textView.placeholder = "匿名评论:"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}