//
//  ViewController.swift
//  Clock App
//
//  Created by Pratama Nur Wiaya on 10/31/16.
//  Copyright © 2016 PratamaLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clockLabel.text = ""
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    }
    
    // update clock
    func updateClock()  {
        let currentDate: NSDate = NSDate()
        let calendar = NSCalendar.current
        
        let components = calendar.dateComponents([.hour, .minute, .second], from: currentDate as Date)
        
        let hour: Int = components.hour! > 12 ? components.hour! - 12 : components.hour!
    
        let hourString: String = hour > 9 ? "\(hour)" : "0\(hour)"
        
        let minutes = components.minute! > 9 ? "\(components.minute!)" : "0\(components.minute!)"
        
        let seconds = components.second! > 9 ? "\(components.second!)" : "0\(components.second!)"
        
        let am  = components.hour! > 12 ? "PM" : "AM"
        
        let timeString = "\(hourString):\(minutes):\(seconds) \(am)"
        
        clockLabel.text = timeString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

