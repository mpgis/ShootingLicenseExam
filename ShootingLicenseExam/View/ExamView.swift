//
//  ExamView.swift
//  ShootingLicenseExam
//
//  Created by Jakub Slusarski on 24/02/2024.
//

import SwiftUI

struct ExamView: View {
    @State var examViewModel: ExamViewModel
    
    let answerOptions = ["A", "B", "C"]
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .ignoresSafeArea()
            VStack {
                Text("Patent Strzelecki")
                    .font(.title)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text(examViewModel.question.questionDescription)
                        .font(.headline)
                }

                Spacer()
                
                VStack(alignment: .leading, spacing: 30) {
                    ForEach(answerOptions, id: \.self){ option in
                        OptionView(letter: option, text: examViewModel.question.answers[option]!)
                    }
                }
                .padding()
                
                HStack(spacing: 10) {
                    ForEach(answerOptions, id: \.self) { option in
                        Button(option) {
                            examViewModel.usersChoice(option: option)
                        }
                    }
                    .buttonStyle(AnswerButton())
                }
                .padding(.bottom)
            }
            .padding()
        }
    }
}

struct OptionView: View {
    let letter: String
    let text: String
    
    var body: some View {
        HStack(spacing: 10){
            Text("\(letter): ")
                .font(.title2)
            Text(text)
                .minimumScaleFactor(0.3)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

struct AnswerButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: 100, maxHeight: 50)
            .background(.blue.gradient)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .font(.title)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}

#Preview {
    ExamView(examViewModel: ExamViewModel(howManyExam: 1))
}
