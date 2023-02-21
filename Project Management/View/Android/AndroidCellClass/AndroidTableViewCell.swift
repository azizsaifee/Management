//
//  AndroidTableViewCell.swift
//  Project Management
//
//  Created by Apple on 08/02/23.
//

import UIKit

class AndroidTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "AndroidTableViewCell", bundle: nil)
    }
    
    func configure(with index: Int) {
        print(index)
    }
    
}
