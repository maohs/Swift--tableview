//
//  ViewController.swift
//  SwiftTest1
//
//  Created by cao jie on 1/20/16.
//  Copyright (c) 2016 cao jie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var statement = COpaquePointer()
    var data:NSMutableArray = []
    var tableview:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.loadData()
        
        self.tableview = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.rowHeight = CGFloat(130.0)
        self.tableview.registerClass(CustomCell.self, forCellReuseIdentifier: "CutomCell")
        self.tableview.reloadData()
        
        self.view.addSubview(self.tableview)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func loadData() {
        
        var db_path = NSBundle.mainBundle().pathForResource("filmoteca", ofType: "sqlite")
        var db = COpaquePointer()
        var status = sqlite3_open(db_path!,&db)
        if (status == SQLITE_OK) {
            
        }else {
            println("open the sqlite failed")
        }
        
        var query_stmt = "SELECT * FROM pelicula"
        if(sqlite3_prepare_v2(db , query_stmt, -1, &statement, nil) == SQLITE_OK) {
            self.data.removeAllObjects()
            while (sqlite3_step(statement) == SQLITE_ROW) {
                var dictionary = NSMutableDictionary()
                
                let director = sqlite3_column_text(statement, 1)
                let buf_director = String.fromCString( UnsafePointer<CChar>(director))
                
                let imagen = sqlite3_column_text(statement, 2)
                let buf_imagen = String.fromCString(UnsafePointer<CChar>(imagen))
                
                let titulo = sqlite3_column_text(statement, 3)
                let buf_titulo = String.fromCString(UnsafePointer<CChar>(titulo))
                
                let year = sqlite3_column_text(statement, 4)
                let buf_year = String.fromCString(UnsafePointer<CChar>(year))
                
                dictionary.setObject(buf_director!, forKey: "director")
                dictionary.setObject(buf_imagen!, forKey: "imagen")
                dictionary.setObject(buf_titulo!, forKey: "titulo")
                dictionary.setObject(buf_year!, forKey: "year")
                
                data.addObject(dictionary)
            }
            
            sqlite3_finalize(statement)
        }else {
            println("read the sqlite data failed")
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:CustomCell = tableView.dequeueReusableCellWithIdentifier("CutomCell") as! CustomCell
//        if (cell == nil) {
//            cell = CustomCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CutomCell")
//        }
        
        var aux:AnyObject = data[indexPath.row]
        var table_director = aux["director"]
        cell.directorLabel.text = table_director as? String
        
        var table_image = aux["imagen"]
        cell.iconImage.image = UIImage(named: table_image as! String)
        
        var table_title = aux["titulo"]
        cell.titleLabel.text = table_title as? String
        
        var table_year = aux["year"]
        cell.timeLabel.text = table_year as? String
        
        return cell
    }
    
    
    
}

