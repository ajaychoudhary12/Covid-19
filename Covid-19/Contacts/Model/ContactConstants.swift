//
//  Contacts.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 15/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

class ContactConstants {
  static let contacts = [
    HelpLineContact(state: "Andaman and Nicobar Islands", number: "03192-232102"),
    HelpLineContact(state: "Andhra Pradesh", number: "0866-2410978"),
    HelpLineContact(state: "Arunachal Pradesh", number: "9436055743"),
    HelpLineContact(state: "Assam", number: "6913347770"),
    HelpLineContact(state: "Bihar", number: "104"),
    HelpLineContact(state: "Chandigarh", number: "9779558282"),
    HelpLineContact(state: "Chhattisgarh", number: "104"),
    HelpLineContact(state: "Dadra & Nagar Haveli, Daman & Diu", number: "104"),
    HelpLineContact(state: "Delhi", number: "011-22307145"),
    HelpLineContact(state: "Goa", number: "104"),
    HelpLineContact(state: "Gujrat", number: "104"),
    HelpLineContact(state: "Haryana", number: "8558893911"),
    HelpLineContact(state: "Himachal Pradesh", number: "104"),
    HelpLineContact(state: "Jammu & Kashmir", number: "01912520982"),
    HelpLineContact(state: "Jharkhand", number: "104"),
    HelpLineContact(state: "Karnataka", number: "104"),
    HelpLineContact(state: "Kerala", number: "0471-2552056"),
    HelpLineContact(state: "Ladakh", number: "01982256462"),
    HelpLineContact(state: "Lakshadweep", number: "104"),
    HelpLineContact(state: "Madhya Pradesh ", number: "104"),
    HelpLineContact(state: "Maharashtra", number: "020-26127394"),
    HelpLineContact(state: "Manipur", number: "3852411668"),
    HelpLineContact(state: "Meghalaya", number: "108"),
    HelpLineContact(state: "Mizoram", number: "102"),
    HelpLineContact(state: "Nagaland", number: "7005539653"),
    HelpLineContact(state: "Odisha ", number: "9439994859"),
    HelpLineContact(state: "Puducherry", number: "104"),
    HelpLineContact(state: "Punjab", number: "104"),
    HelpLineContact(state: "Rajasthan", number: "0141-2225624"),
    HelpLineContact(state: "Sikkim", number: "104"),
    HelpLineContact(state: "Tamil Nadu", number: "044-29510500"),
    HelpLineContact(state: "Telangana", number: "104"),
    HelpLineContact(state: "Tripura", number: "0381-2315879"),
    HelpLineContact(state: "Uttarakhand", number: "104"),
    HelpLineContact(state: "Uttar Pradesh", number: "18001805145"),
    HelpLineContact(state: "West Bengal", number: "1800313444222")
  ]
}

struct HelpLineContact {
  let state: String
  let number: String
}
