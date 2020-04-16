//
//  QuestionConstants.swift
//  Covid-19
//
//  Created by Ajay Choudhary on 12/04/20.
//  Copyright © 2020 Ajay Choudhary. All rights reserved.
//

class QuestionConstants {
  static let answerSet1 = ["For Yourself","Parent","Spouse","Child","Someone Else"]
  static let answerSet2 = ["Male","Female","Other"]
  static let answerSet3 = ["Less Than 12 Years","12-50 Years","51-60","Above 60 Years"]
  static let answerSet4 = ["Asthma","Chronic Lung Disease (COPD)","Diabetes","Heart Disease","Immuno-Compromised Conditions","Pregnancy","None Of The Above"]
  static let answerSet5 = ["China","Italy","Spain","Iran","Europe","Middle East","Southeast Asia","Country Not Listed Above","None Of The Above"]
  static let defaultSet = ["Yes","No"]
  
  private static let ques1 = "For Whom Are You Taking This Test ?"
  private static let ques2 = "What Is Your Gender Type ?"
  private static let ques3 = "What Is Your Age Group ?"
  private static let ques4 = "Do You Have Any Of These Health Conditions ?"
  private static let ques5 = "Have You Or Someone In Your Family Visited Any Of The Below Countries In Last 14 Days ?"
  private static let ques6 = "Have You Or Someone In Your Family Travelled Within India In Public Transport And Came In Close Contact With Someone With Cough, Cold, Fever, And Shortness Of Breath In The last 14 Days ?"
  private static let ques7 = "Have You Or Someone In Your Family Come In Close Contact With Confirmed COVID-19 Patient In The Last 14 Days ?";
  private static let ques8 = "Do You Have Fever ?"
  private static let ques9 = "Do You Have Headache ?"
  private static let ques10 = "Do You Have Cough ?"
  private static let ques11 = "Do You Have Cold ?"
  private static let ques12 = "Do You Have Sore Throat ?"
  private static let ques13 = "Do You Feel Shortness Of Breath ?"
  private static let ques14 = "Do You Have Coarseness in Voice ?"
  
  static let questions = [
    Question(question: ques1, answers: answerSet1),
    Question(question: ques2, answers: answerSet2),
    Question(question: ques3, answers: answerSet3),
    Question(question: ques4, answers: answerSet4),
    Question(question: ques5, answers: answerSet5),
    Question(question: ques6, answers: defaultSet),
    Question(question: ques7, answers: defaultSet),
    Question(question: ques8, answers: defaultSet),
    Question(question: ques9, answers: defaultSet),
    Question(question: ques10, answers: defaultSet),
    Question(question: ques11, answers: defaultSet),
    Question(question: ques12, answers: defaultSet),
    Question(question: ques13, answers: defaultSet),
    Question(question: ques14, answers: defaultSet),
  ]
}

struct Question {
  let question: String
  let answers: [String]
}
