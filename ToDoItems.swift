//
//  ToDoItems.swift
//  ToDoList
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

let defaults = UserDefaults.standard

class ToDoItem {
    
    var detail:String
    var title: String
    var time: String
    var done: Bool
    
    public init (detail: String, title: String,time:String){
        self.detail = detail
        self.title = title
        self.time = time
        self.done = false
    }
    
}


