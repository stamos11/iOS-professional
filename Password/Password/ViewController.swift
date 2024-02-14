//
//  ViewController.swift
//  Password
//
//  Created by stamoulis nikolaos on 13/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    let newPasswordTextField = PasswordTextField(placeHolderText: "New password")
    let criteriaView = PasswordCriteriaView(text: "uppercase letter (A-Z)")
    let stackView = UIStackView()
        override func viewDidLoad() {
            super.viewDidLoad()
            style()
            layout()
        }
    }
    
extension ViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        criteriaView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
//        stackView.addArrangedSubview(newPasswordTextField)
        stackView.addArrangedSubview(criteriaView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

    }
}


