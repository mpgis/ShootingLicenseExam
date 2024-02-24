//
//  UserAnswerModel.swift
//  ShootingLicenseExam
//
//  Created by Jakub Slusarski on 24/02/2024.
//

import Foundation

struct UserAnswerModel: Identifiable{
    var id = UUID()
    let question: QuestionModel
    let answer: String
    let examNumber: Int
}
