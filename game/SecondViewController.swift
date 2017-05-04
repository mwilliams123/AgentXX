//
//  SecondViewController.swift
//  game
//
//  Created by Megan Williams on 7/2/16.
//  Copyright © 2016 Megan Williams. All rights reserved.
//


// scrolling during case file / bios
// project cure case file


import UIKit

class SecondViewController: UIViewController {
    
    var num:Int = 0
    
    var num2:Int = 0
    
    var cutNum:Int = 0
    
    var cut:Int = 0
    
    @IBOutlet weak var fade_view: UIView!
    
    @IBOutlet weak var image_intro: UIImageView!
    
    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var intro_view: UIView!
    
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var screen: UITextView!
    
    
    
    var start: Bool = false
    
    let dialogue: [String] = [
        "Agent Williams: Welcome to Base, Agent XX. This is where you will report to receive your assignments. I’ve reviewed your file and see you passed Agent training at the top of your class.",
        "Agent Williams: Because of your potential, we’ve decided to grant you a Top Clearance to work on a new project known as 'The Cure Project'. I’ve pulled the case file for you to review. Take a look.",
        "Agent Williams: Instructions for the first part of your assignment are waiting in the lab. We’ve also assigned you a personal assistant for the project. Her name is Agent Robota, she will show you to the lab. Good luck!",
        "Robota: Good to meet you, Agent XX. This will be your assigned location. I trust you can find your way around a lab, so I’ll leave you to it. Before you begin, I suggest reviewing the classified formula instructions for the Cure Project--- it’s pinned to the cabinets.",
        "ALERT: AN UNKNOWN SUSPECT HAS INVADED HOME BASE.\n STAY ALERT FOR UNKNOWN PERSONNEL.\n REPORT ANY SUSPICIOUS ACTIVITY.",
        "Robota: That looks like Dr. Evilla...",
        "Dr. Evilla: Freeze! No one move. This formula is the only thing standing in my way and I’ve finally got it. Now it’s time to get rid of it once and for all\nFarewell, Agents. No one can stop me.",
        "[Dr. Evilla is trying to escape. Don’t let her get away!]",
        "ALERT: HOMEBASE SECURITY HAS BEEN COMPROMISED. REPEAT: HOMEBASE IS NO LONGER SECURE.",
        "Robota: Agent, I’ll fill you in as we go; there’s no time to waste now. We must find Dr. Evilla. It looks like she is headed to the Time Room! She must be escaping in the time machine. Follow me!",
        "Robota: Just as I expected, she’s escaping in the time machine.",
        "Robota: We have no choice but to follow her and try to retrieve the document. This could be a dangerous journey. Are you up for it Agent XX?",
        "Robota: Right then, no time to waste. I’ll program the machine to follow Dr. Evilla.",
        "Robota: My sensors are picking up her tracks in twenty different time periods...Let’s go to the first stop in 1748 and search for clues. Keep your hands inside the vehicle at all times, and hold on tight.",
        "Robota: this doesn’t look like 1748...our navigation system must be broken. Agent, I’ll need you to navigate the Time Machine manually. No time now--we'll deal with that later.",
        "Robota: The time-space GPS shows we're in the year 1949. We’re in Philadelphia, Pennsylvania and this is one of the rooms devoted to a computer called the UNIVAC. The UNIVAC will one day be the first computer that businesses can purchase, but right now it’s still in the middle of its development. We better find someone who can help us fix our rocket--\n\n—I hear someone coming, let’s see if they can help us...",
        "Robota: Agent, My face-recognition sensor is identifying this woman as ADMIRAL GRACE HOPPER.  One moment, I will search the database to see what information we have on her...  [processing]",
        "Robota: Agent, she is certainly qualified to help us with our navigation system.  I’ll ask her for assistance.",
        "Grace Hopper: You’re in luck, travelers. I will help you program your rocket. Here is some information that may be of use to you.",
        "Robota: Good work. It looks like you’ve figured out how to work the system.\nWait a minute--my sensor  is detecting a piece of the cure document in her pocket…That’s interesting. Dr. Evilla must be scattering pieces of the cure throughout history.\nWe’ll have to collect all of them.",
        "Grace Hopper: Is this the piece of paper you’re talking about? It’s yours if you want it. Best of luck, and safe travels.",
        "Robota: Let’s head back to the rocket and continue our search"
    ]
    
    let dialogue1: [String] = [
        "Congratulations Agent, you programmed the rocket correctly and we have safely landed in the year 1748. According to the rocket’s GPS we are now in Milan, Italy.\n\n*BEEP* Agent, the detectors show that Dr. Evilla has been here. There must be a piece of the formula scattered here. Let’s find someone and ask if they have seen anything strange.",
        "The face recognition sensor is identifying this woman as Maria Agnesi. I’ll pull all the information we have on her for you.",
        "I see she has a piece of the formula in her pocket. Why don’t you go talk to her…",
        "Maria Agnesi: So this piece is all you’re looking for?\n\nI’m working on some math right now--if you help me with it, I will give you the piece.",
        "Robota: Agent, I’d like to brief you on Maria’s work before you begin helping her. Here is  a quick summary of the concepts you’ll need to know. Good luck.",
        ""
    ]
    
    let names: [String] = [
        "",
        "Maria Agnesi",
        "Mary Anning",
        "Mary Somerville",
        "Ada Lovelace",
        "Maria Mitchell",
        "Sonya Kovalevsky",
        "Marie Curie",
        "Nora Stanton",
        "Henrietta Leavitt",
        "Hedy Lamarr",
        "Amalie Noether",
        "Edith Clarke",
        "Olive Dennis",
        "Adele Goldstine",
        "Betty Jennings",
        "Marjorie Lee Browne",
        "Rachel Carson",
        "Rosalind Franklin",
        "Stephanie Louise Kwolek"
    ]
    
    let subject: [String] = [
        "",
        "",
        "archeology",
        "math",
        "some algorithms",
        "comets",
        "geometry",
        "chemistry",
        "civil engineering",
        "astronomy",
        "physics",
        "math",
        "circuits",
        "civil engineering",
        "boolean operators",
        "computer science",
        "math",
        "environmental science",
        "biology",
        "chemistry"
    ]
    
    let locations: [String] = [
        "",
        "",
        "Lyme Regis, England",
        "London, England",
        "1 Dorset Street, London",
        "Nantucket, Massachusetts",
        "Lithuania-Russia border",
        "France",
        "New York ",
        "Boston",
        "Hollywood",
        "Gottengen, Germany",
        "New York",
        "Baltimore, Maryland",
        "Pennsylvania",
        "Pennsylvania",
        "North Carolina",
        "Pennsylvania",
        "King’s College, London",
        "Wilmington, Delaware",
        "Secret Laboratory",
    ]
    
    let years: [Int] = [
        0,
        1748,
        1811,
        1835,
        1842,
        1847,
        1887,
        1898,
        1905,
        1912,
        1914,
        1920,
        1921,
        1921,
        1946,
        1946,
        1947,
        1948,
        1951,
        1964,
        2050
    ]
    
    let opts: [String] = [
        "This piece of paper? I’ll give it to you if you assist me with my research.",
        "You’ve come for this torn thing? Sure, you can have it, but first lend me a hand with my work on ",
        "Of course I’ll help you. Help me with a few of these math problems and it’s yours.",
        "I’ll give you what you seek. I’ve been working on some fairly difficult problems. If you can solve them, the paper is yours.",
        "I’ll tell you what--you can earn it. Help me with a few questions, and it’s yours.",
        "Come take a look at what I’m working on, and then I’ll give you the paper.",
        "Sure, I’ll give it to you-- I need your help with answering a few questions first."
    ]
    
    var len:Int = 0
    var counter:Int = 0
    var timer = Timer()
    var string: NSAttributedString = NSAttributedString()
    
    
    func print_text() {
        let new_string: NSMutableAttributedString = NSMutableAttributedString(attributedString: string.attributedSubstring(from: NSMakeRange(0, counter)))
        new_string.append(NSAttributedString(string: "\n"))
        screen.attributedText = new_string
        if screen.contentSize.height > screen.bounds.height {
            screen.setContentOffset(CGPoint(x: 0, y: screen.contentOffset.y + 2), animated: false)
        }
        
        //screen.setContentOffset(CGPoint(x: 0, y: 500), animated: false)
        counter = counter + 1
        if counter > len {
            timer.invalidate()
        }
    }
    
    
    func print_dialogue(_ text: NSAttributedString) {
        len = text.string.characters.count
        string = text
        counter = 1
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(SecondViewController.print_text), userInfo: nil, repeats: true)
        
    }
    
    var level:Int = 0
    
    func loadMazes() {
        myDefaults.set(1, forKey: loadScreen)
        if level == 0 || level == 4 || level == 8 || level == 12 || level == 16 {
            // load
            let infosheet: InfoViewController = storyboard?.instantiateViewController(withIdentifier: "info") as! InfoViewController
            infosheet.level = level/4
            infosheet.maze = true
            self.present(infosheet, animated: false, completion: nil)
        }
        else {
            let maze:MazeViewController = storyboard?.instantiateViewController(withIdentifier: "maze") as! MazeViewController
            maze.level = level
            self.present(maze, animated: false, completion: nil)
        }
        
    }
    
    var color:UIColor = .clear
    
    let alert:UIAlertController = UIAlertController(title: "You collected the piece!", message: "Let's head back to the rocket", preferredStyle: UIAlertControllerStyle.alert)
    
    func print_dialogue(_ loc: String, dialogue: String, red: Bool) {
        let font:UIFont? = UIFont(name: "Menlo", size:20)
        let string = loc + dialogue
        let attString:NSMutableAttributedString = NSMutableAttributedString(string: string)
        if red {
            attString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: NSMakeRange(0, attString.length))
        }
        else {
            attString.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(0, attString.length))
             attString.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSMakeRange(0, attString.length))
        }
       
        attString.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, attString.length))
        attString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(0, loc.characters.count))
        
        print_dialogue(attString)
    }
    
    var maze: Bool = false
    
    func complete(_ done: Bool) {
        if done {
            let loc = "Location: Unknown\nYear: 2050\n\n"
            print_dialogue(loc, dialogue: self.dialogue[0], red: false)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // myDefaults.setInteger(0, forKey: loadScreen)
        // save green color of text
        color = screen.textColor!
        
        // make black fade transparent
        fade_view.alpha = 0
        intro_view.isHidden = true
        
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { action in
            self.loadMazes()
        }))
        
        
        screen.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        
        
        // for final challenge
        if (level == 20) {
            pic.image = UIImage(named: "lab1")
            print_dialogue("Location: Secret Laboratory\nYear: 2050\n\n", dialogue: "Robota: We're back in the lab. Now we can make the cure. We must hurry!", red: false)
            
        }
        else if level == 21 {
            pic.image = UIImage(named: "end1")
            print_dialogue("", dialogue: "Robota: You did it! Congratulations! Dr. Evilla has no chance now that we have the cure. I’ll take the solution to headquarters right away.\n\nIt was a pleasure working with you.", red: false)
        }
        else {
            if maze {
                // questions have been completed
                // collect the piece and proceed to the rocket
                let stringNum:String = String(level)
                let imageString:String = "cut" + stringNum + "_1"
                pic.image = UIImage(named: imageString)
                var s:String = ""
                if level == 19 {
                    s = "Robota: Good work! We've finally collected all of the pieces! Let's head back to the rocket so we can return to 2050 and stop Dr.Evilla before its too late."
                }
                else {
                    s = "Robota: Good work! You’ve completed all of " + names[level] +  "'s questions and she’s handed over the piece. Let’s head back to the rocket and continue our search. Don’t forget to use the programming skills Grace taught you to get to the next location."
                }
                print_dialogue("", dialogue: s, red: false)
            }
            else {
                if level == 0 {
                    //let loc = "Location: Unknown\nYear: 2050\n\n"
                    //ntro_view.hidden = false
                    //print("here")
                    //self.intro_view.alpha = 1
                    //fade_view.alpha = 1
                    //var k = false
                    //print_dialogue(loc, dialogue: dialogue[0], red: false)
                    
                }
                else {
                    let stringNum:String = String(level)
                    var imageString:String = "cut" + stringNum
                    if level == 15 {
                        imageString = "cut14"
                    }
                    pic.image = UIImage(named: imageString)
                    if level == 1 {
                        print_dialogue("Location: Milan, Italy\nYear: 1748\n\n", dialogue: dialogue1[0], red: false)
                    }
                    else {
                        let time = String(years[level])
                        let l = "Location: " + locations[level] + "\nTime: " + time + "\n\n"
                        let s = "We have reached our next destination. There must be another piece close by. Let’s go get it."
                        print_dialogue(l, dialogue: s, red: false)
                        
                    }
                    
                    
                }
            }

        }
        
        
        
        
        
        
    }
    
    func loadNewView() {
        myDefaults.set(2, forKey: loadScreen)
        let info_sheet:InfoViewController = storyboard?.instantiateViewController(withIdentifier: "info") as! InfoViewController
        info_sheet.level = level
        self.present(info_sheet, animated: false, completion: nil)
    }
    
    func presentBio() {
        let popUp: BioViewController = storyboard?.instantiateViewController(withIdentifier: "bio") as! BioViewController
        //var nav = UINavigationController(rootViewController: popUp)
        popUp.modalPresentationStyle = .popover
        popUp.level = level
        let popoverController = popUp.popoverPresentationController
        popoverController?.sourceView = self.view
        present(popUp, animated: true, completion: nil)
    }
    
    func loadCasefile() {
        let popUp: InfoViewController = storyboard?.instantiateViewController(withIdentifier: "info") as! InfoViewController
        //var nav = UINavigationController(rootViewController: popUp)
        popUp.modalPresentationStyle = .popover
        popUp.casefile = true
        let popoverController = popUp.popoverPresentationController
        popoverController?.sourceView = self.view
        present(popUp, animated: true, completion: nil)
    }
    var maze_info: Bool = false
    @IBAction func nextbtn(_ sender: UIButton) {
        //click next button
        screen.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        screen.attributedText = NSAttributedString(string: "")
        
        if timer.isValid {
            timer.invalidate()
            screen.attributedText = string
        }
        else {
            if maze {
                // load the maze screen
                if (level == 4 || level == 8 || level == 12 || level == 16) && !maze_info {
                    maze_info = true
                    if level == 4 {
                        print_dialogue("", dialogue: "Robota: Agent you've mastered your coding skills. You're ready to learn a new technique that allows you to use repeat commands. I'll brief you quickly on the topic before you begin.", red: false)
                    }
                    else {
                        print_dialogue("", dialogue: "Robota: Agent, as we move closer to the future the navigation of our spaceship gets trickier. Here are some additional concepts that you might need to know.", red: false)
                    }
                   
                    
                }
                else {
                    present(alert, animated: true, completion: nil)
                }
                
            }
            else {
                cutNum = cutNum + 1
                
                switch (level) {
                case 0:
                    // initial loading screen
                    
                    
                    if cutNum >= 19 {
                        loadMazes()
                    }
                    else {
                        var r: Bool = false
                        var l: String = ""
                        var d: String = dialogue[cutNum]
                        if cutNum == 4 || cutNum == 8 {
                            r = true
    
                        }
                        else if cutNum == 7 {
                            l = dialogue[cutNum]
                            d = ""
                        }
                        else if cutNum == 14  {
                            self.fade_view.alpha = 1
                            UIView.animate(withDuration: 2.5, animations: {
                                self.fade_view.alpha = 0
                            })
                        }
                        else if cutNum == 17  {
                            
                            presentBio()
                        }
                        else if cutNum == 18  {
                            UIView.animate(withDuration: 0.5, animations: {
                                self.fade_view.alpha = 1
                            })
                            UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
                                self.fade_view.alpha = 0
                                }, completion: nil)
                        }
                        if cutNum != 17 && cutNum != 2 {
                             print_dialogue(l, dialogue: d, red: r)
                        }
                        else {
                            screen.text = dialogue[cutNum]
                            screen.textColor = UIColor.white
                        }
                        
                        
                    }
                    
                    switch (cutNum) {
                    case 2:
                        loadCasefile()
                        pic.image = UIImage(named: "lab0_1")
                    case 3:
                        pic.image = UIImage(named: "lab0")
                    case 3:
                        pic.image = UIImage(named: "lab1")
                    case 5:
                        pic.image = UIImage(named: "lab2")
                    case 6:
                        pic.image = UIImage(named: "lab3")
                    case 7:
                        pic.image = UIImage(named: "lab4")
                    case 8:
                        pic.image = UIImage(named: "lab5")
                    case 10:
                        pic.image = UIImage(named: "lab6")
                    case 11:
                        pic.image = UIImage(named: "lab7")
                    case 12:
                        pic.image = UIImage(named: "lab8")
                    case 14:
                        pic.image = UIImage(named: "cut0")
                    case 16:
                        pic.image = UIImage(named: "cut0_1")
                    default:
                        break;
                    }
                case 1:
                    if cutNum == 1 {
                        // load image of woman
                        pic.image = UIImage(named: "cut1_1")
                    }
                    else if cutNum == 2 {
                        // load bio
                        presentBio()
                        
                    }
                    else if cutNum == 3 {
                        // fade to black
                        UIView.animate(withDuration: 0.5, animations: {
                            self.fade_view.alpha = 1
                        })
                        UIView.animate(withDuration: 0.5, delay: 0.5, options: [], animations: {
                            self.fade_view.alpha = 0
                            }, completion: nil)
                        
                    }
                    else if cutNum == 4 {
                        // change image back
                        pic.image = UIImage(named: "cut1")
                    }
                    if cutNum == 5 {
                        loadNewView()
                    }
                    else if cutNum == 2 {
                        screen.text = dialogue1[cutNum]
                        screen.textColor = UIColor.white
                    }
                    else {
                        print_dialogue("", dialogue: dialogue1[cutNum], red: false)
                    }
                    
                case 20:
                    
                    if cutNum == 1{
                        print_dialogue("", dialogue: "We’ve finally pieced together the Cure notes. Agent, it’s up to you to decrypt Evilla’s instructions and synthesize the cure. We’re counting on you.", red: false)
                        pic.image = UIImage(named: "end0")
                    }
                    else {
                        // load final challenge
                        myDefaults.set(3, forKey: loadScreen)
                        let final_challenge: finalViewController = storyboard?.instantiateViewController(withIdentifier: "final") as! finalViewController
                        self.present(final_challenge, animated: false, completion: nil)
                    }
                case 21:
                    if cutNum == 1 {
                        print_dialogue("", dialogue: "Well, agent, I have to say I’m impressed by your work. You surpassed my expectations, especially for your first case. Your skill in science and math is highly commendable-- I will include that in my report. ", red: false)
                        pic.image = UIImage(named: "lab0_0")
                    }
                    else if cutNum == 2 {
                        print_dialogue("", dialogue: "I’d like to recommend you for the Science, Technology,   Engineering, and Math sector of the Agency, with your permission. I think you’d excel there. That’s all for today. I’ll see you bright and early tomorrow, Agent XX.", red: false)
                    }
                    else {
                        let end: CreditsViewController = storyboard?.instantiateViewController(withIdentifier: "credits") as! CreditsViewController
                        //end.game_finished = true
                        myDefaults.set(0, forKey: myLevel)
                        myDefaults.set(0, forKey: myChoices)
                        myDefaults.set(0, forKey: loadScreen)
                        self.present(end, animated: true, completion: nil)
                    }
                default:
                    if cutNum == 1 {
                        let stringnum = String(level)
                        let image_name = "cut" + stringnum + "_1"
                        pic.image = UIImage(named: image_name)
                        let s = "Aha! Who is this?\n[Facial recognition sensor identification: " + names[level] +  "]\nRetrieving background information..."
                        print_dialogue("", dialogue: s, red: false)
                    }
                    else if cutNum == 2 {
                        presentBio()
                        let s = "It looks like she has a piece of the cure! Let's ask her for it."
                        screen.text = s
                        screen.textColor = UIColor.white
                        //print_dialogue("", dialogue: s, red: false)
                    }
                    else if cutNum == 3 {
                        UIView.animate(withDuration: 1, animations: {
                            self.fade_view.alpha = 1
                        })
                        UIView.animate(withDuration: 1, delay: 1, options: [], animations: {
                            self.fade_view.alpha = 0
                            }, completion: nil)
                        var s = ""
                        if level == 3 || level == 6 || level == 11 || level == 16 {
                            s = opts[2]
                        }
                        else if level == 2 || level == 8 || level == 12 {
                            s = opts[1] + subject[level]    + "."
                        }
                        else if level == 4 || level == 10 || level == 17 {
                            s = opts[0]
                        }
                        else if level % 7 == 0 || level == 19 {
                            s = opts[3]
                        }
                        else if level % 9 == 0 || level == 13 {
                            s = opts[4]
                        }
                        else {
                            s = opts[5]
                        }
                        print_dialogue("", dialogue: names[level] + ": " + s, red: false)
                    }
                    else if cutNum == 4 {
                        var stringnum = String(level)
                        if level == 15 {
                            stringnum = "14"
                        }
                        let image_name = "cut" + stringnum
                        pic.image = UIImage(named: image_name)
                        let s = "Robota: Agent, I’d like to brief you on " + names[level] +  "'s research before you begin helping her.I’ve compiled a quick summary of the concepts you’ll need to know. Good luck."
                        print_dialogue("", dialogue: s, red: false)
                    }
                    else {
                        loadNewView()
                    }
                    break
                }
                
            }
            
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //UIView.animateWithDuration(1.5, animations: {
         //   self.fade_view.alpha = 0
       // })
        if start {
            start = false
            print("works")
            intro_view.isHidden = false
            UIView.animate(withDuration: 5, animations: {
                self.intro_view.alpha = 0
                }, completion: {(Bool)  in
                    self.print_dialogue("Location: Unknown\nYear: 2050\n\n", dialogue: self.dialogue[0], red: false)})
            

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
