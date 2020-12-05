//
//  BookViewCell.swift
//  IDZ_Project
//
//  Created by Ais Moll on 05.12.2020.
//  Copyright © 2020 Ais Moll. All rights reserved.
//

import UIKit

class BookViewCell: UITableViewCell {


    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var AuthorLabel: UILabel!
    @IBOutlet var StatusLabel: UILabel!
    @IBOutlet var CellActionButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
