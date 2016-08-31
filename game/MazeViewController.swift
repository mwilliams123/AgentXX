//
//  MazeViewController.swift
//  game
//
//  Created by Megan Williams on 8/11/16.
//  Copyright © 2016 Megan Williams. All rights reserved.
//


// make tableView13 font smaller

import UIKit
import AVFoundation


class AlertView: NSObject {
    
    class func showAlert(view: UIViewController){
        
        let alert = UIAlertController(title: "So close!", message: "The rocket did not reach its destination", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: nil))
        dispatch_async(dispatch_get_main_queue(), {
            view.presentViewController(alert, animated: true, completion: nil)
        })
    }
}

class MazeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var select_choice1: UIButton!
    @IBOutlet weak var select_choice2: UIButton!
    @IBOutlet weak var select_choice3: UIButton!
    @IBOutlet weak var select_choice4: UIButton!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    
    @IBOutlet weak var table_view1: UITableView!
    @IBOutlet weak var table_view2: UITableView!
    @IBOutlet weak var table_view3: UITableView!
    @IBOutlet weak var table_view4: UITableView!
    
    
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    
    
    @IBOutlet weak var set1: UIView!
    
    
    @IBOutlet weak var maze_image: UIImageView!
    
    // second maze options
    @IBOutlet weak var set2: UIView!
    //buttons
    @IBOutlet weak var select_choice5: UIButton!
    @IBOutlet weak var select_choice7: UIButton!
    @IBOutlet weak var select_choice7_2: UIButton!
    @IBOutlet weak var select_choice8: UIButton!
    //labels
    @IBOutlet weak var label7_2: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    //views
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view8: UIView!
    //table views
    @IBOutlet weak var table_view5: UITableView!
    @IBOutlet weak var table_view6: UITableView!
    @IBOutlet weak var table_view7: UITableView!
    @IBOutlet weak var table_view8: UITableView!
    
    
    // third set of mazes
    @IBOutlet weak var set3: UIView!
    // views
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var view10: UIView!
   
    @IBOutlet weak var view11: UIView!
    // buttons
    @IBOutlet weak var select_choice9: UIButton!
    @IBOutlet weak var select_choice10: UIButton!
    @IBOutlet weak var select_choice11: UIButton!
    @IBOutlet weak var select_choice12: UIButton!
    // labels
    @IBOutlet weak var label10: UILabel!
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    //table views
    @IBOutlet weak var table_view9: UITableView!
    @IBOutlet weak var table_view10: UITableView!
    @IBOutlet weak var table_view11: UITableView!
    
    @IBOutlet weak var table_view19: UITableView!
    // set 4
    @IBOutlet weak var set4: UIView!
    //views
    
    @IBOutlet weak var view14: UIView!
    @IBOutlet weak var view13: UIView!
    // buttons
    @IBOutlet weak var select_choice15: UIButton!
    @IBOutlet weak var select_choice13: UIButton!
    @IBOutlet weak var select_choice14: UIButton!
    // labels
    @IBOutlet weak var label15: UILabel!
    @IBOutlet weak var label14: UILabel!
    @IBOutlet weak var label13: UILabel!
    //table views
    @IBOutlet weak var table_view12: UITableView!
    @IBOutlet weak var table_view13: UITableView!
    @IBOutlet weak var table_view14: UITableView!
    
    // final set
    @IBOutlet weak var set5: UIView!
    //views
    @IBOutlet weak var view16: UIView!
    @IBOutlet weak var view17: UIView!
    @IBOutlet weak var view18: UIView!
    // labels
    @IBOutlet weak var label17: UILabel!
    @IBOutlet weak var label16: UILabel!
    // buttons
    @IBOutlet weak var select_choice16: UIButton!
    @IBOutlet weak var select_choice17: UIButton!
    @IBOutlet weak var select_choice18: UIButton!
    @IBOutlet weak var select_choice19: UIButton!
    // table views
    @IBOutlet weak var table_view15: UITableView!
    @IBOutlet weak var table_view16: UITableView!
    @IBOutlet weak var table_view17: UITableView!
    @IBOutlet weak var table_view18: UITableView!
    
    // bonus set 
    @IBOutlet weak var set6: UIView!
    // buttons 
    @IBOutlet weak var select_choice20: UIButton!
    @IBOutlet weak var select_choice21: UIButton!
    @IBOutlet weak var select_choice22: UIButton!
    //table views
    @IBOutlet weak var table_view20: UITableView!
    @IBOutlet weak var table_view21: UITableView!
    @IBOutlet weak var table_view22: UITableView!
    
    
    // music
    var music: AVAudioPlayer!
    
    //to store the multiple-choice answer
    var num_selected1: Int = -1
    var num_selected2: Int = -1
    var num_selected3: Int = -1
    var num_selected4: Int = -1
    
    // to store options in the drop down list
    var data : NSArray = []
    var data2: NSArray = []
    var data3: NSArray = []
    var data4: NSArray = []
    var data5: NSArray = []
    var data6: NSArray = []
    
    // current level
    var level: Int = 0
    
    func displayText() {
        
        switch(level) {
        case 0:
            view4.hidden = true
            select_choice3.hidden = true
            label3.text = "Move UP"
            label2.hidden = true
            view1.hidden = true
            maze_image.image = UIImage(named: "maze0")
        case 1:
            select_choice4.hidden = true
            label4.text = "Move LEFT"
            label3.hidden = true
            label2.hidden = true
            view1.hidden = true
            maze_image.image = UIImage(named: "maze1")
        case 2:
            label4.hidden = true
            label3.hidden = true
            select_choice2.hidden = true
            label2.hidden = false
            label2.text = "Move UP"
            view1.hidden = false
            select_choice1.hidden = true
            label1.text = "Move Right"
            maze_image.image = UIImage(named: "maze2")
        case 3:
            label4.hidden = true
            label3.hidden = true
            label2.hidden = true
            label1.hidden = true
            maze_image.image = UIImage(named: "maze3")
        case 4:
            view8.hidden = true
            label7.text = "Repeat 2 times:"
            select_choice7.hidden = true
            label7_2.hidden = true
            view6.hidden = true
            view5.hidden = true
            maze_image.image = UIImage(named: "maze4")
        case 5:
            view8.hidden = true
            label7.hidden = true
            select_choice7_2.hidden = true
            view6.hidden = true
            view5.hidden = true
            maze_image.image = UIImage(named: "maze5")
        case 6:
            label8.hidden = true
            label7.text = "Repeat 3 times:"
            select_choice7.hidden = true
            label7_2.hidden = true
            view6.hidden = true
            view5.hidden = true
            maze_image.image = UIImage(named: "maze6")
        case 7:
            view8.hidden = true
            label7.hidden = true
            select_choice7_2.hidden = true
            maze_image.image = UIImage(named: "maze6")
        case 8:
            view9.hidden = true
            view10.hidden = true
            select_choice12.hidden = true
            view11.hidden = true
            label11.hidden = true
            maze_image.image = UIImage(named: "maze8")
        case 9:
            view9.hidden = true
            view10.hidden = true
            select_choice12.hidden = true
            label11.hidden = true
            maze_image.image = UIImage(named: "maze9")
        case 10:
            view10.hidden = true
            label10.text = "Until hit a wall"
            select_choice12.hidden = true
            select_choice11.hidden = true
            view11.hidden = true
            maze_image.image = UIImage(named: "maze10")
        case 11:
            view9.hidden = true
            select_choice11.hidden = true
            label10.hidden = true
            view11.hidden = true
            maze_image.image = UIImage(named: "maze11")
        case 12:
            view14.hidden = true
            select_choice14.hidden = true
            label13.hidden = true
            maze_image.image = UIImage(named: "maze13")
        case 13:
            view14.hidden = true
            label15.text = "Move LEFT"
            label14.text = "If the rocket cannot move left:"
            select_choice14.hidden = true
            label13.hidden = true
            maze_image.image = UIImage(named: "maze12")
        case 14:
            view14.hidden = true
            label14.hidden = true
            select_choice13.hidden = true
            label13.text = "Move DOWN"
            maze_image.image = UIImage(named: "maze13")
        case 15:
            view13.hidden = true
            label15.text = "Move LEFT"
            maze_image.image = UIImage(named: "maze12")
        case 16:
            view18.hidden = true
            maze_image.image = UIImage(named: "maze14")
        case 17:
            view16.hidden = true
            view17.hidden = true
            select_choice18.hidden = true
            select_choice19.hidden = true
            maze_image.image = UIImage(named: "maze15")
        case 18:
            view16.hidden = true
            view17.hidden = true
            label16.hidden = true
            label17.hidden = true
            maze_image.image = UIImage(named: "maze16")
        case 19:
            maze_image.image = UIImage(named: "maze17")
        default:
            break
        }
    }
    
    func loadNewLocation() {
        // stop music
        if music != nil {
            music.stop()
            music = nil
        }
        // load new view controller
        let cutScreen:SecondViewController = storyboard?.instantiateViewControllerWithIdentifier("first") as! SecondViewController
        level = level + 1
        cutScreen.level = level
        self.presentViewController(cutScreen, animated: false, completion: nil)
    }
    
    let alert:UIAlertController = UIAlertController(title: "Success!", message: "We've reached our destination!.", preferredStyle: UIAlertControllerStyle.Alert)
    let alert2:UIAlertController = UIAlertController(title: "So close!", message: "", preferredStyle: UIAlertControllerStyle.Alert)
    
    func dismissAlert() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create pop-up message
        alert.addAction(UIAlertAction(title: "Continue", style: .Default, handler: { action in
            self.loadNewLocation()
        }))
        
        alert2.addAction(UIAlertAction(title: "Try Again", style: .Default, handler: { action in
            self.dismissAlert()
        }))
        
        // play music
        let path = NSBundle.mainBundle().pathForResource("PhantomfromSpace.mp3", ofType: nil)!
        let url = NSURL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOfURL: url)
            music = sound
            music.numberOfLoops = -1
            sound.play()
        } catch {
            // do nothing
        }
        
        // allow buttons to have multiple lines
        select_choice19.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        select_choice14.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        
        // set the options
        self.data = ["Move LEFT", "Move RIGHT", "Move UP", "Move Down"]
        self.data2 = ["Repeat 1 time:", "Repeat 2 times:", "Repeat 3 times:", "Repeat 4 times"]
        self.data3 = ["1 time", "Until reach destination", "Until hit a wall", "Forever"]
        self.data4 = ["If the rocket can move right:", "If the rocket cannot move right:", "If the rocket can move up:", "If the rocket cannot move down"]
        self.data5 = ["If the rocket can move left:", "If the rocket can move right:", "If the rocket can move up:", "If the rocket can move down"]
        self.data6 = ["If you can move left:", "If you can move right:", "If you can move up:", "If you can move down"]
        
        table_view1.delegate = self
        table_view1.dataSource = self
        table_view1.hidden = true
        table_view1.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        
        table_view2.delegate = self
        table_view2.dataSource = self
        table_view2.hidden = true
        table_view2.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        
        table_view3.delegate = self
        table_view3.dataSource = self
        table_view3.hidden = true
        table_view3.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell3")
        
        table_view4.delegate = self
        table_view4.dataSource = self
        table_view4.hidden = true
        table_view4.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell4")
        
        table_view5.delegate = self
        table_view5.dataSource = self
        table_view5.hidden = true
        table_view5.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell5")
        
        table_view6.delegate = self
        table_view6.dataSource = self
        table_view6.hidden = true
        table_view6.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell6")
        
        table_view7.delegate = self
        table_view7.dataSource = self
        table_view7.hidden = true
        table_view7.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell7")
        
        table_view8.delegate = self
        table_view8.dataSource = self
        table_view8.hidden = true
        table_view8.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell8")
        
        table_view9.delegate = self
        table_view9.dataSource = self
        table_view9.hidden = true
        table_view9.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell9")
        
        table_view10.delegate = self
        table_view10.dataSource = self
        table_view10.hidden = true
        table_view10.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell10")
        
        table_view11.delegate = self
        table_view11.dataSource = self
        table_view11.hidden = true
        table_view11.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell11")
        
        table_view12.delegate = self
        table_view12.dataSource = self
        table_view12.hidden = true
        table_view12.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell12")
        
        table_view13.delegate = self
        table_view13.dataSource = self
        table_view13.hidden = true
        table_view13.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell13")
        
        table_view14.delegate = self
        table_view14.dataSource = self
        table_view14.hidden = true
        table_view14.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell14")
        
        table_view15.delegate = self
        table_view15.dataSource = self
        table_view15.hidden = true
        table_view15.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell15")
        
        table_view16.delegate = self
        table_view16.dataSource = self
        table_view16.hidden = true
        table_view16.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell16")
        
        table_view17.delegate = self
        table_view17.dataSource = self
        table_view17.hidden = true
        table_view17.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell17")
        
        table_view18.delegate = self
        table_view18.dataSource = self
        table_view18.hidden = true
        table_view18.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell18")
        
        table_view19.delegate = self
        table_view19.dataSource = self
        table_view19.hidden = true
        table_view19.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell19")
        
        table_view20.delegate = self
        table_view20.dataSource = self
        table_view20.hidden = true
        table_view20.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell20")
        
        table_view21.delegate = self
        table_view21.dataSource = self
        table_view21.hidden = true
        table_view21.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell21")
        
        table_view22.delegate = self
        table_view22.dataSource = self
        table_view22.hidden = true
        table_view22.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell22")
        
        let num = myDefaults.integerForKey(myLevel)
        level = num / 4
        
        if level < 4 {
            set2.hidden = true
            set3.hidden = true
            set4.hidden = true
            set5.hidden = true
            set6.hidden = true
        }
        else if level < 8 {
            set1.hidden = true
            set3.hidden = true
            set4.hidden = true
            set5.hidden = true
            set6.hidden = true
        }
        else if level < 12 {
            set1.hidden = true
            set2.hidden = true
            set4.hidden = true
            set5.hidden = true
            set6.hidden = true
        }
        else if level < 16 {
            set1.hidden = true
            set2.hidden = true
            set3.hidden = true
            set5.hidden = true
            set6.hidden = true
        }
        else if level < 19 {
            set1.hidden = true
            set2.hidden = true
            set3.hidden = true
            set4.hidden = true
            set6.hidden = true
        }
        else {
            set1.hidden = true
            set2.hidden = true
            set3.hidden = true
            set4.hidden = true
            set5.hidden = true
        }
        
        
        displayText()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // set the number of rows in the table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    //  display correct image/words in each row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->    UITableViewCell
    {
        
        var cell:UITableViewCell
        if tableView == self.table_view1 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view2 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell2", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view3 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell3", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view4 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell4", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view5 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell5", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view6 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell6", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view7 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell7", forIndexPath: indexPath)
            cell.textLabel!.text = self.data2[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view8 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell8", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view9 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell9", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view10 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell10", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view11 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell11", forIndexPath: indexPath)
            cell.textLabel!.text = self.data3[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 12)
        }
        else if tableView == self.table_view12 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell12", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view13 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell13", forIndexPath: indexPath)
            cell.textLabel!.text = self.data4[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 12)
        }
        else if tableView == self.table_view14 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell14", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view15 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell15", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view16 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell16", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view17 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell17", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view19 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell19", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view18 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell18", forIndexPath: indexPath)
            cell.textLabel!.text = self.data5[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 12)
        }
        else if tableView == self.table_view20 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell20", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view21 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell21", forIndexPath: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else {
            cell = tableView.dequeueReusableCellWithIdentifier("cell22", forIndexPath: indexPath)
            cell.textLabel!.text = self.data6[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 14)
        }
        
        // set the background image of the cell
        var image:UIImage?
        
        if tableView != self.table_view7 && tableView != self.table_view11 && tableView != self.table_view13 && tableView != self.table_view18 && tableView != self.table_view22 {
            image = UIImage(named: "back_red")
        }
        else if tableView == table_view13 || tableView == self.table_view18 || tableView == self.table_view22 {
            image = UIImage(named: "back_orange")
        }
        else {
            image = UIImage(named: "back_green")
        }
        let im_view = UIImageView(frame: cell.frame)
        im_view.image = image
        cell.backgroundView = im_view
        cell.backgroundColor = .clearColor()
        
        return cell
    }
    
    // set the button title / hide display when a row is selected
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if tableView == self.table_view1 {
            select_choice1.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view1.hidden = true
            num_selected1 = indexPath.row
        }
        else if tableView == self.table_view2 {
            select_choice2.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view2.hidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view3 {
            select_choice3.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view3.hidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view4 {
            select_choice4.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view4.hidden = true
            num_selected4 = indexPath.row
        }
        else if tableView == self.table_view5 {
            select_choice5.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view5.hidden = true
            num_selected1 = indexPath.row
        }
        else if tableView == self.table_view6 {
            select_choice7_2.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view6.hidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view7 {
            select_choice7.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view7.hidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view8 {
            select_choice8.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view8.hidden = true
            num_selected4 = indexPath.row
        }
        else if tableView == self.table_view9 {
            select_choice9.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view9.hidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view19 {
            select_choice10.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view19.hidden = true
            num_selected1 = indexPath.row
        }
        else if tableView == self.table_view10 {
            select_choice11.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view10.hidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view11 {
            select_choice12.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view11.hidden = true
            num_selected4 = indexPath.row
        }
        else if tableView == self.table_view12 {
            select_choice13.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view12.hidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view13 {
            select_choice14.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view13.hidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view14 {
            select_choice15.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view14.hidden = true
            num_selected4 = indexPath.row
        }
        else if tableView == self.table_view15 {
            select_choice16.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view15.hidden = true
            num_selected1 = indexPath.row
        }
        else if tableView == self.table_view16 {
            select_choice17.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view16.hidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view17 {
            select_choice18.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view17.hidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view18 {
            select_choice19.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view18.hidden = true
            num_selected4 = indexPath.row
        }
        else if tableView == self.table_view20 {
            select_choice20.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view20.hidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view21 {
            select_choice21.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view21.hidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view22 {
            select_choice22.setTitle(cell.textLabel?.text, forState: .Normal)
            table_view22.hidden = true
            num_selected4 = indexPath.row
        }
        //self.SelectSchool.setTitle(cell.textLabel?.text, forState: .Normal)
        //self.SelectSchoolView.hidden = true
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
    }
    
    //when click on the button hide or show the drop down
    
    @IBAction func openDropDown1(sender: AnyObject) {
        if level < 4 {
            
            if self.table_view1.hidden == true
            {
                self.table_view1.hidden = false
            }
            else
            {
                self.table_view1.hidden = true
            }
            self.table_view2.hidden = true
            self.table_view3.hidden = true
            self.table_view4.hidden = true
        }
        else if level < 8 {
            if table_view5.hidden == true {
                table_view5.hidden = false
            }
            else {
                table_view5.hidden = true
            }
            table_view6.hidden = true
            table_view7.hidden = true
            table_view8.hidden = true
        }
    }
    
    @IBAction func openDropDown2(sender: AnyObject) {
        if self.table_view2.hidden == true
        {
            self.table_view2.hidden = false
        }
        else
        {
            self.table_view2.hidden = true
        }
        self.table_view1.hidden = true
        self.table_view3.hidden = true
        self.table_view4.hidden = true
    }
    
    @IBAction func openDropDown3(sender: AnyObject) {
        if level < 4 {
            if self.table_view3.hidden == true
            {
                self.table_view3.hidden = false
            }
            else
            {
                self.table_view3.hidden = true
            }
            self.table_view1.hidden = true
            self.table_view2.hidden = true
            self.table_view4.hidden = true
        }
        else if level < 8 {
            if table_view6.hidden == true {
                table_view6.hidden = false
            }
            else {
                table_view6.hidden = true
            }
            table_view5.hidden = true
            table_view7.hidden = true
            table_view8.hidden = true
        }
        else if level < 12 {
            if table_view10.hidden == true {
                table_view10.hidden = false
            }
            else {
                table_view10.hidden = true
            }
            table_view11.hidden = true
            table_view9.hidden = true
        }
        else if level < 16 {
            if table_view14.hidden == true {
                table_view14.hidden = false
            }
            else {
                table_view14.hidden = true
            }
            table_view13.hidden = true
            table_view12.hidden = true
        }
        else {
            if table_view15.hidden == true {
                table_view15.hidden = false
            }
            else {
                table_view15.hidden = true
            }
            table_view16.hidden = true
            table_view17.hidden = true
            table_view18.hidden = true
        }
        
    }
    
    @IBAction func openDropDown4(sender: AnyObject) {
        if level < 4 {
            if self.table_view4.hidden == true
            {
                self.table_view4.hidden = false
            }
            else
            {
                self.table_view4.hidden = true
            }
            self.table_view1.hidden = true
            self.table_view2.hidden = true
            self.table_view3.hidden = true
        }
        else if level < 8 {
            if table_view8.hidden == true {
                table_view8.hidden = false
            }
            else {
                table_view8.hidden = true
            }
            table_view6.hidden = true
            table_view7.hidden = true
            table_view5.hidden = true
        }
        
    }
    
    @IBAction func openDropDown5(sender: AnyObject) {
        if level < 8 {
            if table_view7.hidden == true {
                table_view7.hidden = false
            }
            else {
                table_view7.hidden = true
            }
            table_view8.hidden = true
            table_view6.hidden = true
            table_view5.hidden = true
        }
        else if level < 12 {
            if table_view11.hidden == true {
                table_view11.hidden = false
            }
            else {
                table_view11.hidden = true
            }
            table_view10.hidden = true
            table_view9.hidden = true
        }
        else if level < 16 {
            if table_view13.hidden == true {
                table_view13.hidden = false
            }
            else {
                table_view13.hidden = true
            }
            table_view14.hidden = true
            table_view12.hidden = true
        }
        
    }
    
    @IBAction func openDropDown6(sender: AnyObject) {
        if level < 12 {
            if table_view9.hidden == true {
                table_view9.hidden = false
            }
            else {
                table_view9.hidden = true
            }
            table_view11.hidden = true
            table_view10.hidden = true
            table_view19.hidden = true
        }
    }
    
    @IBAction func openDropDown7(sender: AnyObject) {
        if table_view12.hidden == true {
            table_view12.hidden = false
        }
        else {
            table_view12.hidden = true
        }
        table_view14.hidden = true
        table_view13.hidden = true
    }
    
    @IBAction func openDropDown8(sender: AnyObject) {
        if table_view16.hidden == true {
            table_view16.hidden = false
        }
        else {
            table_view16.hidden = true
        }
        table_view15.hidden = true
        table_view17.hidden = true
        table_view18.hidden = true
    }
    
    @IBAction func openDropDown9(sender: AnyObject) {
        if table_view17.hidden == true {
            table_view17.hidden = false
        }
        else {
            table_view17.hidden = true
        }
        table_view16.hidden = true
        table_view15.hidden = true
        table_view18.hidden = true
    }
    
    @IBAction func openDropDown10(sender: AnyObject) {
        if table_view18.hidden == true {
            table_view18.hidden = false
        }
        else {
            table_view18.hidden = true
        }
        table_view16.hidden = true
        table_view17.hidden = true
        table_view15.hidden = true
    }
    
    @IBAction func openDrop15(sender: AnyObject) {
        if level < 12 {
            if table_view19.hidden == true {
                table_view19.hidden = false
            }
            else {
                table_view19.hidden = true
            }
            table_view11.hidden = true
            table_view10.hidden = true
            table_view9.hidden = true
        }
    }
    
    
    @IBAction func openDropDown20(sender: AnyObject) {
        if table_view20.hidden == true {
            table_view20.hidden = false
        }
        else {
            table_view20.hidden = true
        }
        table_view21.hidden = true
        table_view22.hidden = true
    }
    
    @IBAction func openDropDpwn21(sender: AnyObject) {
        if table_view21.hidden == true {
            table_view21.hidden = false
        }
        else {
            table_view21.hidden = true
        }
        table_view20.hidden = true
        table_view22.hidden = true
    }
    
    @IBAction func openDropDown21(sender: AnyObject) {
        if table_view22.hidden == true {
            table_view22.hidden = false
        }
        else {
            table_view22.hidden = true
        }
        table_view21.hidden = true
        table_view20.hidden = true
    }
    
    
    func correctAnswer() {
        
        // move rocket
        myDefaults.setInteger(0, forKey: loadScreen)
        
        
        // present alert
        self.presentViewController(alert, animated: false, completion: nil)
    }
    
    func incorrectAnswer() {
        AlertView.showAlert(self)
    }
    
    @IBAction func submitAnswer(sender: AnyObject) {
        // test drop down for correct answer
        
        switch(level){
        case 0:
            if num_selected2 == 1 {
                
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 1:
            if num_selected3 == 2 && num_selected2 == 1 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 2:
            if num_selected4 == 1 && num_selected3 == 2 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 3:
            if num_selected4 == 2 && num_selected3 == 0 && num_selected2 == 2 && num_selected1 == 1 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 4:
            if num_selected2 == 1 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 5:
            if num_selected3 == 2 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 6:
            if num_selected4 == 3 && num_selected2 == 1 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 7:
            if num_selected3 == 1 && num_selected1 == 1 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 8:
            if num_selected3 == 3 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 9:
            if num_selected1 == 1 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 10:
            if num_selected2 == 3 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 11:
            if num_selected4 == 2 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 12:
            if num_selected2 == 3 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 13:
            if num_selected2 == 2 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 14:
            if num_selected3 == 1 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 15:
            if num_selected4 == 2 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 16:
            if num_selected1 == 1 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 17:
            if num_selected2 == 1 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 18:
            if (num_selected2 == 2 && num_selected3 == 1 && num_selected4 == 1) || (num_selected2 == 1 && num_selected3 == 2 && num_selected4 == 2) {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
        case 19:
            if num_selected2 == 3 && num_selected3 == 2 && num_selected4 == 2 {
                correctAnswer()
            }
            else {
                incorrectAnswer()
            }
            
        default:
            break
        }
    }
    
    
    // mute! 
     var mute: Bool = false
    @IBOutlet weak var mute_btn: UIButton!
    
    @IBAction func clickedMute(sender: AnyObject) {
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
    
    
    
    
    // go to next screen
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
