//
//  ViewController.swift
//  WeatherInformation
//
//  Created by 김수민 on 2023/05/20.
//

import UIKit

class CountriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView! //아웃렛 프로퍼티
    let cellIdentifier: String = "cell" //identifier
    
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{   switch section {
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let text: String
        switch indexPath.section {
        case 0:
            text = asia[indexPath.row]
        case 1:
            text = europe[indexPath.row]
        case 2:
            text = northAmerica[indexPath.row]
        default:
            text = "기타"
        }
        cell.textLabel?.text = text
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

}
