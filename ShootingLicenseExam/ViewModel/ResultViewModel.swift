//
//  ResultViewModel.swift
//  ShootingLicenseExam
//
//  Created by Jakub Slusarski on 24/02/2024.
//

import Foundation
import Observation

@Observable
class ResultViewModel{
    var answers: [UserAnswerModel]
    let examsCount: Int
    
    var results: [ResultModel] = []
    
    
    init(answers: [UserAnswerModel], examsCount: Int) {
        self.answers = answers
        self.examsCount = examsCount
        self.results = createResultItems()
    }
    
    func createResultItems() -> [ResultModel]{
        var results: [ResultModel] = []
        for n in 0..<examsCount {
               var score = 0
               var answersInExam: [UserAnswerModel] = []

               let filteredAnswers = answers.filter { $0.examNumber == n }

               for answer in filteredAnswers {
                   if answer.question.isCorrect(answer: answer.answer) {
                       score += 1
                   }
                   answersInExam.append(answer)
               }

               let result = ResultModel(examNumber: n, score: score, userAnswers: answersInExam)
               results.append(result)
           }
        return results
    }
}
