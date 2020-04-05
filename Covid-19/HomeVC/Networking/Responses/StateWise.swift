//
//  StateWise.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 04/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import Foundation

struct StateData: Codable {
  let active: String
  let confirmed: String
  let deaths: String
  let recovered: String
  let state: String
}
