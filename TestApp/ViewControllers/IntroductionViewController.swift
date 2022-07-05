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
    private let questionsCount = 4
    private let employees = Employee.allCases
    private var currentQuestions: [Question] = []
    private var numberFromEnd: Int {
        currentQuestions.count - questionsCount
    }
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let questionsVC = segue.destination as? QuestionsViewController else { return }
        questionsVC.questions = getShuffled(currentQuestions).dropLast(numberFromEnd)
    }
    
    // MARK: - IB Actions
    @IBAction func employeeButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = employeeButtons.firstIndex(of: sender) else { return }
        
        let currentEmployee = employees[buttonIndex]
        
        switch currentEmployee {
        case .packer:
            currentQuestions = Question.getPackerQuestions()
        case .cutter:
            currentQuestions = Question.getCutterQustions()
        case .stacker:
            currentQuestions = Question.getStackerQustions()
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
