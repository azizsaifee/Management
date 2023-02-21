//
//  AndroidVC.swift
//  Project Management
//
//  Created by Apple on 08/02/23.
//

import UIKit

class AndroidVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AndroidTableViewCell.nib(), forCellReuseIdentifier: "AndroidTableViewCell")
    }
}

extension AndroidVC: UITableViewDelegate {
    
}

extension AndroidVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AndroidTableViewCell", for: indexPath) as! AndroidTableViewCell
        cell.configure(with: indexPath.row)
        return cell
    }
}
