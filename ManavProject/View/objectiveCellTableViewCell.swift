//
//  objectiveCellTableViewCell.swift
//  ManavProject
//
//  Created by Jigmet stanzin Dadul on 26/06/23.
//

import UIKit

protocol ObjectiveCellDelegate: AnyObject {
    func addingProgress()
    func subtractProgress()
}
class objectiveCellTableViewCell: UITableViewCell {

    
   
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var objectiveHeadLabel: UILabel!
    @IBOutlet weak var objectiveDetailLabel: UILabel!
    @IBOutlet weak var objectiveIconLabel: UILabel!
    weak var delegate: ObjectiveCellDelegate?
    var buttonClickedBool = Bool()
    var tableView = UITableView()
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkBoxClicked(_ sender: UIButton) {
        if !buttonClickedBool {
            let image = UIImage(systemName: "checkmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .medium))
            checkBoxButton.tintColor = .purple
            checkBoxButton.setImage(image, for: .normal)
            buttonClickedBool = true
            delegate?.addingProgress()
        }else{
            let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 0, weight: .light))
            checkBoxButton.tintColor = .systemBackground
            checkBoxButton.setImage(image, for: .normal)
            buttonClickedBool = false
            delegate?.subtractProgress()
        }
//        tableView.reloadData()
    }
    func retCheck()->Bool{
        return buttonClickedBool
    }
}
