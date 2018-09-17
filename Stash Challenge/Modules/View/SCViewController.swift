//
//  ViewController.swift
//  Stash Challenge
//
//  Created by Miguel Tepale on 9/14/18.
//  Copyright © 2018 Miguel Tepale. All rights reserved.
//

import UIKit

class SCViewController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?
    
    @IBOutlet weak var answersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
    }

}

extension SCViewController: PresenterToViewProtocol {
    
    func displayAchievements(achievements: SCEntity) {
        title = achievements.title
    }
    
    func showError() {
        print("Achievements cannot be displayed")
    }
    
}
