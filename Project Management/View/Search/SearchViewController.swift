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
    
    
    var newData: [Any]?

    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.navigationBar.isHidden = true
        //let dh = DataBaseHandler()
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    

}
extension SearchViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        if let data = newData![indexPath.row] as? Questions {
            cell.questionlabel.text = data.question
            cell.option1label.text = data.option1
            cell.option2label.text = data.option2
            cell.option3label.text = data.option3
            cell.option4label.text = data.option4
        }
        if let data = newData![indexPath.row] as? AppCoreData {
            cell.questionlabel.text = data.id
            cell.option1label.text = ""
            cell.option2label.text = ""
            cell.option3label.text = ""
            cell.option4label.text = ""
        }
        
        
        return cell
    }
}

extension SearchViewController :UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        //let dh = DataBaseHandler()
        if searchText != ""{
            newData = DataBaseHandler.fetchSearchedData(questionNo: searchText)
         //  sdata =  dh.fetchSearchedData(searchText: searchText)
            tableview.reloadData()
        }
        else{
//            DataBaseHandler.adata = []
//            DataBaseHandler.sdata = []
            newData = []
            tableview.reloadData()
        }
        
    }
}
