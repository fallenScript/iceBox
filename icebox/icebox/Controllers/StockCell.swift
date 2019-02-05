//
//  StockCellViewController.swift
//  icebox
//
//  Created by Jesús Tirado on 1/25/19.
//  Copyright © 2019 com.tiradoJ. All rights reserved.
//

import UIKit

class StockCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var changeView: UIView!
    @IBOutlet weak var tempLabel: UILabel!
    
    var stock: StockTable? {
        didSet {
            if let stock = stock {
                nameLabel.text = stock.name
                timeLabel.text = "\(stock.time)"
                tempLabel.text = "\(stock.temp)"
                changeView.backgroundColor = stock.temp.first == "-"
                    ? UIColor.cyan.withAlphaComponent(0.7)
                    : UIColor.red
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        changeView.layer.cornerRadius = 6
    }
}
