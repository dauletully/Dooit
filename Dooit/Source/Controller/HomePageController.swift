//
//  ViewController.swift
//  Dooit
//
//  Created by Dinmukhammed Begaly on 31.10.2024.
//

import UIKit

class HomePageController: UIViewController {

    var homePageView = HomePageView()


    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.homePageView.reloadData()
        }
        homePageView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        view = homePageView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.homePageView.reloadData()
        }
    }
}

extension HomePageController: MainViewDelegate {
    func taskGreeting(note: TaskList) {
        let vc = ListPageController()
        vc.listInfo = note
        navigationController?.pushViewController(vc, animated: true)
        vc.created = true
    }
    
    func greeting() {
        let vc = ListPageController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

