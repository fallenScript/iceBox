//
//  LocationModel.swift
//  icebox
//
//  Created by Jesús Tirado on 1/18/19.
//  Copyright © 2019 com.tiradoJ. All rights reserved.
//

import UIKit

class FreezerModel: NSObject {

    //properties
    
    var name: String?
    var temp: String?
    var date: String?
    var time: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //contructor 
    init(name: String, temp: String, date: String, time: String) {
        
        self.name = name
        self.temp = temp
        self.date = date
        self.time = time
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "Name: \(String(describing: name)), temp: \(String(describing: temp)), date: \(String(describing: date)), time: \(String(describing: time))"
        
    }
    
}
