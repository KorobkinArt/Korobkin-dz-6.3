//
//  ViewController.swift
//  Korobkin dz 6.3
//
//  Created by Артем Коробкин on 24/10/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController, CityProtocol {
    func nameCityPush(name: String) {
        //print(name)
        NetworkManager.shared.addressRequest(address: name) {[weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.cityLabel.text = model.name
                    self?.windspeedLabel.text = String((model.wind?.speed!)!) + " M/S"
                    self?.temperatureLabel.text = String((model.main?.temp!)!) + " °C"
                }
            case .failure(let err):
                print(err)
            }
        }
    }

    private lazy var cityLabel: UILabel = {
        let view = UILabel()
        view.text = "City"
        view.textColor = .systemBlue
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.textAlignment = .center
        return view
    }()
        
    private lazy var temperatureLabel: UILabel = {
        let view = UILabel()
        view.text = "Temperature"
        view.textColor = .systemBlue
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var windspeedLabel: UILabel = {
        let view = UILabel()
        view.text = "Wind"
        view.textColor = .systemBlue
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var changeCityButton: UIButton = {
        let view = UIButton()
        view.setTitle("Изменить город", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        view.addTarget(self, action: #selector(changeCityButtonAction(sender: )), for: .touchUpInside)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        setupData()
    }
    private func setupUi() {
        view.backgroundColor = .white
        view.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        
        view.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(60)
        }
        view.addSubview(windspeedLabel)
        windspeedLabel.snp.makeConstraints { make in
            make.top.equalTo(temperatureLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        view.addSubview(changeCityButton)
        changeCityButton.snp.makeConstraints { make in
            make.top.equalTo(windspeedLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(60)
        }
    }
    
    private func setupData() {
        NetworkManager.shared.addressRequest(address: "Bishkek") {[weak self] result in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self?.cityLabel.text = model.name
                    self?.windspeedLabel.text = String((model.wind?.speed!)!)  + " M/S"
                    self?.temperatureLabel.text = String((model.main?.temp!)!)  + " °C"
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    @objc func changeCityButtonAction(sender: UIButton) {
        let vc = FindCityViewController()
        vc.cityNameDelegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
