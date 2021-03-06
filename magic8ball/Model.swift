//
//  Model.swift
//  magic8ball
//
//  Created by Maksym Mezhuiev on 08.10.2021.
//

import Foundation

let urlString = "https://8ball.delegator.com/magic/JSON/Will%20I%20ever%20give%20you%20up%3F"
var dAnswers = [String]()


var jsonAnswer: String = ""

struct Resultat: Codable {
    let magic: MyResult
}

struct MyResult: Codable {
    let question: String
    let answer: String
    let type: String
}
