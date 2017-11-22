//
//  FunctionVCtrl.swift
//  TestLight
//
//  Created by 古秀湖 on 2017/11/22.
//  Copyright © 2017年 古秀湖. All rights reserved.
//

import UIKit

class FunctionVCtrl: UITableViewController {

    var sourceAry = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sourceAry.append("横竖屏")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return sourceAry.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "functionCell", for: indexPath)

        cell.textLabel?.text = sourceAry[indexPath.row];
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
