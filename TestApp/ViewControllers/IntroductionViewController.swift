//
//  IntroductionViewController.swift
//  TestApp
//
//  Created by Konstantin Simusev on 03.07.2022.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var employeeButtons: [UIButton]!
    
    // MARK: - Private Properties
    private let employees = Employee.allCases
    private var currentQuestions: [Question] = []
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let questionsVC = segue.destination as? QuestionsViewController else { return }
        questionsVC.questions = getShuffled(currentQuestions)
    }
    
    // MARK: - IB Actions
    @IBAction func employeeButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = employeeButtons.firstIndex(of: sender) else { return }
        
        let currentEmployee = employees[buttonIndex]
        
        switch currentEmployee {
        case .packer:
            currentQuestions = getRandomQuestion(for: Question.getPackerQuestions())
        case .cutter:
            currentQuestions = getRandomQuestion(for: Question.getCutterQustions())
        case .stacker:
            currentQuestions = getRandomQuestion(for: Question.getStackerQustions())
        }
        
        performSegue(withIdentifier: "showQuestion", sender: nil)
    }

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {}
}

// MARK: - Private Methods
extension IntroductionViewController {
    private func setupUI() {
        view.addVerticalGradientLayr(
            topColor: Color.lightSteelBlue,
            bottomColor: Color.steelBlue
        )
        
        setupButton()
    }
    
    func getShuffled(_ questions: [Question]) -> [Question] {
        var shuffleQuestions: [Question] = []
        
        questions.forEach { question in
            let shuffleQuestion = Question(
                title: question.title,
                type: question.type,
                answers: question.answers.shuffled()
            )
            shuffleQuestions.append(shuffleQuestion)
        }
        return shuffleQuestions.shuffled()
    }
    
    private func getRandomQuestion(for questions: [Question]) -> [Question] {
        var randomQuestions: [Question] = []
        var sum = 0
        
        while sum < 4 {
            sum += 1
            if let randomQuestion = questions.randomElement() {
                randomQuestions.append(randomQuestion)
            }
        }
        return randomQuestions
    }
    
    private func setupButton() {
        for (button, employee) in zip(employeeButtons, employees) {
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.setTitleColor(.black, for: .normal)
            button.backgroundColor = .white
            button.layer.cornerRadius = 10
            button.setTitle(employee.rawValue, for: .normal)
        }
    }

}
