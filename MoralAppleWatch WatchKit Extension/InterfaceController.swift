//
//  InterfaceController.swift
//  MoralAppleWatch WatchKit Extension
//
//  Created by Moral on 22/11/14.
//  Copyright (c) 2014 Moral. All rights reserved.
//

import WatchKit
import Foundation

class MoodContextData {

    let moodIndex : Int
    
    init(moodIndex: Int){
        self.moodIndex = moodIndex
    }
}

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var moodImage: WKInterfaceImage!
    var currentMood : Int = 0
    override init(context: AnyObject?) {
        // Initialize variables here.
        super.init(context: context)
        
        // Configure interface objects here.
        NSLog("%@ init", self)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }

    func moodSliderChanged(value: Float) {
        
        currentMood = Int(value)
        println("Current mood : \(currentMood)")
        
        updateMoodImage()
    }
    
    
    /*@IBAction func recordMood() {
        /*pushControllerWithName("MoodDetailsController", context: MoodContextData(moodIndex: currentMood))
        */

    }*/
    
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {

        if segueIdentifier == "RecordMoodSegue" {
            println("Llamo")
            return MoodContextData(moodIndex: currentMood)
        }
        
        return nil
    }
    
    func updateMoodImage(){
    
        if currentMood < 0 || currentMood > 4 {
            return
        }
        
        moodImage.setImageNamed("rage\(currentMood)")
    }
}
