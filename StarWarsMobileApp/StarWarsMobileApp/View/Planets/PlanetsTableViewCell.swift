//
//  PlanetsTableViewCell.swift
//  StarWarsMobileApp
//
//  Created by Amandeep Kaur on 31/08/21.
//

import UIKit

class PlanetsTableViewCell: UITableViewCell {
    // MARK:- OUTLETS
    @IBOutlet weak var climateText: UILabel!
    @IBOutlet weak var populationText: UILabel!
    @IBOutlet weak var planetNameText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
