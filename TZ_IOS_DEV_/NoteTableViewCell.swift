//
//  NoteTableViewCell.swift
//  TZ_IOS_DEV_
//
//  Created by Pavlo Kharambura on 9/22/17.
//  Copyright © 2017 Pavlo Kharambura. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
