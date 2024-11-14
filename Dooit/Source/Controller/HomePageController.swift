//
//  ViewController.swift
//  Dooit
//
//  Created by Dinmukhammed Begaly on 31.10.2024.
//

import UIKit

class HomePageController: UIViewController {

    var homePageView = HomePageView()

    override func loadView() {
        view = homePageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homePageView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    public func updateData() {
        
    }
}

extension HomePageController: MainViewDelegate {
    func greeting() {
        let vc = ListPageController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

