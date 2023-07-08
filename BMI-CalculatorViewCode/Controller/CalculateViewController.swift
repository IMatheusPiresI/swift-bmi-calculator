//
//  CalculateViewController.swift
//  BMI-CalculatorViewCode
//
//  Created by Matheus Sousa on 07/07/23.
//

import UIKit

class CalculateViewController: UIViewController {

    var screen: CalculateScreen?
    var calculator = CalculatorBrain()
    
    override func loadView(){
        super.loadView()
        self.screen = CalculateScreen()
        self.view = screen
        self.view.backgroundColor = .red
        self.screen?.delegate(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension CalculateViewController: CalculateScreenDelegate {
    func heightSliderChange(_ sender: UISlider) {
        let heightFormatted = String(format: "%.2f", sender.value)
        screen?.heightValueLabel.text = "\(heightFormatted)m"
    }
    
    func weightSliderChange(_ sender: UISlider) {
        let weightFormatted = String(format: "%.0f", sender.value)
        screen?.weightValueLabel.text = "\(weightFormatted)kg"
    }
    
    func tappedCalculateButton(){
        let height = screen?.heightSlider.value ?? 0
        let weight = screen?.weightSlider.value ?? 0
        
        calculator.calculateBMI(weight: weight, height: height)
        
        let bmiValue = calculator.getBmiValue()
        let advice = calculator.getBmiAdvice()
        let bgColor = calculator.getBmiColor()
        
        let resultVC = ResultsViewController()
        resultVC.BMIValue = bmiValue
        resultVC.advice = advice
        resultVC.bgColor = bgColor

        self.present(resultVC, animated: true)
    }
}

