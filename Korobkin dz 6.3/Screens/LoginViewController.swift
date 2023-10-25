//
//  LoginViewController.swift
//  Korobkin dz 6.3
//
//  Created by Артем Коробкин on 24/10/23.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private lazy var emailTextfield: UITextField = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var passwordTextfield: UITextField = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var logInButton: UIButton = {
        let view = UIButton()
        view.setTitle("Log In", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 15
        
        return view
    }()
    
    private lazy var registrButton: UIButton = {
        let view = UIButton()
        view.setTitle("Registration", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 15
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    private func setupUi() {
        view.backgroundColor = .white
        view.addSubview(emailTextfield)
        emailTextfield.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        view.addSubview(passwordTextfield)
        passwordTextfield.snp.makeConstraints { make in
            make.top.equalTo(emailTextfield.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        view.addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextfield.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        view.addSubview(registrButton)
        registrButton.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
    }

}
