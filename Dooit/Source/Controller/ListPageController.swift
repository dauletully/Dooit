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
    public var ListInfo: TaskList?

    override func loadView() {
        view = listPageView

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
