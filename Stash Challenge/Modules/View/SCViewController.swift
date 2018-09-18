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
    
    @IBOutlet weak var topCircleView: UIView!
    @IBOutlet weak var topLevelNumberLabel: UILabel!
    @IBOutlet weak var topGreyView: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var topLeftLabel: UILabel!
    @IBOutlet weak var topRightLabel: UILabel!
    
    @IBOutlet weak var middleCircleView: UIView!
    @IBOutlet weak var middleLevelNumberLabel: UILabel!
    @IBOutlet weak var middleGreyView: UIView!
    @IBOutlet weak var middleImageView: UIImageView!
    @IBOutlet weak var middleLeftLabel: UILabel!
    @IBOutlet weak var middleRightLabel: UILabel!
    
    @IBOutlet weak var bottomCircleView: UIView!
    @IBOutlet weak var bottomLevelNumberLabel: UILabel!
    @IBOutlet weak var bottomGreyView: UIView!
    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var bottomLeftLabel: UILabel!
    @IBOutlet weak var bottomRightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        
        configureViews()
    }
    
    func configureViews() {
        
        topCircleView.layer.cornerRadius = topCircleView.frame.height/2
        topCircleView.clipsToBounds = true
        
        middleCircleView.layer.cornerRadius = middleCircleView.frame.height/2
        middleCircleView.clipsToBounds = true
        
        bottomCircleView.layer.cornerRadius = bottomCircleView.frame.height/2
        bottomCircleView.clipsToBounds = true
        
        topImageView.layer.cornerRadius = 8.0
        topImageView.clipsToBounds = true
        
        middleImageView.layer.cornerRadius = 8.0
        middleImageView.clipsToBounds = true
        
        bottomImageView.layer.cornerRadius = 8.0
        bottomImageView.clipsToBounds = true
        
    }

}

extension SCViewController: PresenterToViewProtocol {
    
    func displayUserAchievements(user: SCEntity) {
        
        title = user.title
        
        if user.achievements[0].isAccessible {
            topGreyView.isHidden = true
            topImageView.image = user.achievements[0].image
            topLevelNumberLabel.text = user.achievements[0].level
            topLeftLabel.text = String(user.achievements[0].progress) + "pts"
            topRightLabel.text = String(user.achievements[0].total) + "pts"
            
        } else {
            topImageView.image = user.achievements[0].image
            topLevelNumberLabel.text = user.achievements[0].level
            topLeftLabel.text = "0" + "pts"
            topRightLabel.text = "0" + "pts"
        }
        
        if user.achievements[1].isAccessible {
            middleGreyView.isHidden = true
            middleImageView.image = user.achievements[1].image
            middleLevelNumberLabel.text = user.achievements[1].level
            middleLeftLabel.text = String(user.achievements[1].progress) + "pts"
            middleRightLabel.text = String(user.achievements[1].total) + "pts"
        } else {
            middleImageView.image = user.achievements[1].image
            middleLevelNumberLabel.text = user.achievements[1].level
            middleLeftLabel.text = String(user.achievements[1].progress) + "pts"
            middleRightLabel.text = String(user.achievements[1].total) + "pts"
        }
        
        if user.achievements[2].isAccessible {
            bottomGreyView.isHidden = true
            bottomImageView.image = user.achievements[2].image
            bottomLevelNumberLabel.text = user.achievements[2].level
            bottomLeftLabel.text = String(user.achievements[2].progress) + "pts"
            bottomRightLabel.text = String(user.achievements[2].total) + "pts"
        } else {
            bottomImageView.image = user.achievements[2].image
            bottomLevelNumberLabel.text = user.achievements[2].level
            bottomLeftLabel.text = String(user.achievements[2].progress) + "pts"
            bottomRightLabel.text = String(user.achievements[2].total) + "pts"
        }
        
    }
    
    func displayError() {
        print("Achievements cannot be displayed")
    }
    
}
