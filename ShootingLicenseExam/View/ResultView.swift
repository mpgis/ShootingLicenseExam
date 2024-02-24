//
//  ResultView.swift
//  ShootingLicenseExam
//
//  Created by Jakub Slusarski on 24/02/2024.
//

import SwiftUI

struct ResultView: View {
    @State var resultViewModel: ResultViewModel
    
    var body: some View {
        VStack{
            List {
                ForEach(resultViewModel.results, id: \.examNumber){ result in
                    HStack{
                        Text("Egzamin \(result.examNumber + 1)")
                        Spacer()
                        Text("Wynik: \(result.score)/10")
                    }
                }
            }
        }
    }
}

#Preview {
    ResultView(resultViewModel:
                ResultViewModel(answers: 
                                    [UserAnswerModel(question: QuestionModel(questionNumber: 1, questionDescription: "aa", answers: ["a":"a"], correctAnswer: "a"),
                                                     answer: "a", examNumber: 1)], examsCount: 1))
}
