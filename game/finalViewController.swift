//
//  finalViewController.swift
//  game
//
//  Created by Jayne Williams on 8/30/16.
//  Copyright © 2016 Megan Williams. All rights reserved.
//

import UIKit
import AVFoundation


class AlertView2: NSObject {
    
    class func showAlert(view: UIViewController){
        
        let alert = UIAlertController(title: "Oh no!", message: "The cure did not come out right. Let's try again", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: nil))
        dispatch_async(dispatch_get_main_queue(), {
            view.presentViewController(alert, animated: true, completion: nil)
        })
    }
}

class finalViewController: UIViewController {

    // label for instructions
    @IBOutlet weak var instructions: UILabel!
    
    // sliders
    @IBOutlet weak var red: UISlider!
    @IBOutlet weak var yellow: UISlider!
    @IBOutlet weak var green: UISlider!
    @IBOutlet weak var blue: UISlider!
    
    // text display for numbers
    @IBOutlet weak var red_display: UILabel!
    @IBOutlet weak var yellow_display: UILabel!
    @IBOutlet weak var green_display: UILabel!
    @IBOutlet weak var blue_display: UILabel!
    
    // values
    
    // music
    var music3:AVAudioPlayer!
    
    //alerts for correct and incorrect answers
    let alert:UIAlertController = UIAlertController(title: "Mission accomplished!", message: "You've successfully made the cure!", preferredStyle: UIAlertControllerStyle.Alert)
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // music 
        let path = NSBundle.mainBundle().pathForResource("TheBuilder.mp3", ofType: nil)
        let url = NSURL(fileURLWithPath: path!)
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            music3 = sound
            music3.numberOfLoops = -1
            sound.play()
        } catch {
            // couldn't load sound, so do nothing
        }

        // set the text for the cure instructions
        instructions.text = "\u{2022} The total volume is 200 units.\n\n\u{2022} The amount of blue solution needed is twice that of the red.\n\n\u{2022} The amount of green solution is one sixth that of the yellow.\n\n\u{2022} Green and red volumes must be equal."
        
        // make sliders increment by 20
        red.addTarget(self, action: #selector(finalViewController.valueChangedRed), forControlEvents: UIControlEvents.ValueChanged)
        yellow.addTarget(self, action: #selector(finalViewController.valueChangedYellow), forControlEvents: UIControlEvents.ValueChanged)
        green.addTarget(self, action: #selector(finalViewController.valueChangedGreen), forControlEvents: UIControlEvents.ValueChanged)
        blue.addTarget(self, action: #selector(finalViewController.valueChangedBlue), forControlEvents: UIControlEvents.ValueChanged)
        
        // initial values of sliders
        red_display.text = "100"
        yellow_display.text = "100"
        green_display.text = "100"
        blue_display.text = "100"
        
        // handle alerts
        alert.addAction(UIAlertAction(title: "Continue", style: .Default, handler: { action in
                self.loadFinalScene()
            }))
        
     
        
    }
    
    func loadFinalScene() {
        if music3 != nil {
            music3.stop()
            music3 = nil
        }
        let final: SecondViewController = storyboard?.instantiateViewControllerWithIdentifier("first") as! SecondViewController
        final.level = 21
        self.presentViewController(final, animated: false, completion: nil)
        
    }
    
    func dismissAlert() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // values of the sliders
    var value_red: Int = 100
    var value_yellow: Int = 100
    var value_green: Int = 100
    var value_blue: Int = 100
    
    func valueChangedRed() {
        value_red = Int(red.value / 10) * 10
        let val: Float = Float(value_red)
        red.setValue(val, animated: false)
        red_display.text = String(value_red)
    }

    func valueChangedYellow() {
        value_yellow = Int(yellow.value / 10) * 10
        let val: Float = Float(value_yellow)
        yellow.setValue(val, animated: false)
        yellow_display.text = String(value_yellow)
    }
    
    func valueChangedGreen() {
        value_green = Int(green.value / 10) * 10
        let val: Float = Float(value_green)
        green.setValue(val, animated: false)
        green_display.text = String(value_green)
    }
    
    func valueChangedBlue() {
        value_blue = Int(blue.value / 10) * 10
        let val: Float = Float(value_blue)
        blue.setValue(val, animated: false)
        blue_display.text = String(value_blue)
    }
    
    // for muting the music
    @IBOutlet weak var mute_btn: UIButton!
    var mute: Bool = false
    
    @IBAction func clickedButton(sender: AnyObject) {
        if mute {
            if music3 != nil {
                music3.play()
            }
            self.mute_btn.setImage(UIImage(named: "mute"), forState: .Normal)
            mute = false
        }
        else {
            if music3 != nil {
                music3.pause()
            }
            self.mute_btn.setImage(UIImage(named: "unmute"), forState: .Normal)
            mute = true
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submittedAnswer(sender: AnyObject) {
        if value_red == 20 && value_yellow == 120 && value_green == 20 && value_blue == 40 {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            // wrong
            //self.presentViewController(alert2, animated: true, completion: nil)
            AlertView2.showAlert(self)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
