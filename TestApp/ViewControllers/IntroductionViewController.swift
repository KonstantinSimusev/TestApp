//
//  ViewController.swift
//  TestApp
//
//  Created by Konstantin Simusev on 02.07.2022.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var employeeButtons: [UIButton]!
    
    // MARK: - Private Properties
    private let employee = Employee.allCases
    private var currentQuestions: [Question] = []
    
    // MARK: - Ovverride Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    // MARK: - IB Actions
    @IBAction func employeeButtonsPressed(_ sender: UIButton) {
        guard let buttonIndex = employeeButtons.firstIndex(of: sender) else { return }
        
        let currentEmployee = employee[buttonIndex]
        
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
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {} // Удалить Bar Button Items от QuestionsViewController!
    
}

// MARK: - Private Methods
extension IntroductionViewController {
    private func setupUI() {
        view.addVerticalGradientLayr(
            topColor: Color.steelBlue,
            bottomColor: Color.lightSteelBlue
        )
        
        setupButton()
    }
    
    private func setupButton() {
        for (button, employee) in zip(employeeButtons, employee) {
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            button.setTitleColor(.systemBlue, for: .normal)
            button.backgroundColor = .white
            button.layer.cornerRadius = 10
            button.setTitle(employee.rawValue, for: .normal)
        }
    }

}
