//
//  CreditsViewController.swift
//  game
//
//  Created by Megan Williams on 8/27/16.
//  Copyright © 2016 Megan Williams. All rights reserved.
//

import UIKit
import AVFoundation

class CreditsViewController: UIViewController {
    
    
    @IBOutlet weak var screen: UITextView!
    
    @IBOutlet weak var test: UITextView!
    
    var len:Int = 0
    var len2: Int = 0
    var counter:Int = 0
    var timer = NSTimer()
    var string: NSAttributedString = NSAttributedString()
    var s: String = ""
    // music
    var music1: AVAudioPlayer!
    
    func print_text() {
        let new_string:NSMutableAttributedString = NSMutableAttributedString(attributedString: string.attributedSubstringFromRange(NSMakeRange(0, counter)))
        new_string.appendAttributedString(NSAttributedString(string: "\n"))
        screen.scrollEnabled = false
        screen.attributedText = new_string
        
        screen.scrollEnabled = true
        //screen.scrollRangeToVisible(NSMakeRange(counter-1, 1))
        //let ind = s.startIndex.advancedBy(counter)
        //if  self.screen.contentSize.height  + screen.contentOffset.y > screen.frame.height {
           // self.screen.setContentOffset(CGPointMake(0, self.screen.contentSize.height - self.screen.frame.size.height), animated: false)
        //}
        
        //screen.text = s.substringToIndex(ind)
        
            screen.setContentOffset(CGPoint(x: 0, y: screen.contentOffset.y + 2), animated: false)
        
        
        counter = counter + 1
        if counter > len {
            timer.invalidate()
        }
    }
    
    
    /*
    
    func textViewDidChange(textView: UITextView) {
        if screen.contentSize.height > screen.bounds.size.height {
            screen.setContentOffset(CGPoint(x: 0, y: screen.contentSize.height - screen.bounds.height), animated: false)
        }
    }
    */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        // load the music
        // play the music
        let path = NSBundle.mainBundle().pathForResource("TheBuilder.mp3", ofType: nil)
        let url = NSURL(fileURLWithPath: path!)
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            music1 = sound
            music1.numberOfLoops = -1
            sound.play()
        } catch {
            // couldn't load sound, so do nothing
        }
        // load the question
        
        // Display the credits
        let text = "Credits:\n\nHead Programmer:\nMegan Williams\n\nContent Creator:\nStephanie Williams\n\nGraphic Designer:\nAlicia Williams\n\n\nMusic:\n\n"
        let music = "Hidden Agenda Kevin MacLeod (incompetech.com)\nLicensed under Creative Commons: By Attribution 3.0 License\nhttp://creativecommons.org/licenses/by/3.0/\n\nPhantom from Space Kevin MacLeod (incompetech.com)\nLicensed under Creative Commons: By Attribution 3.0 License\nhttp://creativecommons.org/licenses/by/3.0/\n\nThe Builder Kevin MacLeod (incompetech.com)\nLicensed under Creative Commons: By Attribution 3.0 License\nhttp://creativecommons.org/licenses/by/3.0/\n"
        len = text.characters.count + music.characters.count
        //s = text + music
        //test.text = s
        //screen.textColor = UIColor.whiteColor()
        
        // fonts
        let font:UIFont? = UIFont(name: "Menlo", size:27)
        let font2:UIFont? = UIFont(name: "Menlo", size:20)
        let font3:UIFont? = UIFont(name: "Menlo", size:15)
        
        // specify font and size
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: text)
        attString.addAttribute(NSFontAttributeName, value: font2!, range: NSMakeRange(0, attString.length))
        attString.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, 9))
        
        let attString2:NSMutableAttributedString = NSMutableAttributedString(string: music)
        attString2.addAttribute(NSFontAttributeName, value: font3!, range: NSMakeRange(0, attString2.length))
        
        attString.appendAttributedString(attString2)
        attString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 0, green: 1, blue: 0.5, alpha: 1), range: NSMakeRange(0, len))
        
        // center text
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
        attString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, len))
        
        len2 = attString.length + 50
        
        string = attString
        //counter = 1
        timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: #selector(CreditsViewController.print_text), userInfo: nil, repeats: true)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreditsViewController.dismissCredits))
        self.view.addGestureRecognizer(tap)
        
        
    }
    
    func dismissCredits() {
        if !timer.valid {
            music1.stop()
            let loadScreen: InitialViewController = storyboard?.instantiateInitialViewController() as! InitialViewController
            self.presentViewController(loadScreen, animated: false, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
