//
//  ListController.swift
//  Dooit
//
//  Created by Dinmukhammed Begaly on 04.11.2024.
//

import UIKit

class ListPageController: UIViewController {

    
    private let listPageView = ListPageView()
    private let homeController = HomePageController()
    public var listInfo: TaskList?
    public var created = false

    override func loadView() {
        view = listPageView

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        listPageView.addNavBarButton(to: self.navigationItem, title: "save")
        listPageView.onSaveButtonTapped = {[weak self] in
            self?.handleSaveButtonTapped()
        }
        setup()

    }
    private func handleSaveButtonTapped() {
            print("Save button tapped!")
        }
    private func setup() {
        listPageView.configurePage(data: listInfo, isAbleToEdit: created)
    }
}
