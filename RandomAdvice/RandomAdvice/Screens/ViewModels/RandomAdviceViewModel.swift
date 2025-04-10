//
//  RandomAdviceViewModel.swift
//  RandomAdvice
//
//  Created by Ross on 10.04.2025.
//

import Foundation

@MainActor
final class RandomAdviceViewModel: ObservableObject {
    @Published var randomAdvice: RandomAdvice?
    
    func getRandomAdvice() async {
        do {
            randomAdvice = try await RandomAdviceManager.shared.getRandomAdvice()
        } catch {
            print(error.localizedDescription)
        }
    }
}
