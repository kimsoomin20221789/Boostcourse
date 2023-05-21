//
//  WeatherViewController.swift
//  Weather
//
//  Created by 김수민 on 2023/05/21.
//

import UIKit

class WeatherViewController: UIViewController {
    var weather: String = ""
    var state: String = ""
    var celsius: String = ""
    var rainPercent: String = ""
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var rainPercentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherImage.image = UIImage(named: weather)
        self.stateLabel.text = state
        self.celsiusLabel.text = celsius
        self.rainPercentLabel.text = rainPercent
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
