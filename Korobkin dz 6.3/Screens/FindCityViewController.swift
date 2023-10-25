//
//  FindCityViewController.swift
//  Korobkin dz 6.3
//
//  Created by Артем Коробкин on 24/10/23.
//

import UIKit
import SnapKit

protocol CityProtocol {
    func nameCityPush(name: String)
}

class FindCityViewController: UIViewController {
    
    var cityNameDelegate: CityProtocol?
    
    private lazy var cityLabel: UILabel = {
        let view = UILabel()
        view.text = "City"
        view.textColor = .systemBlue
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var cityTextfield: UITextField = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        view.textAlignment = .center
        return view
    }()
    
    private lazy var okChangeButton: UIButton = {
        let view = UIButton()
        view.setTitle("Ok", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 15
        view.addTarget(self, action: #selector(okChangeButtonAction(sender: )), for: .touchUpInside)
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    private func setupUi() {
        view.backgroundColor = .white
        view.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        view.addSubview(cityTextfield)
        cityTextfield.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        view.addSubview(okChangeButton)
        okChangeButton.snp.makeConstraints { make in
            make.top.equalTo(cityTextfield.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(60)
        }
    }
    
    @objc func okChangeButtonAction(sender: UIButton) {
        cityNameDelegate?.nameCityPush(name: cityTextfield.text ?? "London")
        navigationController?.popViewController(animated: true)
    }
    
}
