//
//  ViewController.swift
//  game
//
//  Created by Megan Williams on 6/27/16.
//  Copyright © 2016 Megan Williams. All rights reserved.
//
// TESTING IS ON!
//
// TODO:
//
// 1. get rockets to move
// 2. incorrect messages
// 3. Add in final scene


import UIKit
import AVFoundation

let myDefaults = NSUserDefaults.standardUserDefaults()
let myLevel = "myLevel"
let myChoices = "myChoices"
let loadScreen = "loadScreen"

class ViewController: UIViewController, UITextFieldDelegate, UIPopoverPresentationControllerDelegate {
    
    //current question
    var Qnum:Int = 0
    
    var imageNum:Int = 0
    
    @IBOutlet weak var scroller: UIScrollView!
    
    //date label
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var mcView2: UIView!
    
    //In-game Messages
    let incorrectResponse:String = "Sorry, incorrect answer. Try again"
    
    //questions
    let questions: [String] = [
        
        "What are the coordinates of point P?",
        "What is the slope of the blue line?",
        "What is the slope of the blue line?",
        "What is the slope of the blue line?",
        
        "I have an ichthyosaur skull, which is 250 million years old! Which geological era is it from?\n",
        "The Mesozoic era is subdivided into three geological periods. Order then from oldest to youngest",
        "Choose which of the rock layers is the oldest\n",
        "There are 30 million species of living organisms. Of that 30 million, how many are NOT animals?\n",
        
        "I’m thinking of a number. If you multiply this number by 2 and subtract 1, you get 17. What number am I thinking of?",
        "I'm thinking of a number. Six more than half of this number is 18. What number am I thinking of?",
        "The sum of two consecutive integers is 31. Tell me the smaller of these two integers.",
        "The sum of three consecutive integers is 63. What is the smallest of these integers?",
        
        "What is the output of this algorithm?",
        "What is the output of this algorithm?",
        "What is the value of x at the end of this algorithm?",
        "What is the value of x at the end of this algorithm?",
        
        "A comet is made of _________",
        "The orbit of a comet around the sun is typically in the shape of a",
        "The closest point in a comet's orbit around the sun is the ______",
        "The most distant point in a comet's orbit around the sun is the ______",
        
        "A rectangle has a perimeter of 100 feet. The length of the pigpen is 30 feet. What is the width?",
        "A rectangular pigpen has a perimeter of 60 feet. The length is 6 less than twice the width. What is the length of the pigpen?",
        "Find x.\n",
        "Find x.\n",
        
        "How many protons does Radium-226 have?",
        "How many neutrons does Radium-226 have?",
        "Radium-225, Radium-226, and Radium-228 are all ______ of radium",
        "Radium can be used to treat which disease?",
        
        "We are in the small town of Rocky Creek, which requires three bridges to be built. We can only use each type of bridge  (Arch, Beam, Truss, Drawbridge) once. Choose the bridge that is most appropriate, given the following description:\n Needs to span a very large distance, and must allow boats to pass through",
        "Choose the bridge that is most appropriate, given the following description:\n  Need the cheapest bridge possible, to cross a river only a few inches deep and 50 feet across.",
        "CHALLENGE: Sometimes, the river in the previous question becomes flooded with rain water. The water pushes against the vertical support beams in the water and break the bridge. How do we solve this problem?",
        "Choose the bridge that is most appropriate, given the following description:\n A  plain bridge that does not detract from its surroundings and can support itself without any additional structures",
        
        "All of the following are correct except:",
        "Which planet is now considered a dwarf planet?",
        "Choose the correct order of the first four planets in our solor system, closest to farthest from the sun:",
        "Which of the following is a star?",
        
        "Which distance is the wavelength?\n",
        "Which distance is the amplitude?\n",
        "If a wave has a speed of 300m/s and a frequency of 10 Hz, what is its wavelength?",
        "If the frequency is doubled, the wavelength is _____",
        
        "What is 10% of 80?",
        "What is 20% of 40?",
        "15 is what percent of 25?",
        "40 is 80% of what number?",
        
        "The source of the electricity in a circuit composed of a battery, a copper wire, and a light bulb, is the _____",
        " Current is caused by the flow of electrons, which flow from ____ to _____",
        "A circuit only “works” if it is _____",
        "What happens if the wire is disconnected from one side of the battery? (The circuit is now open)",
        
        "Train A has a speed of 40 miles/hour. It travels for 2 hours. How many miles does it travel?",
        "Train B has a speed of 20 miles/hour. It travels 60 miles. How many hours did it travel for?",
        "Two trains leave a railroad station at the same time. Train A travels 100 miles at 50 miles/hour to a nearby city. Trains B travels 50 miles at 10 miles/hour. Which train takes a longer amount of time to reach its destination?",
        "You are taking a train from Ohio to Baltimore. Your return trip to Ohio is 1.5 hours longer than the forward trip. If the train averages 50 miles/hour on the return trip and 75 miles/hour on the forward trip, how long was the ride from Ohio to Baltimore? Keep in mind that the distances are the same.",
        
        "I have two pets, a bird and a cat, and am trying to find a cage for my animals at a pet store. Choose the correct boolean operator (see info sheet for hint!)  (and, or, not) for the following circumstance:\nI want a cage that can house both the bird and the cat at the same time.",
        "Choose the correct boolean operator for the following circumstance:\n I want to see all the bird cages and all the cat cages.",
        "Choose the correct boolean operator for the following circumstance:\nI do not want a cage for a cat.",
        "Choose the correct boolean operator for the following circumstance:\nI want a cage for the bird, and do not want a cat cage.",
        
        "What is the value of x after this code is executed?\nx = 0\ny = 2\nx = 5",
        "Now tell me what is the value of y?\nx = 0\ny = 2\nx = 5",
        "What is the value of x after this code is executed?\nx = 5\nx = x + 1",
        "Read the following code:\nx = 3\nx = x + 1\nx = x * 5\nWhat is the value of x?",
        
        "Alicia is six years older than Megan. The sum of their ages is 30. How old is Alicia?",
        "Stephanie bought 5 apples and 2 oranges. Her total was $12. If 1 orange is half the price of an apple, how much is the cost of an apple?",
        "Five people are going to the circus. The cost is $5 for children and $10 for adults. If the total cost for the group is $35, then how many children are in the group?",
        "Mary owns 15 animals. Some of them are chickens and some are sheep. There are 40 legs among all of the animals. How many chickens are there?",
        
        "Rachel Carson spoke about the dangers of pesticides and called for which of the following actions",
        "DDT is one pesticide Rachel Carson investigated, which has now been banned in the United States. Which of the following were true about DDT at the time of its ban",
        "Rachel Carson was an advocate for awareness of the dangers of pesticides, and in particular, she researched the dangers of incesticide. Choose the best answer about the harms of insecticide:",
        "Carson’s work contributed to the establishment of the EPA. EPA stands for: ",
        
        "Select the correct complementary DNA sequence to ACCCTAGAC",
        "What does DNA stand for?",
        "Choose the correct structure of DNA",
        "Select the correct complementary RNA sequence to ACCCUA",
        
        "Which of these carries a positive charge?",
        "How many atoms of H (hydrogen) are there in one molecule of H2O?",
        "How many atoms of O (oxygen) are there in FeSO4 * 6H20?",
        "Choose the correctly balanced equation with equal numbers of atoms on each side:",
        
        ""
    ]
    
    var mc_question:Int = 0
    
    //multiple choice question answers
    let c1: [String] = [
        "(2, 3)",
        "-2",
        "-3/2",
        "-2",
        
        "Mesozoic",
        "Triassic, Jurassic, Cretaceous",
        "Top layer",
        "1.4",
        
        "2",
        
        "only dirt",
        "Circle",
        "Aphelion",
        "Aphelion",
        
        "20",
        "12",
        "35",
        "30",
        
        "88",
        "Isomers",
        "The flu",
        
        "Arch",
        "Make the bridge taller",
        "Arch",
        
        "Jupiter is the largest planet",
        "Pluto",
        "Mercury, Venus, Earth, Mars",
        "Mars",
        
        "A",
        "3",
        "Doubled",
        
        "0.8",
        "2",
        "37.5%",
        "24",
        
        
        "Lightbulb A",
        "Neutral to Neutral",
        "Closed",
        "The lightbulb goes out",
        
        "20 miles",
        "1/3",
        "Train A",
        "0.6 hours",
        
        
        "A. And",
        "A. And",
        
        "0",
        "1",
        "3",
        
        "$1.33 ",
        
        "A. A ban on all pesticides",
        "A. It posed a threat to bird populations",
        "A. Predatory insects are killed off by insecticide",
        "Environment Pollution Action",
        
        "ACCCTAGAC",        //c
        "Deoxygen nonacid",
        "Single-stranded",
        "UGGGAU",
        
        "Neutron",
        "4",
        "KNO3 ----> KNO2 + O2 "
    ]
    
    let c2: [String] = [
        "(3, 2)",
        "-1/2",
        "-2/3",
        "-1",
        
        "Cenozoic",
        "Triassic, Cretaceous, Jurassic",
        "2nd layer",
        "8.2",
        
        "4",
        
        "pure minerals",
        "Ellipse",
        "Perihelion",
        "Perihelion",
        
        "35",
        "18",
        "45",
        "42",
        
        "138",
        "Elements",
        "The plague",
        
        "Beam",
        "Dig deeper into the dirt",
        "Beam",
       
        
        "Uranus looks blue due to methane",
        "Jupiter",
        "Mercury, Earth, Venus, Mars",
        "Jupiter",
        
        "B",
        "30",
        "Halfed",
        
        "8",
        "8",
        "40%",
        "32",
        
        "wire",
        "Negative to Positive",
        "Open",
        "Charge keeps flowing",
        
        "40 miles",
        "3",
        "Train B",
        "1.5 hours",
        
        "B. Or",
        "B. Or",
        
        "2",
        "5",
        "12",
        
        "$1.71",
        
        "B. More research into pesticides",
        "B. It can accumulate in animal tissue",
        "B. Resistance can occur, making insecticide useless",
        "Environmental Protection Agency",
        
        "TGGGATCTG",
        "Dehydrogenase acid",
        "Double-stranded",
        "UCCCUA",
        
        "Electron",
        "5",
        "2KNO3 ----> 3KNO2 + 3O2 "
    ]
    
    let c3: [String] = [
        "(3/2, 0)",
        "1/2",
        "2/3",
        "1",
        
        "Paleozoic",
        "Jurassic, Cretaceous, Triassic",
        "3rd layer",
        "15.6",
        
        "8",
        
        "large rocks",
        "Spiral",
        "Apsis",
        "Apex",
        
        "40",
        "27",
        "55",
        "50",
        
        "226",
        "Isotopes",
        "Measles",
        
        "Truss",
        "Slant the bridge against water flow",
        "Truss",
        
        "Neptune is farthest from the sun",
        "Neptune",
        "Uranus, Neptune, Saturn, Jupiter",
        "Pluto",
        
        "C",
        "300",
        "Tripled",
        
        "80",
        "20",
        "60%",
        "50",
        
        "air",
        "Positive to Negative",
        "big enough",
        "The lightbulb stays on",
        
        "60 miles",
        "40",
        "Both trains take the same time",
        "3 hours",
        
        "C. Not",
        "C. Not",
        
        "5",
        "6",
        "15",
        
        "$2.00",
        
        "C. Lower volume of spraying",
        "C. It was a public health concern",
        "C. Insecticides kill all living organisms",
        "Energy Pollution Agency",
        
        "TGGGATGAC",
        "Deoxyribonucleic acid", //c
        "Triple-stranded",
        "UCCCUU",
        
        "Proton",
        "6",
        "2KNO3 ----> 2KNO2 + O2 "
    ]
    
    let c4: [String] = [
        "(2, 2)",
        "2",
        "3/2",
        "2",
        
        "Neopreterozoic",
        "Cretaceous, Jurassic, Triassic",
        "Bottom layer",
        "28.1",
        
        "16",
        
        "ice mixed with dust and rock",
        "Helix",
        "Perigee",
        "Apogee",
        
        "70",
        "38",
        "90",
        "60",
        
        "314",
        "Polymers",
        "Cancer",
        
        "Drawbridge",
        "Choose a different bridge",
        "Drawbridge",
        
        "Mercury is second closest to the sun",
        "The Sun",
        "Neptune, Uranus, Saturn, Jupiter",
        "The Sun",
        
        "D",
        "3000",
        "Stays the same",
        
        "800",
        "80",
        "62.5%",
        "64",
        
        "battery",
        "Neutral to Positive",
        "None of the above",
        "None of the above",
        
        "80 miles",
        "1200",
        "",
        "4.5 hours",
        
        "D. None of the above",
        "D. B and C",
        
        "None of the above",
        "None of the above",
        "20",
        
        "$2.50",
        
        "D. More research and less spraying",
        "D. All of the above",
        "D. A and B",
        "Energy Protection Agency",
        
        "ACCCTAGAC",
        "Deoxyribonucleic adenine",
        "Random assortment",
        "AUUUUA",
        
        "Neutrino",
        "10",
        "4KNO3 ----> 3KNO2 + 3O2 "
    ]
    
    let years: [Int] = [
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
    
    
    
    
    //multiple-choice buttons
    @IBOutlet weak var mc1: UIButton!
    
    @IBOutlet weak var mc2: UIButton!
    
    @IBOutlet weak var mc3: UIButton!
    
    @IBOutlet weak var mc4: UIButton!
    
    
    @IBAction func clickedmc1(sender: AnyObject) {
        
        //handle this button
        if mc1.selected {
            mc1.selected = false
            mc1.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        else {
            mc1.selected = true
            mc1.setImage(UIImage(named: "radiobtn_unchecked"), forState: .Normal)
        }
        //handle other buttons
        if mc2.selected {
            mc2.selected = false
            mc2.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        if mc3.selected {
            mc3.selected = false
            mc3.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        if mc4.selected {
            mc4.selected = false
            mc4.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
    }
    
    @IBAction func clickedmc2(sender: AnyObject) {
        //handle this button
        if mc2.selected {
            mc2.selected = false
            mc2.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        else {
            mc2.selected = true
            mc2.setImage(UIImage(named: "radiobtn_unchecked"), forState: .Normal)
        }
        //handle other buttons
        if mc1.selected {
            mc1.selected = false
            mc1.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        if mc3.selected {
            mc3.selected = false
            mc3.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        if mc4.selected {
            mc4.selected = false
            mc4.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
    }
    
    @IBAction func clickedmc3(sender: AnyObject) {
        //handle this button
        if mc3.selected {
            mc3.selected = false
            mc3.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        else {
            mc3.selected = true
            mc3.setImage(UIImage(named: "radiobtn_unchecked"), forState: .Normal)
        }
        //handle other buttons
        if mc2.selected {
            mc2.selected = false
            mc2.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        if mc1.selected {
            mc1.selected = false
            mc1.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        if mc4.selected {
            mc4.selected = false
            mc4.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
    }
    
    @IBAction func clickedmc4(sender: AnyObject) {
        //handle this button
        if mc4.selected {
            mc4.selected = false
            mc4.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        else {
            mc4.selected = true
            mc4.setImage(UIImage(named: "radiobtn_unchecked"), forState: .Normal)
        }
        //handle other buttons
        if mc2.selected {
            mc2.selected = false
            mc2.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        if mc3.selected {
            mc3.selected = false
            mc3.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
        if mc1.selected {
            mc1.selected = false
            mc1.setImage(UIImage(named: "radiobtn"), forState: .Normal)
        }
    }
    
    
    
    
    @IBOutlet weak var choice1: UILabel!
    @IBOutlet weak var choice2: UILabel!
    @IBOutlet weak var choice3: UILabel!
    
    @IBOutlet weak var choice4: UILabel!
    
    
    //text that displays answer
    @IBOutlet weak var questionField: UITextView!
    
    //free response input
    @IBOutlet weak var answerField: UITextField!
    
    //wrong answer response message
    @IBOutlet weak var message: UILabel!
    
    
    @IBOutlet weak var bag_image: UIButton!
    
    //handles clicking of bag
    @IBAction func clickedBag(sender: UIButton) {
        bag_image.setImage(UIImage(named: "bag_pic"), forState: .Normal)
    }
    
    
    
    @IBAction func openBag(sender: AnyObject) {
        // stop music
        
        
        // make bag pop up
        let bag:BagViewController = storyboard?.instantiateViewControllerWithIdentifier("bag") as! BagViewController
        let piecesCollected:Int = Qnum / 4
        bag.year = years[level]
        bag.pieces = piecesCollected
        bag.modalPresentationStyle = .Popover
        let popoverController = bag.popoverPresentationController
        popoverController?.sourceView = self.view
        presentViewController(bag, animated: true, completion: nil)
        
    }
    
    
    
    //transition from questions to cut screen
    func transition() {
        //let mainStoryboard = UIStoryboard(name: "Storyboard", bundle: NSBundle.mainBundle())
        answerField.text = ""
        if Qnum % 4 == 0 {
            if music != nil {
                music.stop()
                music = nil
            }
            myDefaults.setInteger(0, forKey: loadScreen)
            let cutScreen:SecondViewController = storyboard?.instantiateViewControllerWithIdentifier("first") as! SecondViewController
            cutScreen.level = Qnum / 4
            cutScreen.maze = true
            self.presentViewController(cutScreen, animated: false, completion: nil)
        }
        else {
            printNextQ()
        }
    }
    
    
    //multiple-choice view
    @IBOutlet weak var mcView: UIView!
    
    var color:UIColor = .clearColor()
    
    func printNextQ() {
        questionField.textStorage.setAttributedString(NSAttributedString(string: ""))
        let string: NSMutableAttributedString = NSMutableAttributedString(string: questions[Qnum])
        if Qnum == 73 {
            // do superscripts
            //color = questionField.textColor!
            let font:UIFont? = UIFont(name: "Menlo", size:20)
            let fontSuper:UIFont? = UIFont(name: "Menlo", size:12)
            let attString:NSMutableAttributedString = NSMutableAttributedString(string: questions[Qnum], attributes: [NSFontAttributeName:font!])
            attString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location:61,length:1))
            attString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(0,attString.length))
             questionField.attributedText = attString;
          
        }
        else if Qnum == 74 {
            // other superscripts
            //color = questionField.textColor!
            let font:UIFont? = UIFont(name: "Menlo", size:20)
            let fontSuper:UIFont? = UIFont(name: "Menlo", size:12)
            let attString:NSMutableAttributedString = NSMutableAttributedString(string: questions[Qnum], attributes: [NSFontAttributeName:font!])
            attString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location:46,length:1))
            attString.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location:52,length:1))
            attString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(0, attString.length))
            questionField.attributedText = attString;
            
          
        }
        else {
            // assign text to question as normal
            let font:UIFont? = UIFont(name: "Menlo", size:20)
            string.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, string.length))
            string.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(0, string.length))
            questionField.attributedText = string
            questionField.textColor = color
            
        }
        
        var image_name = ""
        
        switch (Qnum) {
        case 0:
            image_name = "line0"
        case 1:
            image_name = "line1"
        case 2:
            image_name = "line2"
        case 3:
            image_name = "line3"
        case 6:
            image_name = "rocks"
        case 12:
            image_name = "algo1"
        case 13:
            image_name = "algo2"
        case 14:
            image_name = "algo3"
        case 15:
            image_name = "algo4"
        case 22:
            image_name = "triangles"
        case 23:
            image_name = "triangles2"
        case 36:
            image_name = "wave"
        case 37:
            image_name = "wave"
        case 44:
            image_name = "circuit"
        case 45:
            image_name = "circuit"
        case 46:
            image_name = "circuit"
        case 47:
            image_name = "circuit"
            
            
        default:
            break
        }
        if image_name != "" {
            let question_image = UIImage(named: image_name)
            let screenSize = UIScreen.mainScreen().bounds
            let width: CGFloat = screenSize.width - 38
            let scale =  width / (question_image?.size.width)!
            let height = (question_image?.size.height)! * scale
            let rect = CGRectMake(0, 0, width, height)
            let attachment = NSTextAttachment()
            attachment.image = question_image
            attachment.bounds = rect
            let attString = NSAttributedString(attachment: attachment)
            string.appendAttributedString(attString)
            questionField.attributedText = string
            //questionField.textStorage.insertAttributedString(attString, atIndex: questionField.selectedRange.location)
        }
        questionField.flashScrollIndicators()
        if (Qnum >= 8 && Qnum <= 14) || Qnum == 60 || Qnum == 62 || Qnum == 63 || Qnum == 73 {
            mcView2.hidden = true
            answerField.hidden = false
        }
        else if Qnum == 76 {
            // load special view for last question
        }
        else {
            mcView2.hidden = false
            answerField.hidden = true
            
            if Qnum == 50 {
                mc4.hidden = true
            }
            else {
                mc4.hidden = false
            }
            
            if Qnum == 75 {
                //color = questionField.textColor!
                let font:UIFont? = UIFont(name: "Menlo", size:20)
                let fontSuper:UIFont? = UIFont(name: "Menlo", size:12)
                let attString1:NSMutableAttributedString = NSMutableAttributedString(string: c1[mc_question], attributes: [NSFontAttributeName:font!])
                attString1.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location:3,length:1))
                attString1.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location:14,length:1))
                attString1.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location:19,length:1))
                choice1.attributedText = attString1
                choice1.textColor = color
                
                let attString2:NSMutableAttributedString = NSMutableAttributedString(string: c2[mc_question], attributes: [NSFontAttributeName:font!])
                attString2.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location: 4,length:1))
                attString2.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location: 16,length:1))
                attString2.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location:22,length:1))
                choice2.attributedText = attString2
                choice2.textColor = color
                
                let attString3:NSMutableAttributedString = NSMutableAttributedString(string: c3[mc_question], attributes: [NSFontAttributeName:font!])
                attString3.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location: 4,length:1))
                attString3.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location: 16,length:1))
                attString3.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location: 21,length:1))
                choice3.attributedText = attString3
                choice3.textColor = color
                
                let attString4:NSMutableAttributedString = NSMutableAttributedString(string: c4[mc_question], attributes: [NSFontAttributeName:font!])
                attString4.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location:4,length:1))
                attString4.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location:16,length:1))
                attString4.setAttributes([NSFontAttributeName:fontSuper!,NSBaselineOffsetAttributeName:-4], range: NSRange(location:22,length:1))
                choice4.attributedText = attString4
                choice4.textColor = color
            }
            else {
                choice1.text = c1[mc_question]
                choice2.text = c2[mc_question]
                choice3.text = c3[mc_question]
                choice4.text = c4[mc_question]
            }
            mc1.selected = false
            mc2.selected = false
            mc3.selected = false
            mc4.selected = false
            mc1.setImage(UIImage(named: "radiobtn"), forState: .Normal)
            mc2.setImage(UIImage(named: "radiobtn"), forState: .Normal)
            mc3.setImage(UIImage(named: "radiobtn"), forState: .Normal)
            mc4.setImage(UIImage(named: "radiobtn"), forState: .Normal)
            scroller.flashScrollIndicators()
        }
        
    }
    
    var level:Int = 0
    
    // music
    var music: AVAudioPlayer!
    
    //alert for correct question
    let alert:UIAlertController = UIAlertController(title: "Correct!", message: "Very Nice Job", preferredStyle: UIAlertControllerStyle.Alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        answerField.delegate = self
        answerField.resignFirstResponder()
        
        // create alert for question answered correctly
        alert.addAction(UIAlertAction(title: "continue", style: .Default, handler: { action in
            self.transition()
        }))
        
        color = choice1.textColor!
        
        
        // get the saved question number
        Qnum = myDefaults.integerForKey(myLevel)
        mc_question = myDefaults.integerForKey(myChoices)
        
        
        myDefaults.setInteger(2, forKey: loadScreen)
        var path:String = ""
        
        if Qnum == 76 {
            path = NSBundle.mainBundle().pathForResource("TheBuilder.mp3", ofType: nil)!
        }
        else {
            path = NSBundle.mainBundle().pathForResource("HiddenAgenda.mp3", ofType: nil)!
        }
        
        // set the date at bottom of screen
        level = Qnum / 4
        let year = years[level]
        date.text = String(year)
        
        // play the music
        
        let url = NSURL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            music = sound
            music.numberOfLoops = -1
            sound.play()
        } catch {
            // couldn't load sound, so do nothing
        }
        // load the question
        printNextQ()
    }
    
    func correctAnswer() {
        Qnum = Qnum + 1
        message.text = ""
        myDefaults.setInteger(Qnum, forKey: myLevel)
        myDefaults.setInteger(mc_question, forKey: myChoices)
        
        self.presentViewController(alert, animated: true, completion: { () -> Void in})
    }
    
    var num_incorrect = 0
    
    func incorrectAnswer() {
        num_incorrect += 1
        // present message
        
        let popUp: PopUpViewController = storyboard?.instantiateViewControllerWithIdentifier("pop") as! PopUpViewController
        //var nav = UINavigationController(rootViewController: popUp)
        popUp.modalPresentationStyle = .Popover
        popUp.preferredContentSize = CGSizeMake(150, 100)
        let popoverController = popUp.popoverPresentationController
        popoverController?.delegate = self
        popoverController?.sourceView = self.view
        popoverController?.sourceRect = CGRect(x: 50, y: bag_image.center.y - 50, width: 1, height: 1)
        popoverController?.permittedArrowDirections = .Down
        var s: String = ""
        if num_incorrect == 1 {
            s = "So close!\nTry again.\nYou got this."
        }
        else {
            s = "You can always click on me for help!"
        }
        popUp.text = s
        presentViewController(popUp, animated: true, completion: nil)
    }
    
    
    //submit button response
    @IBAction func button(sender: UIButton) {
        
        var answer = answerField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        answer = answer!.lowercaseString
        
        switch Qnum {
        case 0:
            if mc2.selected   {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 1:
            if mc3.selected   {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 2:
            if mc3.selected   {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 3:
            if mc2.selected   {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 4:
            if mc1.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 5:
            if mc1.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 6:
            if mc4.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
               incorrectAnswer()
            }
        case 7:
            if mc4.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 8:
            if answer == "9" || answer == "nine" {
                //correct answer
                correctAnswer()
            }
            else {
                //wrong answer
                incorrectAnswer()
            }
        case 9:
            if answer == "24" || answer == "twenty-four" || answer == "twentyfour" {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 10:
            if answer == "15" || answer == "fifteen" {
                correctAnswer()
                
            }
            else {
                incorrectAnswer()
            }
        case 11:
            if answer == "20" || answer == "twenty"  {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 12:
            if answer == "15" || answer == "fifteen"{
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 13:
            if answer == "2"  || answer == "two"{
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 14:
            if answer == "12" || answer == "twelve" {
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 15:
            if mc4.selected   {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 16:
            if mc4.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 17:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 18:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 19:
            if mc1.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 20:
            if mc1.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 21:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 22:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 23:
            if mc1.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 24:
            if mc1.selected {
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 25:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 26:
            if mc3.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 27:
            if mc4.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 28:
            if mc4.selected {
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 29:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 30:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 31:
            if mc1.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 32:
            if mc4.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 33:
            if mc1.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 34:
            if mc1.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 35:
            if mc4.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 36:
            if mc1.selected {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 37:
            if mc3.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 38:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 39:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 40:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 41:
            if mc2.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
               incorrectAnswer()
            }
        case 42:
            if mc3.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 43:
            if mc3.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 44:
            if mc4.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 45:
            if mc2.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 46:
            if mc1.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 47:
            if mc1.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 48:
            if mc4.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 49:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 50:
            if mc2.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 51:
            if mc3.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
              incorrectAnswer()
            }
        case 52:
            if mc1.selected {
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 53:
            if mc2.selected  {
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 54:
            if mc3.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 55:
            if mc4.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 56:
            if mc3.selected {
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 57:
            if mc2.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 58:
            if mc3.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 59:
            if mc4.selected{
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 60:
            if answerField.text == "18" || answer == "eighteen"{
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 61:
            if mc3.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 62:
            if answerField.text == "3" || answer == "three" {
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 63:
            if answerField.text == "10" || answer == "ten" {
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
            
        case 64:
            if mc4.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 65:
            if mc4.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 66:
            if mc4.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 67:
            if mc2.selected  {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
            
        case 68:
            if mc2.selected   {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 69:
            if mc3.selected   {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 70:
            if mc2.selected   {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 71:
            if mc1.selected   {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 72:
            if mc3.selected   {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 73:
            if answerField.text == "2" || answer == "two"  {
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 74:
            if mc4.selected {
                mc_question = mc_question + 1
                correctAnswer()
            }
            else {
               incorrectAnswer()
            }
        case 75:
            if mc3.selected   {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        default:
            break
            
            
        }
        
        
    }
    
    
    // load info sheets
    @IBAction func openInfoSheet(sender: AnyObject) {
        if music != nil {
            music.stop()
            music = nil
        }
        let info_sheet:InfoViewController = storyboard?.instantiateViewControllerWithIdentifier("info") as! InfoViewController
        info_sheet.level = level + 1
        self.presentViewController(info_sheet, animated: false, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        // create pop-up
        if level == 0 {
            let popUp: PopUpViewController = storyboard?.instantiateViewControllerWithIdentifier("pop") as! PopUpViewController
            //var nav = UINavigationController(rootViewController: popUp)
            popUp.modalPresentationStyle = .Popover
            popUp.preferredContentSize = CGSizeMake(150, 100)
            let popoverController = popUp.popoverPresentationController
            popoverController?.delegate = self
            popoverController?.sourceView = self.view
            popoverController?.sourceRect = CGRect(x: 50, y: bag_image.center.y - 50, width: 1, height: 1)
            popoverController?.permittedArrowDirections = .Down
            presentViewController(popUp, animated: true, completion: nil)
        }
        
    }
    
    var mute: Bool = false
    
    @IBOutlet weak var mute_btn: UIButton!
    
    @IBAction func mutedButton(sender: AnyObject) {
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if music != nil {
            music.stop()
            music = nil
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .None
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.answerField.resignFirstResponder()
        return false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        questionField.setContentOffset(CGPointZero, animated: false)
        self.questionField.flashScrollIndicators()
        if mcView2.hidden == false {
            scroller.flashScrollIndicators()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

