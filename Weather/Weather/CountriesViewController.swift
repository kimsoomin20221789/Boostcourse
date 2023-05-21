//
//  ViewController.swift
//  Weather
//
//  Created by 김수민 on 2023/05/21.
//

import UIKit

class CountriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView! //아웃렛 프로퍼티
    let countriesCellIdentifier: String = "countriesCell" //identifier
    
    let asia: [String] = ["한국", "일본"] //data
    let europe: [String] = ["독일", "이탈리아", "프랑스"]
    let northAmerica: [String] = ["미국"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //section을 입력받고 section에 해당하는  row가 몇개여야하는지 알려달라는 함수
    //TableView가 물어보는 함수임 : 나 이 section에 몇개의 row 넣어줘야돼?
    //section마다 다른 수를 return
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section {
        case 0:
            return asia.count
        case 1:
            return europe.count
        case 2:
            return northAmerica.count
        default:
            return 0
        }
    }
    
    //TableView : row에 해당되는 cell을 넘겨줘!
    //cellForRowAt: cell을 돌려주는 data 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell 생성
        let cell: CountriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.countriesCellIdentifier, for: indexPath) as! CountriesTableViewCell
        //강제캐스팅을 하지 않고 어떻게 해볼깡??
        
        //cell에 들어갈 text생성
        let text: String
        let image: UIImage?
        switch indexPath.section {
        case 0:
            text = asia[indexPath.row]
            switch text {
            case "한국":
                image = UIImage(named: "flag_kr.jpg")
            case "일본":
                image = UIImage(named: "flag_jp.jpg")
            default:
                image = nil
            }
        case 1:
            text = europe[indexPath.row]
            switch text {
            case "독일":
                image = UIImage(named: "flag_de.jpg")
            case "이탈리아":
                image = UIImage(named: "flag_it.jpg")
            case "프랑스":
                image = UIImage(named: "flag_fr.jpg")
            default:
                image = nil
            }
        case 2:
            text = northAmerica[indexPath.row]
            image = UIImage(named: "flag_us.jpg")
        default:
            text = "기타"
            image = nil
        }
        cell.countryLabel?.text = text
        cell.flagImage?.image = image
        return cell
    }
    
    //section에 title 달아주기
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "아시아"
        case 1:
            return "유럽"
        case 2:
            return "북아메리카"
        default:
            return "기타"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let nextViewController: CityTableViewController = segue.destination as? CityTableViewController else {
            return
        }
        
        guard let cell: CountriesTableViewCell = sender as? CountriesTableViewCell else {return}
        
        nextViewController.navigationItem.title = cell.textLabel?.text
        
        switch cell.countryLabel?.text {
        case "한국":
            nextViewController.assetName = "kr"
        case "독일":
            nextViewController.assetName = "de"
        case "이탈리아":
            nextViewController.assetName = "it"
        case "미국":
            nextViewController.assetName = "us"
        case "프랑스":
            nextViewController.assetName = "fr"
        case "일본":
            nextViewController.assetName = "jp"
        default:
            return
        
        }
    }
    

}

