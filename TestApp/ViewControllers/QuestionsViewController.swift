//
//  QuestionsViewController.swift
//  TestApp
//
//  Created by Konstantin Simusev on 03.07.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    @IBOutlet var multipleButton: UIButton!
    
    // MARK: - Public Properties
    var questions: [Question]!
    
    // MARK: - Private Properties
    private var questionIndex = 0
    private var choosenAnswers: [Bool] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultsVC = segue.destination as? ResultsViewController else { return }
        resultsVC.answers = choosenAnswers
        resultsVC.questions = questions
    }
    
    // MARK: - IB Actions
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex].type
        choosenAnswers.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func multipleButtonAnswerPressed() {
        getAnwers()
        nextQuestion()
        isSwitchOff()
    }
}

// MARK: - Private Methods
extension QuestionsViewController {
    private func setupUI() {
        // Set background color
        view.addVerticalGradientLayr(
            topColor: Color.lightSteelBlue,
            bottomColor: Color.steelBlue
        )
        
        // Hide navigation button
        navigationItem.hidesBackButton = true
        
        // Hide stacks
        for stackView in [singleStackView, multipleStackView] {
            stackView?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndex]

        // Set current question for question label
        questionLabel.text = currentQuestion.title
        
        // Calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        // Set progress for progress view
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Set navigation title
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        // Show stack corresponding to question type
        showCurrentAnswers(for: currentQuestion.type)
        
        // Set button
        setSingleButton()
        setMultipleButton()
        
        // Set label
        setMultipleLabel()
    }
    
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            setupUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    private func getAnwers() {
        if getMultipleSwitches() == getMultipleAnswers() {
            choosenAnswers.append(true)
        } else {
            choosenAnswers.append(false)
        }
    }
    
    private func getMultipleSwitches() -> [Bool] {
        var switches: [Bool] = []
        
        multipleSwitches.forEach { multipleSwitch in
            if multipleSwitch.isOn {
                switches.append(true)
            } else {
                switches.append(false)
            }
        }
        return switches
    }
    
    private func getMultipleAnswers() -> [Bool] {
        var answers: [Bool] = []
        
        currentAnswers.forEach { answer in
            answers.append(answer.type)
        }
        return answers
    }
    
    private func isSwitchOff() {
        multipleSwitches.forEach { multipleSwitch in
            multipleSwitch.isOn = false
        }
    }
    
    private func setSingleButton() {
        singleButtons.forEach { button in
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
            button.setTitleColor(.darkGray, for: .normal)
            button.backgroundColor = .white.withAlphaComponent(0.3)
            button.layer.cornerRadius = 10
        }
    }
    
    private func setMultipleLabel() {
        multipleLabels.forEach { label in
            label.textColor = .darkGray
            label.font = .boldSystemFont(ofSize: 20)
            label.layer.cornerRadius = 10
        }
    }
    
    private func setMultipleButton() {
        multipleButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        multipleButton.setTitleColor(.darkGray, for: .normal)
        multipleButton.backgroundColor = .white.withAlphaComponent(0.3)
        multipleButton.layer.cornerRadius = 10
    }
}
