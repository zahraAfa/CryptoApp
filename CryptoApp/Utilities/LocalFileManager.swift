//
//  LocalFileManager.swift
//  CryptoApp
//
//  Created by Anisa Fatimah Azzahra on 27/12/23.
//

import Foundation
import SwiftUI

class LocalFileManager{
    static let shared = LocalFileManager()
    private init(){}
    
    func saveImage(image: UIImage, imageName: String, folderName: String){
        
//        Create folder
        createNewFolderIfNeeded(folderName: folderName)
        
//        get image path url
        guard
            let data = image.pngData(),
            let url = getImageURL(imageName: imageName, folderName: folderName) else {
            
            return
        }
        
//        Save image to path
        do {
            try data.write(to: url)
        } catch let error {
            print("Failed to save the image. Image name: \(imageName). \(error)")
        }
    }
    
    func getImage(imageName: String, folderName: String)-> UIImage?{
        guard let url =
                getImageURL(imageName: imageName, folderName: folderName),
              FileManager.default.fileExists(atPath: url.path)
        else { return nil }
        
        return UIImage(contentsOfFile: url.path)
    }
    
    private func createNewFolderIfNeeded(folderName:String){
        guard let url = getFolderURL(folderName: folderName) else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: url.path){
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: false)
            } catch let error {
                print("Error creating new directory. Folder name: \(folderName). \(error)")
            }
        }
    }
    
    private func getFolderURL(folderName: String)-> URL?{
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        else {
            return nil
        }
        
        return url.appendingPathComponent(folderName)
    }
    
    private func getImageURL(imageName: String, folderName:String)-> URL?{
        guard let folderUrl = getFolderURL(folderName: folderName) else{
            return nil
        }
        
        return folderUrl.appendingPathComponent(imageName, conformingTo: .png)
    }
}
