//
//  Cities.swift
//  Weather
//
//  Created by 김수민 on 2023/05/21.
//

import Foundation

struct Cities: Codable {
    /*
     {
        "city_name":"도쿄",
        "state":12,
        "celsius":2.3,
        "rainfall_probability":40
     }
     */
    let city_name: String
    let state: Double
    let celsius: Double
    let rainfall_probability: Int
    
}
