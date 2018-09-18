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
    
    class func createModule() -> UINavigationController {
        
        //TODO: Handle the optional 'view'
        let view = mainstoryboard.instantiateViewController(withIdentifier: "SCViewController") as? SCViewController
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = SCPresenter()
        let interactor: PresentorToInterectorProtocol = SCInteractor()
        let router: PresenterToRouterProtocol = SCRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interector = interactor
        interactor.presenter = presenter
        
        let SCNavigationController = UINavigationController(rootViewController: view!)
        SCNavigationController.navigationBar.barTintColor = UIColor(red: 105/255, green: 62/255, blue: 203/255, alpha: 0.0)
        SCNavigationController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        return SCNavigationController
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
