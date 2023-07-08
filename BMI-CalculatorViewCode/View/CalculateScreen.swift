//
//  CalculateScreen.swift
//  BMI-CalculatorViewCode
//
//  Created by Matheus Sousa on 07/07/23.
//

import UIKit

protocol CalculateScreenDelegate: AnyObject {
    func heightSliderChange(_ sender: UISlider)
    func weightSliderChange(_ sender: UISlider)
    func tappedCalculateButton()
}

class CalculateScreen: UIView {
    
    private weak var delegate: CalculateScreenDelegate?
    
    public func delegate(delegate: CalculateScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backgroundImage: UIImageView = {
       let image = UIImageView()

        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "calculate_background")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CALCULATE\nYOUR BMI"
        label.textColor = .darkGray
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 42)
        
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CALCULATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var weightSlider: UISlider = {
        let slider = UISlider()
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = .purple
        slider.thumbTintColor = .purple
        slider.minimumValue = 0
        slider.maximumValue = 300
        slider.value = 0
        slider.addTarget(self, action: #selector(onWeightSliderChange), for: .valueChanged)
        
        return slider
    }()
    
    lazy var weightLabel: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    lazy var weightValueLabel: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0kg"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .right
        
        return label
    }()
    
    lazy var weightStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.addArrangedSubview(self.weightLabel)
        stack.addArrangedSubview(self.weightValueLabel)
        
        return stack
    }()
    
    lazy var heightSlider: UISlider = {
        let slider = UISlider()
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = .purple
        slider.thumbTintColor = .purple
        slider.minimumValue = 0
        slider.maximumValue = 3
        slider.value = 0
        slider.addTarget(self, action: #selector(onHeightSliderChange), for: .valueChanged)
        
        return slider
    }()
    
    lazy var heightLabel: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Height"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    lazy var heightValueLabel: UILabel = {
       let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.00m"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 16)

        label.textAlignment = .right
        
        return label
    }()
    
    lazy var heightStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.addArrangedSubview(self.heightLabel)
        stack.addArrangedSubview(self.heightValueLabel)
        
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.backgroundImage)
        self.addSubview(self.titleLabel)
        self.addSubview(self.calculateButton)
        self.addSubview(self.weightSlider)
        self.addSubview(self.weightStackView)
        self.addSubview(self.heightSlider)
        self.addSubview(self.heightStackView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onHeightSliderChange(_ sender: UISlider){
        self.delegate?.heightSliderChange(sender)
    }
    
    @objc func onWeightSliderChange(_ sender: UISlider){
        self.delegate?.weightSliderChange(sender)
    }
    
    @objc func tappedCalculateButton(){
        self.delegate?.tappedCalculateButton()
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.titleLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -160),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.calculateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 48),
            
            self.weightSlider.bottomAnchor.constraint(equalTo: self.calculateButton.topAnchor, constant: -20),
            self.weightSlider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.weightSlider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.weightStackView.bottomAnchor.constraint(equalTo: self.weightSlider.topAnchor, constant: -12),
            self.weightStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.weightStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.weightLabel.centerYAnchor.constraint(equalTo: self.weightStackView.centerYAnchor),
            self.weightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.weightValueLabel.centerYAnchor.constraint(equalTo: self.weightStackView.centerYAnchor),
            self.weightValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.heightSlider.bottomAnchor.constraint(equalTo: self.weightStackView.topAnchor, constant: -20),
            self.heightSlider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.heightSlider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.heightStackView.bottomAnchor.constraint(equalTo: self.heightSlider.topAnchor, constant: -12),
            self.heightStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.heightStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.heightLabel.centerYAnchor.constraint(equalTo: self.heightStackView.centerYAnchor),
            self.heightLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            self.heightValueLabel.centerYAnchor.constraint(equalTo: self.heightStackView.centerYAnchor),
            self.heightValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
