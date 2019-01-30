//
//  HomeModel.swift
//  icebox
//
//  Created by Jesús Tirado on 1/18/19.
//  Copyright © 2019 com.tiradoJ. All rights reserved.
//

import UIKit

protocol HomeModelProtocol: class {
    func itemsDownloaded(items: NSArray)
}

class HomeModel: NSObject {

    //properties
    
    weak var delegate: HomeModelProtocol!
    
    let urlPath = "http://mirandaromo.com/service.php"
 
    func downloadItems() {
        
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(data!)
            }
            
        }
        
        task.resume()
    }

    func parseJSON(_ data:Data) {
        
        var jsonResult = NSArray()
        
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0 ..< jsonResult.count
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let location = FreezerModel()
            
            if let name = jsonElement["name"] as? String,
                let temp = jsonElement["temp"] as? String,
                let date = jsonElement["date"] as? String,
                let time = jsonElement["time"] as? String
            {
                
                location.name = name
                location.temp = temp
                location.date = date
                location.time = time
                
            }
            
            locations.add(location)
            
        }
        
        DispatchQueue.main.async(execute: { () -> Void in
            
            self.delegate.itemsDownloaded(items: locations)
            
        })
    }

}
