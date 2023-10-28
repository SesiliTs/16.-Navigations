//
//  MainPageVC.swift
//  16. Navigations
//
//  Created by Sesili Tsikaridze on 27.10.23.
//

import UIKit

protocol MainVCDelegate: AnyObject {
    func changeButtonColor(color: UIColor)
    func changeBackgroundColor(color: UIColor)
}

class MainPageVC: UIViewController, MainVCDelegate {
    
    func changeButtonColor(color: UIColor) {
        pushColorButton.backgroundColor = color
        presentColorButton.backgroundColor = color
    }
    
    func changeBackgroundColor(color: UIColor) {
        view.backgroundColor = color
    }
    

    //MARK: - Elements

    let presentColorButton = UIButton()
    let pushColorButton = UIButton()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        presentButtonSetup()
        pushButtonSetup()
        
        addButtonsToStack()
    }
    
    //MARK: - Set up UI
    
    func presentButtonSetup() {
        presentColorButton.backgroundColor = UIColor(red: 0.133, green: 0.341, blue: 0.478, alpha: 1)
        presentColorButton.setTitle("Present Color Palette", for: .normal)
        presentColorButton.layer.cornerRadius = 20
        
        presentButtonAction()
        
        presentColorButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func pushButtonSetup() {
        pushColorButton.backgroundColor = UIColor(red: 0.133, green: 0.341, blue: 0.478, alpha: 1)
        pushColorButton.setTitle("Push Color Palette", for: .normal)
        pushColorButton.layer.cornerRadius = 20
        
        pushButtonAction()
        
        pushColorButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    //MARK: - StackView
    
    let stackView = UIStackView()
    
    func addButtonsToStack() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 32
        
        stackView.addArrangedSubview(presentColorButton)
        stackView.addArrangedSubview(pushColorButton)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.5),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    //MARK: - Actions
    
    func presentButtonAction() {
        presentColorButton.addAction(UIAction(handler: { [weak self] action  in
            self?.presentToColorPage()
    }), for: .touchUpInside)
    }
    
    func pushButtonAction() {
        pushColorButton.addAction(UIAction(handler: { [weak self] action  in
                self?.pushToColorPage()
        }), for: .touchUpInside)
    }

    // MARK: - Navigation

    func pushToColorPage() {
        let colorPage = ColorPalleteVC()
        colorPage.delegate = self
        navigationController?.pushViewController(colorPage, animated: true)
    }
    
    func presentToColorPage() {
        let colorPage = ColorPalleteVC()
        colorPage.delegate = self
        present(colorPage, animated: true)
    }
    

}
