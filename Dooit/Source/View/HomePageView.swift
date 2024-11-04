//
//  HomePageView.swift
//  Dooit
//
//  Created by Dinmukhammed Begaly on 31.10.2024.
//

import UIKit
import SnapKit
class HomePageView: UIView {

    private lazy var iconApp: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .icon1

        return imageView
    }()

    private lazy var labelApp: UILabel = {
        let label = UILabel()
        label.text = "Dooit"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        label.textColor = .black

        return label
    }()

    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(.icon2, for: .normal)

        return button
    }()

    private lazy var changerBetweenList: UISegmentedControl =  {
        let segmentedController = UISegmentedControl(items: ["All List", "Pinned"])
        segmentedController.selectedSegmentIndex = 0
        segmentedController.selectedSegmentTintColor = .black
        segmentedController.setTitleTextAttributes([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)
        segmentedController.setTitleTextAttributes([.foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .normal)

        return segmentedController
    }()

    private lazy var defaultImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .image1

        return imageView
    }()

    private lazy var defaultLabel: UILabel = {
        let label = UILabel()
        label.text = "Create your first to-do list..."
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black

        return label
    }()

//    private lazy var createListButton: UIButton = {
//        let button = UIButton()
//        button.setTitle(" New List", for: .normal)
//        button.setImage(.icon3, for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        button.backgroundColor = .black
//        button.titleLabel?.textColor = .white
//        button.layer.cornerRadius = 9
//
//        return button
//    }()

    private lazy var createButton: UIButton = {
        let button = CustomButtons(frame: CGRect(x: 0, y: 0, width: 125, height: 45))
        button.configure(with: IconTextViewModel(text: "New List", image: UIImage(named: "icon3"), backgroundColor: .black))
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        constraints()

    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonPressed() {
        print("Hello")
    }
    private func setupUI() {
        backgroundColor = .white
        addSubview(labelApp)
        addSubview(searchButton)
        addSubview(iconApp)
        addSubview(changerBetweenList)
        addSubview(defaultImage)
        addSubview(defaultLabel)
        addSubview(createButton)
    }

    private func constraints() {
        iconApp.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(79)
            make.left.equalToSuperview().offset(24)
        }
        labelApp.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.left.equalTo(iconApp.snp.right).offset(15)
        }
        searchButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(79)
            make.right.equalToSuperview().inset(21)
        }
        changerBetweenList.snp.makeConstraints { make in
            make.top.equalTo(labelApp.snp.bottom).offset(41)
            make.right.left.equalToSuperview().offset(24).inset(24)
            make.height.equalTo(47)
        }
        defaultImage.snp.makeConstraints { make in
            make.top.equalTo(changerBetweenList.snp.bottom).offset(150)
            make.right.left.equalToSuperview()
        }
        defaultLabel.snp.makeConstraints { make in
            make.top.equalTo(defaultImage.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }
        createButton.snp.makeConstraints { make in
            make.top.equalTo(defaultLabel.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
            make.height.equalTo(45)
            make.width.equalTo(125)
        }

    }
}
