//
//  CountriesTableViewCell.swift
//  Weather
//
//  Created by 김수민 on 2023/05/21.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {

    @IBOutlet var flagImage: UIImageView!
    @IBOutlet var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
