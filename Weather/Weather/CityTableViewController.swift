//
//  CityTableViewController.swift
//  Weather
//
//  Created by 김수민 on 2023/05/21.
//

import UIKit

class CityTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var assetName: String = ""
    
    @IBOutlet weak var cityTableView: UITableView!
    let cityCellIdentifier: String = "cityCell"
    var cities: [Cities] = [] //이 데이터 가져오는것은 viewDidLoad에서 해줄거임!
    
    
    
    //TableView : section별로 row의 갯수를 알려줘
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    //TableView : row에 해당하는 셀을 넘겨줘
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cell 생성(customize)
        let cityCell: CityTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cityCellIdentifier, for: indexPath) as! CityTableViewCell
        
        //row에 있는 cell가져오기
        let city: Cities = self.cities[indexPath.row]
        
        cityCell.cityLabel?.text = city.city_name
        cityCell.weatherLabel?.text = "섭씨온도 : \(city.celsius) 화씨온도 : \(city.celsius * 2 + 30)"
        cityCell.rainyPercentLabel?.text = "강수확률 : \(city.rainfall_probability) %"
        switch city.celsius {
        case ...10:
            cityCell.weatherLabel?.textColor = .systemBlue
        case 10...25:
            cityCell.weatherLabel?.textColor = .black
        default:
            cityCell.weatherLabel?.textColor = .systemRed
        }
        
        switch city.rainfall_probability {
        case 0...60:
            cityCell.rainyPercentLabel.textColor = .black
        default:
            cityCell.rainyPercentLabel.textColor = .systemOrange
        }
        
        var weather: UIImage? {
            switch city.state {
            case 10:
                cityCell.weatherState = "sunny"
                return UIImage(named: "sunny")
            case 11:
                cityCell.weatherState = "cloudy"
                return UIImage(named: "cloudy")
            case 12:
                cityCell.weatherState = "rainy"
                return UIImage(named: "rainy")
            case 13:
                cityCell.weatherState = "snowy"
                return UIImage(named: "snowy")
            default:
                return nil
            }
        }
        cityCell.weatherImage.image = weather
        return cityCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return 90
        }
    
    override func viewDidLoad() { //뷰가 didload된 후 해야될일
        super.viewDidLoad()

        // json데이터를 불러와서 cities배열에 넣기
        let jsonDecoder: JSONDecoder = JSONDecoder()
        cityTableView.dataSource = self
        cityTableView.delegate = self
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: assetName) else {
            return
        }
        
        do {
            self.cities = try jsonDecoder.decode([Cities].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.cityTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextViewController: WeatherViewController = segue.destination as? WeatherViewController else {return}
        
        guard let cell: CityTableViewCell = sender as? CityTableViewCell else {return}
        
        nextViewController.weather = cell.weatherState
        switch cell.weatherState {
        case "sunny":
            nextViewController.state = "맑음"
        case "cloudy":
            nextViewController.state = "흐림"
        case "rainy":
            nextViewController.state = "비"
        case "snowy":
            nextViewController.state =  "눈"
        default:
            return
        }
        
        if let weatherLabelText = cell.weatherLabel?.text {nextViewController.celsius = weatherLabelText} else {return}
        if let percentLabelText = cell.rainyPercentLabel?.text {nextViewController.rainPercent = percentLabelText} else {return}
        
        
    }
    

}
