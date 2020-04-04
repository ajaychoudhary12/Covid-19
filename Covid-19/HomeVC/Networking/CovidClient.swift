//
//  CovidClient.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 04/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

import Foundation

class CovidClient {
  
  class func fetchTimeSeriesAndStateWiseStats(completion: @escaping ([StateData]) -> Void) {
    let urlString = "https://api.covid19india.org/data.json"
    guard let url = URL(string: urlString) else { return }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else { return }
      guard let data = data else { return }
      
      do {
        let responseObject = try JSONDecoder().decode(StateWiseCases.self, from: data)
        let stateDataArray = responseObject.stateDataArray
        DispatchQueue.main.async {
          completion(stateDataArray)
        }
      } catch {
        print(error)
      }
      
    }
    task.resume()
  }
  
}
