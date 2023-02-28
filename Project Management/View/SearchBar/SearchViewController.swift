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
    
    let data = ["h1","h2","a","a1","b","b1","c"]
    var filterdata: [String]!
    
    var sdata = [Questions]()
   // var sdata2 = [AppCoreData]()
   // static var objRepositorys = AppDataRepositorys()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.navigationBar.isHidden = true
        filterdata = data
        let dh = DataBaseHandler()
        
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    

}
extension SearchViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return filterdata.count
        return sdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
       // cell.textLabel?.text = filterdata[indexPath.row]
        cell.questionlabel.text = sdata[indexPath.row].question
        cell.option1label.text = sdata[indexPath.row].option1
        cell.option2label.text = sdata[indexPath.row].option2
        cell.option3label.text = sdata[indexPath.row].option3
        cell.option4label.text = sdata[indexPath.row].option4
      //  cell.textLabel?.text = sdata2[indexPath.row].description
        return cell
    }
    
    
}

extension SearchViewController :UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filterdata = []
//        if searchText == ""{
//            filterdata = data
//        }
//        for word in data{
//            if word.uppercased().contains(searchText.uppercased()){
//                filterdata.append(word)
//            }
//        }
//        self.tableview.reloadData()
        let dh = DataBaseHandler()
        if searchText != ""{
            sdata = dh.fetchSearchedData(questionNo: searchText)
            tableview.reloadData()
        }
//        else if searchText != ""{
//            sdata2 = dh.fetchSearchData2(id: searchText)
//            tableview.reloadData()
//
//        }
        else{
            //print("try some better options ")
            print("")
        }
    }
}
