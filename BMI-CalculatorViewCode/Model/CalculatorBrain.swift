//
//  CalculatorBrain.swift
//  BMI-CalculatorViewCode
//
//  Created by Matheus Sousa on 08/07/23.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    
    func getBmiValue() -> String {
        if let bmiValue = bmi?.value {
            if bmiValue.isNaN {
                return "0"
            }
        }

        return String(format: "%.0f", bmi?.value ?? 0.0)
    }
    
    func getBmiAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getBmiColor() -> UIColor {
        return bmi?.color ?? UIColor.purple
    }
    
    mutating func calculateBMI(weight: Float, height: Float){
        let bmiCalc = weight / pow(height, 2)
        let verifyBmi = bmiCalc.isNaN ? 0 : bmiCalc
        
        if verifyBmi < 18.5 {
            self.bmi = BMI(value: verifyBmi, advice: "Underweight", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }else if verifyBmi >= 18.5 && bmiCalc <= 24.9 {
            self.bmi = BMI(value: verifyBmi, advice: "Normal weight",  color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        }else if verifyBmi >= 25 && bmiCalc <= 29.9 {
            self.bmi = BMI(value: verifyBmi, advice: "Overweight", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }else {
            self.bmi = BMI(value: verifyBmi, advice: "Obese", color: .red)
        }
    }
    
}
