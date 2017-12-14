//
//  CustomizeUITableViewCell.swift
//  ToDoList
//
//  Created by Apple on 2017/11/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class CustomizeUITableViewCell: UITableViewCell {
    
    var titleinRow:UILabel!
    var dateinRow:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.titleinRow = UILabel(frame:CGRect(x:20,y:0,width:120,height:40))
        
        let now = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        
        self.dateinRow = UILabel(frame:CGRect(x:160,y:0,width:240,height:40))
        self.dateinRow.text =  dateformatter.string(from: now)
        self.dateinRow.textColor = UIColor.gray
        
        self.addSubview(self.titleinRow)
        self.addSubview(self.dateinRow)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(code:)has not brrn implomented");
    }
}
