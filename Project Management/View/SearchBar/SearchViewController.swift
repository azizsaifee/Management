//
//  SearchViewController.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 27/02/23.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBarOption: UISearchBar!
    
    @IBOutlet weak var tableview: UITableView!
    
    
    var sdata = [Questions]()

    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.navigationBar.isHidden = true
        let dh = DataBaseHandler()
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    

}
extension SearchViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        cell.questionlabel.text = sdata[indexPath.row].question
        cell.option1label.text = sdata[indexPath.row].option1
        cell.option2label.text = sdata[indexPath.row].option2
        cell.option3label.text = sdata[indexPath.row].option3
        cell.option4label.text = sdata[indexPath.row].option4
     
        return cell
    }
}

extension SearchViewController :UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        let dh = DataBaseHandler()
        if searchText != ""{
           // sdata = dh.fetchSearchedData(questionNo: searchText)
           sdata =  dh.fetchSearchedData(searchText: searchText)
            tableview.reloadData()
        }
        
    }
}
