//
//  CityTableViewCell.swift
//  Weather
//
//  Created by 김수민 on 2023/05/21.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    var weatherState: String = ""
    @IBOutlet var weatherImage: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    @IBOutlet var rainyPercentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
