//
//  ResultsViewController.swift
//  BMI-CalculatorViewCode
//
//  Created by Matheus Sousa on 07/07/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var screen: ResultsScreen?
    var BMIValue: String?
    var advice: String?
    var bgColor: UIColor?

    override func loadView() {
        super.loadView()
        self.screen = ResultsScreen()
        self.view = screen
        self.screen?.delegate(delegate: self)
        self.view.backgroundColor = self.bgColor
        self.screen?.resultLabel.text = self.BMIValue
        self.screen?.adviceLabel.text = self.advice
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension ResultsViewController: ResultsScreenDelegate {
    func tappedCalculateButton() {
        self.dismiss(animated: true, completion: nil)
    }
}

