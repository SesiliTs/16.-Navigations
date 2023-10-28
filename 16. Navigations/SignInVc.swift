//
//  ViewController.swift
//  16. Navigations
//
//  Created by Sesili Tsikaridze on 27.10.23.
//

import UIKit

class SignInVC: UIViewController {
    
    //MARK: - Elements
    
    let personImage = UIImageView()
    let signInLabel = UILabel()
    let backgroundImage = UIImageView()
    
    let emailTextfield = UITextField()
    let passwordTextfield = UITextField()
    let forgotLabel = UILabel()
    
    let signInButton = UIButton()
    
    let firstLine = UIView()
    let orLabel = UILabel()
    
    let googleImage = UIImageView()
    let fbImage = UIImageView()
    let linkedinImage = UIImageView()
    
    let noAccountLabel = UILabel()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        backgroundImageSetup()
        personImageSetup()
        signInLabelSetup()
        emailSetup()
        passwordSetup()
        forgotLabelSetup()
        signInButtonSetup()
        lineSetup()
        orLabelSetup()
        logoSetup()
        noAccountSetup()
        
        textfieldtoStack()
        imageLabeltoStack()
        lineToStack()
        logoToStack()
        uniteStack()
    }
    
    //MARK: - UI Setup
    
    func personImageSetup() {
        
        personImage.image = .person
        personLabelStack.addArrangedSubview(personImage)
        
        personImage.widthAnchor.constraint(equalToConstant: 160).isActive = true
        personImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
    }
    
    func signInLabelSetup() {
        signInLabel.text = "Sign In"
        signInLabel.font = .systemFont(ofSize: 28, weight: .bold)
        signInLabel.textColor = .black
        
        personLabelStack.addArrangedSubview(signInLabel)
    }
    
    func emailSetup() {
        emailTextfield.backgroundColor = .systemGray6
        emailTextfield.textColor = .black
        emailTextfield.layer.borderWidth = 1
        emailTextfield.layer.borderColor = UIColor.systemGray5.cgColor
        emailTextfield.layer.cornerRadius = 16
        emailTextfield.font?.withSize(14)
        emailTextfield.placeholder = " Email"
        
        textfieldStack.addArrangedSubview(emailTextfield)
        emailTextfield.heightAnchor.constraint(equalToConstant: 53).isActive = true
    }
    
    func passwordSetup() {
        passwordTextfield.backgroundColor = .systemGray6
        passwordTextfield.layer.borderWidth = 1
        passwordTextfield.layer.borderColor = UIColor.systemGray5.cgColor
        passwordTextfield.layer.cornerRadius = 16
        passwordTextfield.font?.withSize(14)
        passwordTextfield.placeholder = " Password"
        
        textfieldStack.addArrangedSubview(passwordTextfield)
        passwordTextfield.heightAnchor.constraint(equalToConstant: 53).isActive = true
    }
    
    func forgotLabelSetup() {
        forgotLabel.text = "Forgot your password?"
        forgotLabel.font = .systemFont(ofSize: 14, weight: .regular)
        forgotLabel.textColor = .lightGray
        
        textfieldStack.addArrangedSubview(forgotLabel)
    }
    
    func signInButtonSetup() {
        signInButton.backgroundColor = UIColor(red: 0.133, green: 0.341, blue: 0.478, alpha: 1)
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.layer.cornerRadius = 20
        
        signInButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        signInButtonAction()
        
        emailTextfield.endEditing(true)
        passwordTextfield.endEditing(true)
        
        
    }
    
    func lineSetup() {
        firstLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        firstLine.backgroundColor = .lightGray
        lineStack.addArrangedSubview(firstLine)
    }
    
    func orLabelSetup() {
        orLabel.text = "Or"
        orLabel.font = .systemFont(ofSize: 14, weight: .regular)
        orLabel.textColor = .darkGray
        orLabel.backgroundColor = .white
        lineStack.addArrangedSubview(orLabel)
    }
    
    func logoSetup() {
        googleImage.image = .google
        fbImage.image = .FB
        linkedinImage.image = .linkedin
        
        logoStack.addArrangedSubview(googleImage)
        logoStack.addArrangedSubview(fbImage)
        logoStack.addArrangedSubview(linkedinImage)
        
        googleImage.heightAnchor.constraint(equalToConstant: 42).isActive = true
        googleImage.widthAnchor.constraint(equalToConstant: 42).isActive = true
        
        fbImage.heightAnchor.constraint(equalToConstant: 42).isActive = true
        fbImage.widthAnchor.constraint(equalToConstant: 42).isActive = true
        
        linkedinImage.heightAnchor.constraint(equalToConstant: 42).isActive = true
        linkedinImage.widthAnchor.constraint(equalToConstant: 42).isActive = true
        
    }
    
    func noAccountSetup() {
        noAccountLabel.text = "Don't have an account? Sign Up"
        noAccountLabel.font = .systemFont(ofSize: 14, weight: .regular)
        noAccountLabel.textColor = .lightGray
        noAccountLabel.textAlignment = .left
    }
    
    func backgroundImageSetup() {
        
        backgroundImage.image = .background
        
        view.addSubview(backgroundImage)
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    //MARK: StackViews
    
    let personLabelStack = UIStackView()
    
    func imageLabeltoStack() {
        personLabelStack.axis = .vertical
        personLabelStack.alignment = .center
        personLabelStack.distribution = .fill
        personLabelStack.spacing = 15
        personLabelStack.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    let textfieldStack = UIStackView()
    
    func textfieldtoStack() {
        textfieldStack.axis = .vertical
        textfieldStack.alignment = .fill
        textfieldStack.distribution = .fill
        textfieldStack.spacing = 15
        
    }
    
    let lineStack = UIStackView()
    
    func lineToStack() {
        lineStack.axis = .vertical
        lineStack.alignment = .center
        lineStack.distribution = .equalSpacing
        lineStack.spacing = 2
    }
    
    let logoStack = UIStackView()
    
    func logoToStack() {
        logoStack.axis = .horizontal
        logoStack.alignment = .center
        logoStack.distribution = .equalSpacing
        logoStack.spacing = 11
    }
    
    let unitedStack = UIStackView()
    
    func uniteStack() {
        unitedStack.axis = .vertical
        unitedStack.alignment = .fill
        unitedStack.distribution = .fill
        unitedStack.spacing = 32
        unitedStack.setCustomSpacing(14, after: lineStack)
        unitedStack.setCustomSpacing(65, after: logoStack)
        
        unitedStack.addArrangedSubview(personLabelStack)
        unitedStack.addArrangedSubview(textfieldStack)
        unitedStack.addArrangedSubview(signInButton)
        unitedStack.addArrangedSubview(lineStack)
        unitedStack.addArrangedSubview(logoStack)
        unitedStack.addArrangedSubview(noAccountLabel)
        
        view.addSubview(unitedStack)
        
        unitedStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            unitedStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.5),
            unitedStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.5),
            unitedStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 99)
        ])
    }
    
    //MARK: - Actions
    
    func signInButtonAction() {
        signInButton.addAction(UIAction(handler: { [weak self] action  in
            if self?.emailTextfield.text?.isEmpty == true || self?.passwordTextfield.text?.isEmpty == true {
                print("fill textfield")
            } else {
                self?.pushToMainPage()
            }
        }), for: .touchUpInside)
    }
    
    //MARK: - Navigation
    
    func pushToMainPage() {
        let mainPageVC = MainPageVC()
        navigationController?.pushViewController(mainPageVC, animated: true)
    }
    
}

