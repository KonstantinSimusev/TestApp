//
//  QuestionsViewController.swift
//  TestApp
//
//  Created by Konstantin Simusev on 03.07.2022.
//

import UIKit

class QuestionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

// MARK: - Private Methods
extension QuestionsViewController {
    private func setupUI() {
        view.addVerticalGradientLayr(
            topColor: Color.lightSteelBlue,
            bottomColor: Color.steelBlue
        )
    }
}
