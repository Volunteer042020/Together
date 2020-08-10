//
//  MyEventView.swift
//  Together
//
//  Created by Евгений Шварцкопф on 10.08.2020.
//  Copyright © 2020 GermanyHome. All rights reserved.
//

import UIKit

protocol MyEventViewImpl {
    //функции типа, покажи данные
}


final class MyEventView: UIView {
    
    //MARK: - Private properties
    private var presenter: MyEventViewAction?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.systemGray5
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemGray6
        
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        
        imageView.layer.shadowOffset = CGSize(width: 0, height: 2)
        imageView.layer.shadowColor = UIColor.lightGray.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 3
        imageView.layer.masksToBounds = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var myEventLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.customGray
        label.font = UIFont(name: "", size: 20)
        label.text = "У вас еще нет ни одной просьбы о помощи"
        label.numberOfLines = 2
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var greatMyEventButton: UIButton = {
        let button = RoundedButtonWithShadow(type: .system)
        
        button.setTitle("Создать просьбу", for: .normal)
        button.titleLabel?.font = UIFont(name: "", size: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .marineButton
        
        button.addTarget(self, action: #selector(greatMyEventAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor.systemGray5
        
        setupScrollView()
        setupImageView()
        setupMyEventLabel()
        setupGreatMyEventButton()
    }
    
    private func setupScrollView() {
        self.addSubview(scrollView)
        
        scrollView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true 
    }
    
    private func setupImageView() {
        scrollView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: -imageCenterYConstant).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageWidth).isActive = true
    }
    
    private func setupMyEventLabel() {
        scrollView.addSubview(myEventLabel)
        
        myEventLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: eventTopConstant).isActive = true
        myEventLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: labelRightAndLeftConstant).isActive = true
        myEventLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -labelRightAndLeftConstant).isActive = true
    }
    
    private func setupGreatMyEventButton() {
        scrollView.addSubview(greatMyEventButton)
        
        greatMyEventButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        greatMyEventButton.topAnchor.constraint(equalTo: myEventLabel.bottomAnchor, constant: buttonTopConstant).isActive = true
        greatMyEventButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: sideArchoreConctant).isActive = true
        greatMyEventButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -sideArchoreConctant).isActive = true
        greatMyEventButton.bottomAnchor.constraint(equalToSystemSpacingBelow: scrollView.bottomAnchor, multiplier: 0).isActive = true
        
        greatMyEventButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
    }
    
}

extension MyEventView: PresenterHaving {
    
    func setPresenter(_ presenter: ViewAstions) {
        if let presenter = presenter as? MyEventViewAction {
            self.presenter = presenter
        }
    }
}

extension MyEventView: MyEventViewImpl {
    
    @objc func greatMyEventAction(_ sender: UIButton) {
        print("Создаю просьбу")
    }
}

//MARK: - Size properties
extension MyEventView {
    
    private var buttonTopConstant: CGFloat { return 230.0 }
    private var buttonHeight: CGFloat { return 40.0 }
    
    private var eventTopConstant: CGFloat { return 10.0 }
    private var labelRightAndLeftConstant: CGFloat { return 100.0 }
    
    private var imageCenterYConstant: CGFloat { return 50.0 }
    private var imageHeight: CGFloat { return 150.0 }
    private var imageWidth: CGFloat { return 220.0 }
    
}
