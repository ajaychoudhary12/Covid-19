//
//  CovidClient.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 04/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import Foundation

class CovidClient {
  
  class func fetchTimeSeriesAndStateWiseStats(completion: @escaping ([StateData], [CaseTimeSerie], ErrorMessage?) -> Void) {
    
    let urlString = "https://api.covid19india.org/data.json"
    guard let url = URL(string: urlString) else {
      completion([], [], .invalidRequest)
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        completion([], [], .unableToComplete)
        return
      }
      guard let data = data else {
        completion([], [], .invalidData)
        return
      }
      
      do {
        let responseObject = try JSONDecoder().decode(StateWiseCases.self, from: data)
        let stateDataArray = responseObject.stateDataArray
        let caseTimeSeries = responseObject.caseTimeSeries
        DispatchQueue.main.async {
          completion(stateDataArray, caseTimeSeries, nil)
        }
      } catch {
        completion([], [], .invalidResponse)
      }
      
    }
    task.resume()
  }
  
}
