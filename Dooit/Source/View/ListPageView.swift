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

    private var tasks: [String] = [""]

    private var checker = false

    var onSaveButtonTapped: (() -> Void)?

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

    public func addNavBarButton(to navigationItem: UINavigationItem, title: String) {
        let navBarButton = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(saveAction))
        navigationItem.rightBarButtonItem = navBarButton
    }

    public func configurePage(data: TaskList?, isAbleToEdit: Bool) {
            currentTask = data
            self.titleLabel.text = currentTask?.title ?? "Title"
            self.tasks = currentTask?.desc ?? [""]
            checker = isAbleToEdit
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func saveAction() {
        onSaveButtonTapped?()
        if !checker {
            CoreDataManager.shared.saveData(currentTitleList: self.titleLabel.text ?? "New note", desc: self.tasks)
            checker = true
        } else {
            CoreDataManager.shared.updateData(NewTitleList: self.titleLabel.text ?? "", desc: self.tasks, currentList: currentTask)
        }
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


extension ListPageView: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = tasks
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
        cell.selectionStyle = .none
        if indexPath.row < tasks.count  {
            cell.configure(text: model[indexPath.row])
        } else {
            cell.configure(text: "")
        }
        cell.noteLabel.delegate = self
        cell.noteLabel.tag = indexPath.row
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            let rowIndex = textField.tag
            // Update the note in the model
            tasks[rowIndex] = textField.text ?? ""
            print(tasks[rowIndex])
            // Add a new empty note and reload table view
            tasks.insert("", at: rowIndex + 1)
            tableView.reloadData()

            // Move focus to the new row
            let nextIndexPath = IndexPath(row: tasks.count + 1, section: 0)
            if let cell = tableView.cellForRow(at: nextIndexPath) as? ListTableViewCell {
                cell.noteLabel.becomeFirstResponder()
            }

            textField.resignFirstResponder() // Dismiss keyboard
            return true
        } else {
            return false
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            tableView.reloadData()
        }
    }
}
