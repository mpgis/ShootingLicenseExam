//
//  ResultView.swift
//  ShootingLicenseExam
//
//  Created by Jakub Slusarski on 24/02/2024.
//

import SwiftUI

struct ResultView: View {
    @State var resultViewModel: ResultViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            List {
                ForEach(resultViewModel.results, id: \.examNumber){ result in
                    HStack{
                        NavigationLink(destination: DetailResultView(userAnswers: result.userAnswers)){
                            Text("Egzamin \(result.examNumber + 1)")
                            Spacer()
                            Text("Wynik: \(result.score)/10")
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
                })
     
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
