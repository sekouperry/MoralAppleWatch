//
//  MoodDetailsController.swift
//  MoralAppleWatch
//
//  Created by Moral on 27/11/14.
//  Copyright (c) 2014 Moral. All rights reserved.
//

import Foundation
import WatchKit

class MoodDetailsController: WKInterfaceController {

    //  Helper properties
    let moodNames = ["Ok", "Not bad", "Hmmm", "Anger", "RAWR"]
    var currentMood = 0
    
    @IBOutlet weak var moodAdviceLabel: WKInterfaceLabel!
    @IBOutlet weak var moodImage: WKInterfaceImage!
    @IBOutlet weak var moodNameLabel: WKInterfaceLabel!
    @IBOutlet weak var moodDescriptionLabel: WKInterfaceLabel!
    
    override init(context: AnyObject?){
        super.init(context: context)
        
        if let moodContextData = context as? MoodContextData {
            currentMood = moodContextData.moodIndex
        }
        
    }
    
    override func willActivate() {
        super.willActivate()
        
        moodImage.setImageNamed("rage\(currentMood)")
        let moodName = moodNames[currentMood]
        moodNameLabel.setText(moodName)
        moodDescriptionLabel.setText("You're feeling so \(moodName), eh?")
        
        
    }
}
