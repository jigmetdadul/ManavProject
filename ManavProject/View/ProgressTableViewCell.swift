//
//  ProgressTableViewCell.swift
//  ManavProject
//
//  Created by Jigmet stanzin Dadul on 26/06/23.
//

import UIKit

class ProgressTableViewCell: UITableViewCell {

    @IBOutlet weak var objectiveHeadLabel: UILabel!
    
    @IBOutlet weak var objectiveDetailLabel: UILabel!
    
    @IBOutlet weak var objectiveIconLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
