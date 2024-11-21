//
//  HomeTableViewCell.swift
//  Dooit
//
//  Created by Dinmukhammed Begaly on 12.11.2024.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {

    private lazy var listTitle: UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 20, weight: .medium)
        title.textColor = .black
        title.textAlignment = .left

        return title
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(nameTitle: String) {
        listTitle.text = nameTitle
    }
    func setupUI() {
        contentView.addSubview(listTitle)
        contentView.backgroundColor = UIColor(named: "colorCell")
        contentView.layer.cornerRadius = 16
    }

    func constraints() {
        listTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.left.equalToSuperview().offset(22)
        }
    }
}
