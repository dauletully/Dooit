//
//  ListPageView.swift
//  Dooit
//
//  Created by Dinmukhammed Begaly on 05.11.2024.
//

import UIKit
import SnapKit

class ListPageView: UIView {

    private var currentTask: TaskList?

    private lazy var titleLabel: UITextField = {
        let textField = UITextField()
        textField.text = "Title"
        textField.font = .systemFont(ofSize: 24, weight: .semibold)

        return textField
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "listCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(titleLabel)
        addSubview(tableView)
    }

    private func constraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(130)
            make.left.right.equalToSuperview().offset(24).inset(24)
            make.height.equalTo(31)

        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(18)
            make.bottom.equalToSuperview().inset(158)
            make.left.right.equalToSuperview().offset(24).inset(24)
        }
    }
}

extension ListPageView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentTask?.desc?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = currentTask?.desc
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        cell.configure(text: model?[indexPath.row] ?? "")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45    }


}
