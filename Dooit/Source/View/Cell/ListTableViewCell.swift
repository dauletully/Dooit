//
//  ListTableViewCell.swift
//  Dooit
//
//  Created by Dinmukhammed Begaly on 06.11.2024.
//

import UIKit
import SnapKit


class ListTableViewCell: UITableViewCell {

    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(.unChecked, for: .normal)
        button.addTarget(self, action: #selector(check), for: .touchUpInside)

        return button
    }()

    public lazy var noteLabel: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Write here"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.isUserInteractionEnabled = true

        return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        constraints()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func check(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "unChecked") && noteLabel.text != ""{
            checkButton.setImage(.checked, for: .normal)
            updateCompletedStyleText(isComleted: true)
        } else {
            checkButton.setImage(.unChecked, for: .normal)
            updateCompletedStyleText(isComleted: false)
        }
    }

    private func updateCompletedStyleText(isComleted: Bool) {
        let text = noteLabel.text ?? ""
        if isComleted {
            let attributedText = NSAttributedString(
                            string: text,
                            attributes: [
                                .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                                .foregroundColor: UIColor.gray
                            ]
                        )
                        noteLabel.attributedText = attributedText
                        noteLabel.isUserInteractionEnabled = false // disable editing when completed
        } else {
            let attributedText = NSAttributedString(
                            string: text,
                            attributes: [
                                .strikethroughStyle: [],
                                .foregroundColor: UIColor.black
                            ]
                        )
                        noteLabel.attributedText = attributedText
                        noteLabel.isUserInteractionEnabled = true // enable editing when not completed
        }
    }

    private func setupUI() {
        contentView.addSubview(checkButton)
        contentView.addSubview(noteLabel)
    }

    private func constraints() {
        checkButton.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.centerY.equalToSuperview()
        }
        noteLabel.snp.makeConstraints { make in
            make.left.equalTo(checkButton.snp.right).offset(5)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(text: String) {
        if text.isEmpty {
            self.noteLabel.placeholder = "Write here"
        } else {
            self.noteLabel.text = text
        }
    }

}
