//
//  SearchTableViewCell.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 27/02/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var questionlabel: UILabel!
    
    @IBOutlet weak var option1label: UILabel!
    
    @IBOutlet weak var option2label: UILabel!
    
    @IBOutlet weak var option3label: UILabel!
    
    @IBOutlet weak var option4label: UILabel!
    
    
    @IBOutlet weak var searchLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
