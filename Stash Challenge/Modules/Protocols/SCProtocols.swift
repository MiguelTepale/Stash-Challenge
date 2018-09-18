//
//  SCProtocols.swift
//  Stash Challenge
//
//  Created by Miguel Tepale on 9/15/18.
//  Copyright © 2018 Miguel Tepale. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToViewProtocol: class {
    func displayUserAchievements(user: SCEntity)
    func displayError()
}

protocol InterectorToPresenterProtocol: class {
    func userAchievementsFetched(achievements: SCEntity)
    func userAchievementsFetchedFailed()
}

protocol PresentorToInterectorProtocol: class {
    var presenter: InterectorToPresenterProtocol? {get set}
    func fetchAchievements()
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interector: PresentorToInterectorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UINavigationController
}
