//
//  SearchViewController.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 27/02/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var searchBarOption: UISearchBar!
    
    @IBOutlet weak var tableview: UITableView!
      
//    MARK: - Var
    
    var demoDict = DetailsVC.objForAppDataRepository.get(byIdentifier: "EcoBank")?.features.topic
    var newData: [Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    // MARK: - Search Func
    
    func checkForMatchingData(matchString: String) -> [Any] {
        
        var data: String = "" {
            didSet {
                example = [["Name" : data]]
            }
        }
        var example = [["Name" : data]]
        if let dictionary = demoDict {
            for (_, value) in dictionary {
                if let subDictionary4 = value as? [String: Any] {
                    for key2 in subDictionary4.keys {
                        if let subDictionary5 = subDictionary4[key2] as? [String: Any] {
                            for key2 in subDictionary5.keys {
                                if key2 == "Description" {
                                    data = (subDictionary5[key2] as? String)!
                                }
                            }
                        }
                    }
                }
            }
        }
        let pre = NSPredicate(format: "Name CONTAINS[cd] %@",matchString)
        let result = example.filter { pre.evaluate(with:$0) }
        print(result)
        return result
    }
    
    
}


// MARK: - TableView Delegate and dataSource

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
            cell.searchLabel.text = ""
        }
        if let data = newData![indexPath.row] as? AppCoreData {
            cell.questionlabel.text = data.id
            cell.option1label.text = ""
            cell.option2label.text = ""
            cell.option3label.text = ""
            cell.option4label.text = ""
            cell.searchLabel.text = ""
        }
        if let data = newData as? [[String:String]] {
            for value in data {
                for value2 in value {
                    print(value2.value)
                    cell.questionlabel.text = value2.value
                    cell.option1label.text = ""
                    cell.option2label.text = ""
                    cell.option3label.text = ""
                    cell.option4label.text = ""
                    
                }
            }
        }
        
        
        return cell
    }
}

//    MARK: - SearchBar

extension SearchViewController :UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let dh = DataBaseHandler()
        if searchText != ""{
            
            newData = checkForMatchingData(matchString: searchText)
            newData?.append(contentsOf: DataBaseHandler.fetchSearchedData(questionNo: searchText)!
            )
            tableview.reloadData()
        }
        else{
            //  DataBaseHandler.adata = []
            //  DataBaseHandler.sdata = []
            newData = []
            tableview.reloadData()
        }
        
    }
}
