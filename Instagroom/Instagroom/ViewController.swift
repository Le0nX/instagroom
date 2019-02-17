//
//  ViewController.swift
//  Instagroom
//
//  Created by Denis Nefedov on 16/02/2019.
//  Copyright © 2019 X. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /**
     Создаем кнопку с помощью closure
     */
    let plusPhotoBtn: UIButton = {
        let btn = UIButton()
//        btn.backgroundColor = .red
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "set_photo"), for: .normal)
        return btn
    }()
    
    let emailTextField: UITextField = {
        let fld = UITextField()
        fld.placeholder = "Email"
        fld.translatesAutoresizingMaskIntoConstraints = false
        fld.backgroundColor = UIColor(white: 0, alpha: 0.03)
        fld.borderStyle = .roundedRect
        fld.font = UIFont.systemFont(ofSize: 14)
        return fld
    }()
    
    let usernameField: UITextField = {
        let fld = UITextField()
        fld.placeholder = "Username"
        fld.translatesAutoresizingMaskIntoConstraints = false
        fld.backgroundColor = UIColor(white: 0, alpha: 0.03)
        fld.borderStyle = .roundedRect
        fld.font = UIFont.systemFont(ofSize: 14)
        return fld
    }()
    
    let passwordField: UITextField = {
        let fld = UITextField()
        fld.placeholder = "Enter password"
        fld.isSecureTextEntry = true
        fld.translatesAutoresizingMaskIntoConstraints = false
        fld.backgroundColor = UIColor(white: 0, alpha: 0.03)
        fld.borderStyle = .roundedRect
        fld.font = UIFont.systemFont(ofSize: 14)
        return fld
    }()
    
    
    let submitBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        btn.setTitle("Sign Up", for: .normal)
        btn.backgroundColor = UIColor(red: 149/255, green:  204/255, blue: 244/255, alpha: 1)
        btn.layer.cornerRadius = 5
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(plusPhotoBtn) // добавляем кнопку как subview
        plusPhotoBtn.heightAnchor.constraint(equalToConstant: 140).isActive = true
        plusPhotoBtn.widthAnchor.constraint(equalToConstant: 140).isActive = true
        plusPhotoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        plusPhotoBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        setupInputFields()
    }
    
    fileprivate func setupInputFields() {
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField,usernameField,passwordField, submitBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: plusPhotoBtn.bottomAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 200)
            ])
        
    }


}

