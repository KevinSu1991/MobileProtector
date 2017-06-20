//
//  MainCheckController.swift
//  MobileProtector
//
//  Created by KevinSu on 2017/6/19.
//  Copyright © 2017年 Safe.360. All rights reserved.
//

import UIKit

class MainCheckController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    static let CELLIDENTIFIER = "MainCheckCellIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initTableView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: MainCheckController.CELLIDENTIFIER)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: MainCheckController.CELLIDENTIFIER, for: indexPath) as UITableViewCell!
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
}
