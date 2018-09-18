//
//  SCInteractor.swift
//  Stash Challenge
//
//  Created by Miguel Tepale on 9/15/18.
//  Copyright © 2018 Miguel Tepale. All rights reserved.
//

import Foundation
import UIKit

class SCInteractor: PresentorToInterectorProtocol {

    var presenter: InterectorToPresenterProtocol?
    
    func fetchAchievements() {
        
        guard let filePath = Bundle.main.url(forResource: "achievements", withExtension: "json") else {
            print("File path cannot be found")
            return
        }
        do {
            let data = try Data(contentsOf: filePath, options: [])
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            guard let jsonDictionary = json as? [String:Any] else {return}
            let entity = SCEntity(with: jsonDictionary)
            fetchThumbNails(with: entity)
        }
        catch {
            print("Something went wrong with fetching 'achievement.json'")
            presenter?.userAchievementsFetchedFailed()
        }
    }
    
    func fetchThumbNails(with entity: SCEntity) {
        
        for achievement in entity.achievements {
            let url = URL(string: achievement.bgImageUrl)
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                guard let downloadedData = data, error == nil else { return }
                DispatchQueue.main.async {
                    achievement.image = UIImage(data: downloadedData)
                    self.verifyDownloadedImages(with: entity)
                }
            }
            task.resume()
        }
        
    }
    
    func verifyDownloadedImages(with entity: SCEntity) {
        if allImagesDownloaded(with: entity) {
            DispatchQueue.main.async {
                self.presenter?.userAchievementsFetched(achievements: entity)
            }
        }
    }
    
    func allImagesDownloaded(with entity: SCEntity) -> Bool {
        let pendingImages = entity.achievements.filter{$0.image == nil}
        return (pendingImages.isEmpty ? true : false)
    }
    
}
