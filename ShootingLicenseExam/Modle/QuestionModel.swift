//
//  QuestionModel.swift
//  ShootingLicenseExam
//
//  Created by Jakub Slusarski on 24/02/2024.
//

import Foundation

struct QuestionModel {
    let questionNumber: Int
    let questionDescription: String
    let answers: [String: String]
    let correctAnswer: String
    
    func isCorrect(answer: String) -> Bool {
        return answer == correctAnswer
    }
}
