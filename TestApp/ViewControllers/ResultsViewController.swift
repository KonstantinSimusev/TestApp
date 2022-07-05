//
//  ResultsViewController.swift
//  TestApp
//
//  Created by Konstantin Simusev on 03.07.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var percentLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    
    // MARK: - Public Properties
    var answers: [Bool]!
    var questions: [Question]!
    
    // MARK: - Private Properties
    private let limitPercent = 90
    
    private var result: Int {
        answers.filter { $0 != false }.count
    }
    
    private var resultPercent: Int {
        result * 100 / questions.count
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private Methods
extension ResultsViewController {
    private func setupUI() {
        view.addVerticalGradientLayr(
            topColor: Color.lightSteelBlue,
            bottomColor: Color.steelBlue
        )
        
        navigationItem.hidesBackButton = true

        setResultLabel()
        setPercentLabel()
        setAnswerLabel()
    }
    
    private func setResultLabel() {
        resultPercent < limitPercent
        ? setRedResultLabel()
        : setGreenResultLabel()
    }
    
    private func setGreenResultLabel() {
        resultLabel.text = "Поздравляем, Вы успешно сдали тест!"
        resultLabel.textColor = Color.forestGreen
        resultLabel.font = .boldSystemFont(ofSize: 30)
    }
    
    private func setRedResultLabel() {
        resultLabel.text = "Тест не сдан!"
        resultLabel.textColor = Color.darkRed
        resultLabel.font = .boldSystemFont(ofSize: 30)
    }
    
    private func setPercentLabel() {
        percentLabel.text = "Ваш результат: \(resultPercent)%"
        percentLabel.textColor = .white
        percentLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    private func setAnswerLabel() {
        answerLabel.text = "Правильных ответов: \(result) из \(questions.count)"
        answerLabel.textColor = .white
        answerLabel.font = .boldSystemFont(ofSize: 20)
    }
}
