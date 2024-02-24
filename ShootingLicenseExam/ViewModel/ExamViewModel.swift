//
//  ExamViewModel.swift
//  ShootingLicenseExam
//
//  Created by Jakub Slusarski on 24/02/2024.
//

import Foundation
import Observation

@Observable
class ExamViewModel {
    var exams: [ExamModel] = []
    var firstPart: [QuestionModel] = []
    var secondPart: [QuestionModel] = []
    
    var question: QuestionModel = QuestionModel(questionNumber: 1, questionDescription: "Test1", answers: ["A" : "OdpA", "B" : "OdpB", "C" : "OdpC"], correctAnswer: "A")
    var userAnswers: [UserAnswerModel] = []
    
    var currentExam: Int = 0
    var currentQuestion: Int = 0
    
    var endOfExam: Bool = false
    
    init(howManyExam: Int) {
        loadData()
        createExam(howMany: howManyExam)
        getNextQuestion()
    }
    
    
    
    func usersChoice(option :String){
        let userAnswer = UserAnswerModel(questionNumber: question.questionNumber, answer: option, examNumber: currentExam)
        userAnswers.append(userAnswer)
        getNextQuestion()
    }
    
    func getNextQuestion(){
        if currentExam < exams.count {
            let exam = exams[currentExam]
            if currentQuestion < exam.questions.count {
                //question = exam.questions[currentQuestion]
                currentQuestion += 1
            } else {
                currentQuestion = 0
                currentExam += 1
                getNextQuestion()
            }
        } else {
            endOfExam = true
        }
    }
    
    func createExam(howMany:Int){
        for _ in 0 ..< howMany {
            var questions: [QuestionModel] = []
            for _ in 1 ... 4 {
                questions.append(firstPart.randomElement() ?? question)
            }
            for _ in 5 ... 10 {
                questions.append(secondPart.randomElement() ?? question)
            }
            let exam = ExamModel(questions: questions)
            exams.append(exam)
        }
    }
    
    func loadData() {
        guard let filepath = Bundle.main.path(forResource: "data", ofType: "tsv"),
              let data = try? String(contentsOfFile: filepath) else {
            return
        }
        
        let rows = data.components(separatedBy: "\n").dropFirst()
        
        for row in rows {
            let columns = row.components(separatedBy: "\t")
            if columns.count == 7 {
                if let questionNumber = Int(columns[0]) {
                    let question = columns[1]
                    let answerA = columns[2]
                    let answerB = columns[3]
                    let answerC = columns[4]
                    let correctAnswer = columns[5]
                    
                    if question.isEmpty{
                        continue
                    }
                        
                    let questionModel = QuestionModel(questionNumber: questionNumber, questionDescription: question, answers: ["A" : answerA, "B" : answerB, "C" : answerC], correctAnswer: correctAnswer)
                    
                    
                    if questionModel.questionDescription == "Broń palną można posiadać wyłącznie:" {
                        self.question = questionModel
                    }
                    
                    
                    if questionModel.questionNumber <= 4 {
                        firstPart.append(questionModel)
                    } else {
                        secondPart.append(questionModel)
                    }
                }
            }
        }
    }
    
}
