//
//  ResultModel.swift
//  ShootingLicenseExam
//
//  Created by Jakub Slusarski on 24/02/2024.
//

import Foundation

struct ResultModel {
    let examNumber: Int
    let score: Int
    let userAnswers: [UserAnswerModel]
}
