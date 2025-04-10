//
//  RandomAdviceModel.swift
//  RandomAdvice
//
//  Created by Ross on 10.04.2025.
//

import Foundation

struct RandomAdviceSlip: Decodable {
    let slip: RandomAdvice
}

struct RandomAdvice: Decodable {
    let id: Int
    let advice: String
}
