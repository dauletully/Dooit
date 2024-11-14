//
//  CustomCheckTaskButton.swift
//  Dooit
//
//  Created by Dinmukhammed Begaly on 05.11.2024.
//

import UIKit

class CustomCheckTaskButton: UIButton {

    private let checkMarkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .unChecked
        
        return imageView
    }()
}
