//
//  MyTableVC.swift
//  TestDemo
//
//  Created by JadavMac on 20/07/17.
//  Copyright © 2017 MV Jadav. All rights reserved.
//

import UIKit

class MyTableVC: UIViewController {

    @IBOutlet weak var IBtbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.IBtbl.reloadData()
        self.IBtbl.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MyTableVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
//        cell.textLabel?.text        = "Title"
//        cell.detailTextLabel?.text   = "Description"
//        return cell
        
        var cell:MyTableVCCell? = tableView.dequeueReusableCell(withIdentifier: "MyTableVCCell") as? MyTableVCCell
        if (cell == nil) {
            let nib: NSArray = Bundle.main.loadNibNamed("MyTableVCCell", owner: self, options: nil)! as NSArray
            cell = nib.object(at: 0) as? MyTableVCCell
        }
        cell?.selectionStyle = .none
        return cell!
        
    }
}
