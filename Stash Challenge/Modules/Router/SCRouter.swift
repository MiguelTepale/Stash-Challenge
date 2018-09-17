//
//  SCRouter.swift
//  Stash Challenge
//
//  Created by Miguel Tepale on 9/15/18.
//  Copyright © 2018 Miguel Tepale. All rights reserved.
//

import Foundation
import UIKit

class SCRouter: PresenterToRouterProtocol {
    
    class func createModule() -> UIViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "SCViewController") as? SCViewController
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = SCPresenter()
        let interactor: PresentorToInterectorProtocol = SCInteractor()
        let router: PresenterToRouterProtocol = SCRouter()
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interector = interactor
        interactor.presenter = presenter
        
        return view!
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
