//
//  secondViewController.swift
//  MyToDo
//
//  Created by Apple on 2017/11/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
   
    var detailField:UITextField = UITextField()
    let defaults = UserDefaults.standard
    var num = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = defaults.value(forKey: "title")
        
        self.navigationController?.isNavigationBarHidden = false
        let screenRect = UIScreen.main.bounds
        let labelRect = CGRect(x:0,y:80,width:screenRect.size.width,height:screenRect.size.height-40)
        detailField.frame = labelRect
        detailField.contentVerticalAlignment = .top
        
        let num = defaults.value(forKey: "num")
        
        if defaults.value(forKey: "detail\(num!)") != nil {
            let detail = defaults.value(forKey: "detail\(num!)")
            detailField.text = detail as! String
        }
        
        self.title = value as! String
        
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(detailField)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        defaults.setValue(self.title, forKey: "titleBack\(num)")
        defaults.setValue(detailField.text, forKey: "detail\(num)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
