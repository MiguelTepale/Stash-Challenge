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
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var topLeftLabel: UILabel!
    @IBOutlet weak var topRightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
    }

}

extension SCViewController: PresenterToViewProtocol {
    
    func displayAchievements(achievements: SCEntity) {
        title = achievements.title
        topLeftLabel.text = String(achievements.rank[0].progress) + "pts"
        topRightLabel.text = String(achievements.rank[0].total) + "pts"
    }
    
    func showError() {
        print("Achievements cannot be displayed")
    }
    
}
