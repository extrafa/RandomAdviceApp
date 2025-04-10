//
//  RandomAdviceView.swift
//  RandomAdvice
//
//  Created by Ross on 10.04.2025.
//

import SwiftUI

struct RandomAdviceView: View {
    @StateObject var randomAdviceViewModel = RandomAdviceViewModel()
    var body: some View {
        VStack {
            randomAdvice
            randomAdviceButton
        }
        .task {
            await randomAdviceViewModel.getRandomAdvice()
        }
    }
}

extension RandomAdviceView {
    var randomAdvice: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray)
                .frame(width: .infinity, height: 300)
                .padding(2)
            
            Group {
                if let advice = randomAdviceViewModel.randomAdvice {
                    AnyView(Text(advice.advice))
                } else {
                    ProgressView()
                }
            }
        }
    }
    
    var randomAdviceButton: some View {
        Button {
            Task {
                await randomAdviceViewModel.getRandomAdvice()
            }
        } label: {
            Text("UPDATE ADVICE")
        }
    }
}

#Preview {
    RandomAdviceView()
}
