//
//  SCPresenter.swift
//  Stash Challenge
//
//  Created by Miguel Tepale on 9/16/18.
//  Copyright © 2018 Miguel Tepale. All rights reserved.
//

import Foundation

class SCPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interector: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interector?.fetchAchievements()
    }
    
}

extension SCPresenter: InterectorToPresenterProtocol {
    
    func userAchievementsFetched(achievements: SCEntity) {
        view?.displayUserAchievements(user: achievements)
    }
    
    func userAchievementsFetchedFailed() {
        print("Fetching of achievements failed")
    }
    
}
