//
//  InitialViewController.swift
//  game
//
//  Created by Megan Williams on 7/16/16.
//  Copyright © 2016 Megan Williams. All rights reserved.
//



// fix load maze view


import UIKit
import AVFoundation

class InitialViewController: UIViewController {
    
    var music: AVAudioPlayer!
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var new_btn: UIButton!
    @IBOutlet weak var resume_btn: UIButton!
    @IBOutlet weak var credit_btn: UIButton!
    @IBOutlet weak var mute_btn: UIButton!
    
    
    @IBAction func newGame(sender: AnyObject) {
        myDefaults.setInteger(0, forKey: myLevel)
        myDefaults.setInteger(0, forKey: myChoices)
        myDefaults.setInteger(0, forKey: loadScreen)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // play music
        let path = NSBundle.mainBundle().pathForResource("PhantomfromSpace.mp3", ofType: nil)!
        let url = NSURL(fileURLWithPath: path)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            let sound = try AVAudioPlayer(contentsOfURL: url)
            music = sound
            music.numberOfLoops = -1
            sound.play()
        } catch {
            // do nothing
        }
        
        UIView.animateWithDuration(0.7, animations: {
            self.label.center.x -= self.view.bounds.width
        })
        UIView.animateWithDuration(0.7, delay: 0.5, options: [], animations: {
            self.new_btn.center.x += self.view.bounds.width
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.5, options: [], animations: {
            self.resume_btn.center.x -= self.view.bounds.width
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.5, options: [], animations: {
            self.credit_btn.center.x += self.view.bounds.width
            }, completion: nil)
        
        if myDefaults.integerForKey(loadScreen) == 0 && myDefaults.integerForKey(myLevel) == 0 && myDefaults.integerForKey(myChoices) == 0 {
            // starting game for first time, so gray out resume button
            resume_btn.enabled = false
            resume_btn.alpha = 0.5
        }
        else {
            resume_btn.enabled = true
            resume_btn.alpha = 1
        }
        
        
    }
    
    // resume
    @IBAction func resumedApp(sender: AnyObject) {
        if music != nil {
            music.stop()
            music = nil
        }
        if myDefaults.integerForKey(loadScreen) == 1 {
            // load maze
            let maze:MazeViewController = storyboard?.instantiateViewControllerWithIdentifier("maze") as! MazeViewController
            maze.level = myDefaults.integerForKey(myLevel) / 4
            self.presentViewController(maze, animated: false, completion: nil)
        }
        else if myDefaults.integerForKey(loadScreen) == 0 {
            // load dialogue
            let S: SecondViewController = storyboard?.instantiateViewControllerWithIdentifier("first") as! SecondViewController
            S.level = (myDefaults.integerForKey(myLevel) / 4) + 1

            self.presentViewController(S, animated: false, completion: nil)
        }
        else if myDefaults.integerForKey(loadScreen) == 2 {
            // load questions
            let Q: ViewController = storyboard?.instantiateViewControllerWithIdentifier("main") as! ViewController
            self.presentViewController(Q, animated: false, completion: nil)
        }
        else if myDefaults.integerForKey(loadScreen) == 3 {
            // load final challenge
            let F: finalViewController = storyboard?.instantiateViewControllerWithIdentifier("final") as! finalViewController
            self.presentViewController(F, animated: false, completion: nil)
        }
        
    }
    
    var mute: Bool = false
    
    @IBAction func hitMuteButton(sender: AnyObject) {
        if mute {
            if music != nil {
                music.play()
            }
            self.mute_btn.setImage(UIImage(named: "mute"), forState: .Normal)
            mute = false
        }
        else {
            if music != nil {
                music.pause()
            }
            self.mute_btn.setImage(UIImage(named: "unmute"), forState: .Normal)
            mute = true
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if music != nil {
            music.stop()
            music = nil
        }
        if segue.identifier == "new" {
            let init_screen:SecondViewController = segue.destinationViewController as! SecondViewController
            init_screen.level = 0
            init_screen.start = true
        }
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        label.center.x += view.bounds.width
        new_btn.center.x -= view.bounds.width
        resume_btn.center.x += view.bounds.width
        credit_btn.center.x -= view.bounds.width
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
