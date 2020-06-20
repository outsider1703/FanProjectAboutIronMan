//
//  Biography.swift
//  FanProjectAboutIronMan
//
//  Created by Macbook on 20.06.2020.
//  Copyright © 2020 Igor Simonov. All rights reserved.
//

struct Biography: Decodable {
    let fullName: String?
    let alterEgos: String?
    let aliases: [String]?
    let placeOfBirth: String?
    let firstAppearance: String?
    let publisher: String?
}
