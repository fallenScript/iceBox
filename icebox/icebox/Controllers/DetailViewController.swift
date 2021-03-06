//
//  DetailViewController.swift
//  icebox
//
//  Created by Jesús Tirado on 1/19/19.
//  Copyright © 2019 com.tiradoJ. All rights reserved.
//

import UIKit
import Charts

class DetailViewController: UIViewController {
    @IBOutlet weak var lineChart: LineChartView!
    @IBOutlet weak var statusView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusView.layer.cornerRadius = 10
        setChartValues()
        
        let maximumTemp = ChartLimitLine(limit: -63, label: "Maximum temp")
        maximumTemp.lineWidth = 4
        maximumTemp.lineDashLengths = [5, 5]
        maximumTemp.labelPosition = .rightTop
        maximumTemp.valueFont = .systemFont(ofSize: 16)
        maximumTemp.valueTextColor = .black
       
        
        let minimumTemp = ChartLimitLine(limit: -80, label: "Minimum tem")
        minimumTemp.lineWidth = 4
        minimumTemp.lineDashLengths = [5,5]
        minimumTemp.labelPosition = .rightBottom
        minimumTemp.valueFont = .systemFont(ofSize: 16)
        minimumTemp.valueTextColor = .black
        minimumTemp.lineColor = .black
        
        let leftAxis = lineChart.leftAxis
        //leftAxis.removeAllLimitLines()
        leftAxis.addLimitLine(maximumTemp)
        leftAxis.addLimitLine(minimumTemp)
        
        lineChart.animate(xAxisDuration: 0.5)
        // Do any additional setup after loading the view.
    }
    
    func setChartValues(_ count: Int = 30) {
        let temperatures =
            [-68,-69,-68,-70,-66,-67,-68,-69,-73,-78,-70,-68,-66,-80,-66,-65,-64,-63]
        
        //        let values = temperatures.map { (i) -> ChartDataEntry in
        //            let dataTemp = Double(temperatures[i])
        //            return ChartDataEntry(x: Double(i), y: dataTemp)
        //        }

        
        let values = (0..<temperatures.count).map { (i) -> ChartDataEntry in
            let val = Double(temperatures[i])
            return ChartDataEntry(x: Double(i), y: val)
        }
        
        let gradientColors = [ChartColorTemplates.colorFromString("#55ff0000").cgColor,
                             ChartColorTemplates.colorFromString("#00ff0000").cgColor]

        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
        
        let set1 = LineChartDataSet(values: values, label: "Temperatures")
        set1.fillAlpha = 1
        set1.fill = Fill(linearGradient: gradient, angle: 90)
        set1.drawFilledEnabled = true
        set1.setColor(.red)
        set1.setCircleColor(.red)
        set1.lineWidth = 0.5
        set1.circleRadius = 3
        let data = LineChartData(dataSet: set1)
        
        self.lineChart.data = data
    }

}
