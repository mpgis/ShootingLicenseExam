//
//  DetailResultView.swift
//  ShootingLicenseExam
//
//  Created by Jakub Slusarski on 24/02/2024.
//

import SwiftUI

struct DetailResultView: View {
    var userAnswers: [UserAnswerModel]
    
    var body: some View {
        VStack{
            ScrollView{
                ForEach(userAnswers){ answer in
                    DetailResultViewCell(answer: answer)
                }
            }
            .padding([.top, .leading, .trailing])
        }
    }
}

#Preview {
    DetailResultView(userAnswers: [UserAnswerModel(question: QuestionModel(questionNumber: 1, questionDescription: "a", answers: ["A":"a", "B":"a", "C":"a"], correctAnswer: "a"), answer: "a", examNumber: 1), UserAnswerModel(question: QuestionModel(questionNumber: 1, questionDescription: "a", answers: ["A":"a", "B":"a", "C":"a"], correctAnswer: "a"), answer: "a", examNumber: 1)])
}

struct DetailResultViewCell: View {
    let answer: UserAnswerModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(answer.question.questionDescription)
                .bold(true)
                .padding(.bottom)
            VStack(alignment: .leading, spacing: 5){
                ForEach(["A", "B", "C"], id: \.self) { option in
                    Text(answer.question.answers[option, default: ""])
                        .foregroundStyle(getForegroundColor(forOption: option))
                }
            }

        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
    
    func getForegroundColor(forOption option: String) -> Color {
        if answer.answer == option {
            return answer.question.isCorrect(answer: option) ? .green : .red
        } else {
            return answer.question.isCorrect(answer: option) ? .green : .black
        }
    }
}
