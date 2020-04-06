//
//  DistrictWiseCases.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 06/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

struct DistrictWiseData: Codable {
  let state: String
  let districts: [District]
  
  enum CodingKeys: String, CodingKey {
    case state
    case districts = "districtData"
  }
}
