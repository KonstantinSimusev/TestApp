//
//  ResultsViewController.swift
//  TestApp
//
//  Created by Konstantin Simusev on 03.07.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    
    // MARK: - Public Properties
    
    
    // MARK: - Private Properties
    
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    // MARK: - IB Actions
    

}

// MARK: - Private Methods
extension ResultsViewController {
    private func setupUI() {
        view.addVerticalGradientLayr(
            topColor: Color.steelBlue,
            bottomColor: Color.lightSteelBlue
        )
        
        navigationItem.hidesBackButton = true
    }
}
