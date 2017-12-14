//
//  firstViewController.swift
//  MyToDo
//
//  Created by Apple on 2017/11/27.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class firstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let defaults = UserDefaults.standard
    var numberOfRow = Int()
    var celltitle = String()
    var detail = String()
    
    var todoItems = [ToDoItem]()
    let tableView = UITableView()
    
    func didTapAddItemButton(_ sender:UIBarButtonItem){
        let alert = UIAlertController(title: "New Todo item", message: "Insert the title of the new to-do item:", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:{ (_) in
            if let title = alert.textFields?[0].text {
                self.addNewToDoItem(title:title,time: "")
            }
        }
        ))
        self.present(alert, animated: true, completion: nil)
    }
    
    func addNewToDoItem (title: String, time: String ) {
        let newIndex = todoItems.count
        todoItems.append(ToDoItem(detail: detail, title: title,time: time))
        tableView.insertRows(at: [IndexPath(row: newIndex, section:0)], with: .top)
        
       
        numberOfRow = 0
        defaults.setValue(title, forKey: "title")
        defaults.synchronize()
        
        //跳转到详情页
        let viewController = secondViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if defaults.value(forKey: "titleBack\(numberOfRow)") != nil{
            let valueBack = defaults.value(forKey: "titleBack\(numberOfRow)")
            celltitle = valueBack as! String
        }else{
            celltitle = " "
        }
        tableView.reloadData()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "ToDoList"
        self.view.backgroundColor = UIColor.white
        //导航栏
        self.navigationController?.isNavigationBarHidden = false
        
        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x:0,y:20,width:screenRect.size.width,height:screenRect.size.height-20)
        
        tableView.frame = tableRect
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        //添加单元格
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (barButtonSystemItem: .add, target: self , action: #selector(didTapAddItemButton(_:)))
        
        self.view.addSubview(tableView)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    //复用单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell:CustomizeUITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomizeUITableViewCell
        if (cell == nil)
        {
            cell = CustomizeUITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell?.titleinRow.text = celltitle
        }
        self.viewDidDisappear(true)
        return cell!
    }
    
    //点击单元格跳转 segue
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let itemString = [indexPath.row]
        
        self.performSegue(withIdentifier: "ShowDetailView", sender: itemString)
    }*/
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = secondViewController()//Q:secondviewcontroller加了初始化器后这里要求参数coder：#nscoder#，是什么东西？
        self.navigationController?.pushViewController(viewController, animated: true)
        numberOfRow = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    
    
    //左滑删除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            todoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
            
            defaults.removeObject(forKey: "String")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let textdetail = defaults.value(forKey: "detail\(numberOfRow)")
        defaults.setValue(textdetail, forKey: "detail\(numberOfRow)")
        defaults.setValue(numberOfRow, forKey: "num")
    }

    
}
