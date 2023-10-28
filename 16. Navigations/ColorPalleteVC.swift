//
//  ColorPalleteVC.swift
//  16. Navigations
//
//  Created by Sesili Tsikaridze on 27.10.23.
//

import UIKit

class ColorPalleteVC: UIViewController {
    
    weak var delegate: MainVCDelegate?
    
    //MARK: - Elements
    
    let changeButtonLabel = UILabel()
    
    let blueButton = UIButton()
    let greenButton = UIButton()
    let cyanButton = UIButton()
    let orangeButton = UIButton()
    let brownButton = UIButton()
    let yellowButton = UIButton()
    
    let changeBGLabel = UILabel()
    
    let blueButtonBG = UIButton()
    let greenButtonBG = UIButton()
    let cyanButtonBG = UIButton()
    let orangeButtonBG = UIButton()
    let brownButtonBG = UIButton()
    let yellowButtonBG = UIButton()


    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        buttonColor(button: blueButton, color: .blue)
        buttonColor(button: greenButton, color: .green)
        buttonColor(button: cyanButton, color: .cyan)
        buttonColor(button: orangeButton, color: .orange)
        buttonColor(button: brownButton, color: .brown)
        buttonColor(button: yellowButton, color: .yellow)
        
        buttonColor(button: blueButtonBG, color: .blue)
        buttonColor(button: greenButtonBG, color: .green)
        buttonColor(button: cyanButtonBG, color: .cyan)
        buttonColor(button: orangeButtonBG, color: .orange)
        buttonColor(button: brownButtonBG, color: .brown)
        buttonColor(button: yellowButtonBG, color: .yellow)
        changeButtonLabelSetup()
        changeBGLabelSetup()
        
        buttonBGsToHorizontalStack()
        buttonBGsToSecondStack()
        mergeUpperStack()
        backgroundsToHorizontalStack()
        backgroundsToSecondStack()
        mergeLowerStack()
        uniteStack()
        
        backgroundButtonWasPressed(button: blueButtonBG)
        backgroundButtonWasPressed(button: greenButtonBG)
        backgroundButtonWasPressed(button: cyanButtonBG)
        backgroundButtonWasPressed(button: orangeButtonBG)
        backgroundButtonWasPressed(button: brownButtonBG)
        backgroundButtonWasPressed(button: yellowButtonBG)
        
        buttonChangeWasPressed(button: blueButton)
        buttonChangeWasPressed(button: greenButton)
        buttonChangeWasPressed(button: cyanButton)
        buttonChangeWasPressed(button: orangeButton)
        buttonChangeWasPressed(button: brownButton)
        buttonChangeWasPressed(button: yellowButton)

        
    }
    
    //MARK: - Setup UI
    
    func buttonColor(button: UIButton, color: UIColor) {
        button.backgroundColor = color
        button.layer.cornerRadius = 20
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func changeButtonLabelSetup() {
        changeButtonLabel.text = "Change Home Buttons Background Colors"
        changeButtonLabel.font = .systemFont(ofSize: 14, weight: .regular)
        changeButtonLabel.textColor = .lightGray
    }
    
    func changeBGLabelSetup() {
        changeBGLabel.text = "Change Home Background Color"
        changeBGLabel.font = .systemFont(ofSize: 14, weight: .regular)
        changeBGLabel.textColor = .lightGray
    }
    
    //MARK: StackView
    
    let buttonBackgroundHorizontalStack = UIStackView()
    
    func buttonBGsToHorizontalStack() {
        buttonBackgroundHorizontalStack.axis = .horizontal
        buttonBackgroundHorizontalStack.alignment = .fill
        buttonBackgroundHorizontalStack.distribution = .fillEqually
        buttonBackgroundHorizontalStack.spacing = 10
        
        buttonBackgroundHorizontalStack.addArrangedSubview(blueButton)
        buttonBackgroundHorizontalStack.addArrangedSubview(greenButton)
        buttonBackgroundHorizontalStack.addArrangedSubview(cyanButton)
    }
    
    let buttonBackgroundSecondStack = UIStackView()
    
    func buttonBGsToSecondStack() {
        buttonBackgroundSecondStack.axis = .horizontal
        buttonBackgroundSecondStack.alignment = .fill
        buttonBackgroundSecondStack.distribution = .fillEqually
        buttonBackgroundSecondStack.spacing = 10
        
        buttonBackgroundSecondStack.addArrangedSubview(orangeButton)
        buttonBackgroundSecondStack.addArrangedSubview(brownButton)
        buttonBackgroundSecondStack.addArrangedSubview(yellowButton)
    }
    
    let upperButtonStack = UIStackView()
    
    func mergeUpperStack() {
        upperButtonStack.addArrangedSubview(buttonBackgroundHorizontalStack)
        upperButtonStack.addArrangedSubview(buttonBackgroundSecondStack)
        
        upperButtonStack.axis = .vertical
        upperButtonStack.alignment = .fill
        upperButtonStack.distribution = .fillEqually
        upperButtonStack.spacing = 10
    }
    
    let backgroundHorizontalStack = UIStackView()
    
    func backgroundsToHorizontalStack() {
        backgroundHorizontalStack.axis = .horizontal
        backgroundHorizontalStack.alignment = .fill
        backgroundHorizontalStack.distribution = .fillEqually
        backgroundHorizontalStack.spacing = 10
        
        backgroundHorizontalStack.addArrangedSubview(blueButtonBG)
        backgroundHorizontalStack.addArrangedSubview(greenButtonBG)
        backgroundHorizontalStack.addArrangedSubview(cyanButtonBG)
    }
    
    let backgroundSecondStack = UIStackView()
    
    func backgroundsToSecondStack() {
        backgroundSecondStack.axis = .horizontal
        backgroundSecondStack.alignment = .fill
        backgroundSecondStack.distribution = .fillEqually
        backgroundSecondStack.spacing = 10
        
        backgroundSecondStack.addArrangedSubview(orangeButtonBG)
        backgroundSecondStack.addArrangedSubview(brownButtonBG)
        backgroundSecondStack.addArrangedSubview(yellowButtonBG)
    }
    
    let lowerButtonStack = UIStackView()
    
    func mergeLowerStack() {
        lowerButtonStack.addArrangedSubview(backgroundHorizontalStack)
        lowerButtonStack.addArrangedSubview(backgroundSecondStack)
        
        lowerButtonStack.axis = .vertical
        lowerButtonStack.alignment = .fill
        lowerButtonStack.distribution = .fillEqually
        lowerButtonStack.spacing = 10
    }
    
    let unitedStack = UIStackView()
    
    func uniteStack() {
        unitedStack.addArrangedSubview(changeButtonLabel)
        unitedStack.addArrangedSubview(upperButtonStack)
        unitedStack.addArrangedSubview(changeBGLabel)
        unitedStack.addArrangedSubview(lowerButtonStack)
        
        unitedStack.axis = .vertical
        unitedStack.alignment = .fill
        unitedStack.distribution = .fillEqually
        unitedStack.spacing = 50
        unitedStack.setCustomSpacing(10, after: changeButtonLabel)
        unitedStack.setCustomSpacing(10, after: changeBGLabel)
        
        view.addSubview(unitedStack)
        
        unitedStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            unitedStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.5),
            unitedStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.5),
            unitedStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    //MARK: - Actions
    
    func backgroundButtonWasPressed(button: UIButton) {
        button.addAction(UIAction(handler: { [weak self] action  in
            self?.delegate?.changeBackgroundColor(color: button.backgroundColor ?? .clear)
        }), for: .touchUpInside)
    }
    
    func buttonChangeWasPressed(button: UIButton) {
        button.addAction(UIAction(handler: { [weak self] action  in
            self?.delegate?.changeButtonColor(color: button.backgroundColor ?? .clear)
        }), for: .touchUpInside)
    }

}
