//
//  CustomButton.swift
//  Dooit
//
//  Created by Dinmukhammed Begaly on 04.11.2024.
//

import UIKit

struct IconTextViewModel {
    let text: String
    let image: UIImage?
    let backgroundColor: UIColor?
}

final class CustomButtons: UIButton {
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)

        return label
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(iconImageView)
        clipsToBounds = true
        layer.cornerRadius = 9
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: IconTextViewModel) {
        iconImageView.image = viewModel.image
        label.text = viewModel.text
        backgroundColor = viewModel.backgroundColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.sizeToFit()
        let iconSize: CGFloat = 15
        let iconX: CGFloat = (frame.size.width - label.frame.size.width - iconSize - 8) / 2
        iconImageView.frame = CGRect(x: iconX, y: (frame.size.height - iconSize) / 2, width: iconSize, height: iconSize)
        label.frame = CGRect(x: iconX + iconSize + 8, y: 0, width: label.frame.size.width, height: frame.size.height)
    }
}
