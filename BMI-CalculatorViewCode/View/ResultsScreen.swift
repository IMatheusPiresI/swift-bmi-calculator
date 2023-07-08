//
//  ResultsScreen.swift
//  BMI-CalculatorViewCode
//
//  Created by Matheus Sousa on 07/07/23.
//

import UIKit


protocol ResultsScreenDelegate: AnyObject {
    func tappedCalculateButton()
}

class ResultsScreen: UIView {
    
    private weak var delegate: ResultsScreenDelegate?
    
    public func delegate(delegate: ResultsScreenDelegate?){
        self.delegate = delegate
    }
    
    lazy var backgroundImage: UIImageView = {
       let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "result_background")
    
        
        return image
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RECALCULATE", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "YOUR RESULT"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 36)
        
        return label
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0.0"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 56)
        
        return label
    }()
    
    lazy var adviceLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Text my advice"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.backgroundImage)
        self.addSubview(self.calculateButton)
        self.addSubview(self.messageLabel)
        self.addSubview(self.resultLabel)
        self.addSubview(self.adviceLabel)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedCalculateButton(){
        self.delegate?.tappedCalculateButton()
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.calculateButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 44),
            
            self.resultLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.resultLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.messageLabel.bottomAnchor.constraint(equalTo: self.resultLabel.topAnchor,
                                                      constant: -12),
            self.messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.adviceLabel.topAnchor.constraint(equalTo: self.resultLabel.bottomAnchor, constant: 12),
            self.adviceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
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
