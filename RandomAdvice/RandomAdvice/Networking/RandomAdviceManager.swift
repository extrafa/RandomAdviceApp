//
//  RandomAdviceManager.swift
//  RandomAdvice
//
//  Created by Ross on 10.04.2025.
//

import Foundation

final class RandomAdviceManager {
    static let shared = RandomAdviceManager()
    let urlString = "https://api.adviceslip.com/advice"
    
    func getRandomAdvice() async throws -> RandomAdvice {
        guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        let decoder = JSONDecoder()
        return try decoder.decode(RandomAdviceSlip.self, from: data).slip
    }
}

enum NetworkError: String, Error {
    case invalidURL = "Invalid url found."
    case invalidResponse = "Invalid response found."
}
