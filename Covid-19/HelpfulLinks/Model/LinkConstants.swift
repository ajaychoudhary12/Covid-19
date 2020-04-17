//
//  LinkConstants.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 16/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

class LinkConstants {
  static let links = [
    Link(name: "Ministry of Health & Family Welfare, Gov. of India",
         url: "https://www.mohfw.gov.in/"),
    Link(name: "WHO : COVID-19 Home Page",
         url: "https://www.who.int/emergencies/diseases/novel-coronavirus-2019"),
    Link(name: "CDC",
         url: "https://www.cdc.gov/coronavirus/2019-ncov/faq.html"),
    Link(name: "List of Resources & Essentials across India",
         url: "https://bit.ly/covid19resourcelist"),
    Link(name: "COVID-19 Global Tracker",
         url: "https://coronavirus.thebaselab.com")
  ]
}

struct Link {
  let name: String
  let url: String
}
