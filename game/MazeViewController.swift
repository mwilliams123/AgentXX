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
    
    class func showAlert(_ view: UIViewController){
        
        let alert = UIAlertController(title: "So close!", message: "The rocket did not reach its destination", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default, handler: nil))
        DispatchQueue.main.async(execute: {
            view.present(alert, animated: true, completion: nil)
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
            view4.isHidden = true
            select_choice3.isHidden = true
            label3.text = "Move UP"
            label2.isHidden = true
            view1.isHidden = true
            maze_image.image = UIImage(named: "maze0")
        case 1:
            select_choice4.isHidden = true
            label4.text = "Move LEFT"
            label3.isHidden = true
            label2.isHidden = true
            view1.isHidden = true
            maze_image.image = UIImage(named: "maze1")
        case 2:
            label4.isHidden = true
            label3.isHidden = true
            select_choice2.isHidden = true
            label2.isHidden = false
            label2.text = "Move UP"
            view1.isHidden = false
            select_choice1.isHidden = true
            label1.text = "Move Right"
            maze_image.image = UIImage(named: "maze2")
        case 3:
            label4.isHidden = true
            label3.isHidden = true
            label2.isHidden = true
            label1.isHidden = true
            maze_image.image = UIImage(named: "maze3")
        case 4:
            view8.isHidden = true
            label7.text = "Repeat 2 times:"
            select_choice7.isHidden = true
            label7_2.isHidden = true
            view6.isHidden = true
            view5.isHidden = true
            maze_image.image = UIImage(named: "maze4")
        case 5:
            view8.isHidden = true
            label7.isHidden = true
            select_choice7_2.isHidden = true
            view6.isHidden = true
            view5.isHidden = true
            maze_image.image = UIImage(named: "maze5")
        case 6:
            label8.isHidden = true
            label7.text = "Repeat 3 times:"
            select_choice7.isHidden = true
            label7_2.isHidden = true
            view6.isHidden = true
            view5.isHidden = true
            maze_image.image = UIImage(named: "maze6")
        case 7:
            view8.isHidden = true
            label7.isHidden = true
            select_choice7_2.isHidden = true
            maze_image.image = UIImage(named: "maze6")
        case 8:
            view9.isHidden = true
            view10.isHidden = true
            select_choice12.isHidden = true
            view11.isHidden = true
            label11.isHidden = true
            maze_image.image = UIImage(named: "maze8")
        case 9:
            view9.isHidden = true
            view10.isHidden = true
            select_choice12.isHidden = true
            label11.isHidden = true
            maze_image.image = UIImage(named: "maze9")
        case 10:
            view10.isHidden = true
            label10.text = "Until hit a wall"
            select_choice12.isHidden = true
            select_choice11.isHidden = true
            view11.isHidden = true
            maze_image.image = UIImage(named: "maze10")
        case 11:
            view9.isHidden = true
            select_choice11.isHidden = true
            label10.isHidden = true
            view11.isHidden = true
            maze_image.image = UIImage(named: "maze11")
        case 12:
            view14.isHidden = true
            select_choice14.isHidden = true
            label13.isHidden = true
            maze_image.image = UIImage(named: "maze13")
        case 13:
            view14.isHidden = true
            label15.text = "Move LEFT"
            label14.text = "If the rocket cannot move left:"
            select_choice14.isHidden = true
            label13.isHidden = true
            maze_image.image = UIImage(named: "maze12")
        case 14:
            view14.isHidden = true
            label14.isHidden = true
            select_choice13.isHidden = true
            label13.text = "Move DOWN"
            maze_image.image = UIImage(named: "maze13")
        case 15:
            view13.isHidden = true
            label15.text = "Move LEFT"
            maze_image.image = UIImage(named: "maze12")
        case 16:
            view18.isHidden = true
            maze_image.image = UIImage(named: "maze14")
        case 17:
            view16.isHidden = true
            view17.isHidden = true
            select_choice18.isHidden = true
            select_choice19.isHidden = true
            maze_image.image = UIImage(named: "maze15")
        case 18:
            view16.isHidden = true
            view17.isHidden = true
            label16.isHidden = true
            label17.isHidden = true
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
        let cutScreen:SecondViewController = storyboard?.instantiateViewController(withIdentifier: "first") as! SecondViewController
        level = level + 1
        cutScreen.level = level
        self.present(cutScreen, animated: false, completion: nil)
    }
    
    let alert:UIAlertController = UIAlertController(title: "Success!", message: "We've reached our destination!.", preferredStyle: UIAlertControllerStyle.alert)
    let alert2:UIAlertController = UIAlertController(title: "So close!", message: "", preferredStyle: UIAlertControllerStyle.alert)
    
    func dismissAlert() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create pop-up message
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { action in
            self.loadNewLocation()
        }))
        
        alert2.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { action in
            self.dismissAlert()
        }))
        
        // play music
        let path = Bundle.main.path(forResource: "PhantomfromSpace.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            music = sound
            music.numberOfLoops = -1
            sound.play()
        } catch {
            // do nothing
        }
        
        // allow buttons to have multiple lines
        select_choice19.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        select_choice14.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        
        // set the options
        self.data = ["Move LEFT", "Move RIGHT", "Move UP", "Move Down"]
        self.data2 = ["Repeat 1 time:", "Repeat 2 times:", "Repeat 3 times:", "Repeat 4 times"]
        self.data3 = ["1 time", "Until reach destination", "Until hit a wall", "Forever"]
        self.data4 = ["If the rocket can move right:", "If the rocket cannot move right:", "If the rocket can move up:", "If the rocket cannot move down"]
        self.data5 = ["If the rocket can move left:", "If the rocket can move right:", "If the rocket can move up:", "If the rocket can move down"]
        self.data6 = ["If you can move left:", "If you can move right:", "If you can move up:", "If you can move down"]
        
        table_view1.delegate = self
        table_view1.dataSource = self
        table_view1.isHidden = true
        table_view1.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        
        table_view2.delegate = self
        table_view2.dataSource = self
        table_view2.isHidden = true
        table_view2.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        
        table_view3.delegate = self
        table_view3.dataSource = self
        table_view3.isHidden = true
        table_view3.register(UITableViewCell.self, forCellReuseIdentifier: "cell3")
        
        table_view4.delegate = self
        table_view4.dataSource = self
        table_view4.isHidden = true
        table_view4.register(UITableViewCell.self, forCellReuseIdentifier: "cell4")
        
        table_view5.delegate = self
        table_view5.dataSource = self
        table_view5.isHidden = true
        table_view5.register(UITableViewCell.self, forCellReuseIdentifier: "cell5")
        
        table_view6.delegate = self
        table_view6.dataSource = self
        table_view6.isHidden = true
        table_view6.register(UITableViewCell.self, forCellReuseIdentifier: "cell6")
        
        table_view7.delegate = self
        table_view7.dataSource = self
        table_view7.isHidden = true
        table_view7.register(UITableViewCell.self, forCellReuseIdentifier: "cell7")
        
        table_view8.delegate = self
        table_view8.dataSource = self
        table_view8.isHidden = true
        table_view8.register(UITableViewCell.self, forCellReuseIdentifier: "cell8")
        
        table_view9.delegate = self
        table_view9.dataSource = self
        table_view9.isHidden = true
        table_view9.register(UITableViewCell.self, forCellReuseIdentifier: "cell9")
        
        table_view10.delegate = self
        table_view10.dataSource = self
        table_view10.isHidden = true
        table_view10.register(UITableViewCell.self, forCellReuseIdentifier: "cell10")
        
        table_view11.delegate = self
        table_view11.dataSource = self
        table_view11.isHidden = true
        table_view11.register(UITableViewCell.self, forCellReuseIdentifier: "cell11")
        
        table_view12.delegate = self
        table_view12.dataSource = self
        table_view12.isHidden = true
        table_view12.register(UITableViewCell.self, forCellReuseIdentifier: "cell12")
        
        table_view13.delegate = self
        table_view13.dataSource = self
        table_view13.isHidden = true
        table_view13.register(UITableViewCell.self, forCellReuseIdentifier: "cell13")
        
        table_view14.delegate = self
        table_view14.dataSource = self
        table_view14.isHidden = true
        table_view14.register(UITableViewCell.self, forCellReuseIdentifier: "cell14")
        
        table_view15.delegate = self
        table_view15.dataSource = self
        table_view15.isHidden = true
        table_view15.register(UITableViewCell.self, forCellReuseIdentifier: "cell15")
        
        table_view16.delegate = self
        table_view16.dataSource = self
        table_view16.isHidden = true
        table_view16.register(UITableViewCell.self, forCellReuseIdentifier: "cell16")
        
        table_view17.delegate = self
        table_view17.dataSource = self
        table_view17.isHidden = true
        table_view17.register(UITableViewCell.self, forCellReuseIdentifier: "cell17")
        
        table_view18.delegate = self
        table_view18.dataSource = self
        table_view18.isHidden = true
        table_view18.register(UITableViewCell.self, forCellReuseIdentifier: "cell18")
        
        table_view19.delegate = self
        table_view19.dataSource = self
        table_view19.isHidden = true
        table_view19.register(UITableViewCell.self, forCellReuseIdentifier: "cell19")
        
        table_view20.delegate = self
        table_view20.dataSource = self
        table_view20.isHidden = true
        table_view20.register(UITableViewCell.self, forCellReuseIdentifier: "cell20")
        
        table_view21.delegate = self
        table_view21.dataSource = self
        table_view21.isHidden = true
        table_view21.register(UITableViewCell.self, forCellReuseIdentifier: "cell21")
        
        table_view22.delegate = self
        table_view22.dataSource = self
        table_view22.isHidden = true
        table_view22.register(UITableViewCell.self, forCellReuseIdentifier: "cell22")
        
        let num = myDefaults.integer(forKey: myLevel)
        level = num / 4
        
        if level < 4 {
            set2.isHidden = true
            set3.isHidden = true
            set4.isHidden = true
            set5.isHidden = true
            set6.isHidden = true
        }
        else if level < 8 {
            set1.isHidden = true
            set3.isHidden = true
            set4.isHidden = true
            set5.isHidden = true
            set6.isHidden = true
        }
        else if level < 12 {
            set1.isHidden = true
            set2.isHidden = true
            set4.isHidden = true
            set5.isHidden = true
            set6.isHidden = true
        }
        else if level < 16 {
            set1.isHidden = true
            set2.isHidden = true
            set3.isHidden = true
            set5.isHidden = true
            set6.isHidden = true
        }
        else if level < 19 {
            set1.isHidden = true
            set2.isHidden = true
            set3.isHidden = true
            set4.isHidden = true
            set6.isHidden = true
        }
        else {
            set1.isHidden = true
            set2.isHidden = true
            set3.isHidden = true
            set4.isHidden = true
            set5.isHidden = true
        }
        
        
        displayText()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // set the number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    //  display correct image/words in each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->    UITableViewCell
    {
        
        var cell:UITableViewCell
        if tableView == self.table_view1 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view3 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view4 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view5 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view6 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell6", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view7 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell7", for: indexPath)
            cell.textLabel!.text = self.data2[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view8 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell8", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view9 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell9", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view10 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell10", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view11 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell11", for: indexPath)
            cell.textLabel!.text = self.data3[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 12)
        }
        else if tableView == self.table_view12 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell12", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view13 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell13", for: indexPath)
            cell.textLabel!.text = self.data4[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 12)
        }
        else if tableView == self.table_view14 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell14", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view15 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell15", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view16 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell16", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view17 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell17", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view19 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell19", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view18 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell18", for: indexPath)
            cell.textLabel!.text = self.data5[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 12)
        }
        else if tableView == self.table_view20 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell20", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else if tableView == self.table_view21 {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell21", for: indexPath)
            cell.textLabel!.text = self.data[indexPath.row] as? String
            cell.textLabel?.font = UIFont(name: "Menlo-Bold", size: 16)
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell22", for: indexPath)
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
        cell.backgroundColor = .clear
        
        return cell
    }
    
    // set the button title / hide display when a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell: UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if tableView == self.table_view1 {
            select_choice1.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view1.isHidden = true
            num_selected1 = indexPath.row
        }
        else if tableView == self.table_view2 {
            select_choice2.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view2.isHidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view3 {
            select_choice3.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view3.isHidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view4 {
            select_choice4.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view4.isHidden = true
            num_selected4 = indexPath.row
        }
        else if tableView == self.table_view5 {
            select_choice5.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view5.isHidden = true
            num_selected1 = indexPath.row
        }
        else if tableView == self.table_view6 {
            select_choice7_2.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view6.isHidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view7 {
            select_choice7.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view7.isHidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view8 {
            select_choice8.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view8.isHidden = true
            num_selected4 = indexPath.row
        }
        else if tableView == self.table_view9 {
            select_choice9.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view9.isHidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view19 {
            select_choice10.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view19.isHidden = true
            num_selected1 = indexPath.row
        }
        else if tableView == self.table_view10 {
            select_choice11.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view10.isHidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view11 {
            select_choice12.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view11.isHidden = true
            num_selected4 = indexPath.row
        }
        else if tableView == self.table_view12 {
            select_choice13.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view12.isHidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view13 {
            select_choice14.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view13.isHidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view14 {
            select_choice15.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view14.isHidden = true
            num_selected4 = indexPath.row
        }
        else if tableView == self.table_view15 {
            select_choice16.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view15.isHidden = true
            num_selected1 = indexPath.row
        }
        else if tableView == self.table_view16 {
            select_choice17.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view16.isHidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view17 {
            select_choice18.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view17.isHidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view18 {
            select_choice19.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view18.isHidden = true
            num_selected4 = indexPath.row
        }
        else if tableView == self.table_view20 {
            select_choice20.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view20.isHidden = true
            num_selected2 = indexPath.row
        }
        else if tableView == self.table_view21 {
            select_choice21.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view21.isHidden = true
            num_selected3 = indexPath.row
        }
        else if tableView == self.table_view22 {
            select_choice22.setTitle(cell.textLabel?.text, for: UIControlState())
            table_view22.isHidden = true
            num_selected4 = indexPath.row
        }
        //self.SelectSchool.setTitle(cell.textLabel?.text, forState: .Normal)
        //self.SelectSchoolView.hidden = true
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    //when click on the button hide or show the drop down
    
    @IBAction func openDropDown1(_ sender: AnyObject) {
        if level < 4 {
            
            if self.table_view1.isHidden == true
            {
                self.table_view1.isHidden = false
            }
            else
            {
                self.table_view1.isHidden = true
            }
            self.table_view2.isHidden = true
            self.table_view3.isHidden = true
            self.table_view4.isHidden = true
        }
        else if level < 8 {
            if table_view5.isHidden == true {
                table_view5.isHidden = false
            }
            else {
                table_view5.isHidden = true
            }
            table_view6.isHidden = true
            table_view7.isHidden = true
            table_view8.isHidden = true
        }
    }
    
    @IBAction func openDropDown2(_ sender: AnyObject) {
        if self.table_view2.isHidden == true
        {
            self.table_view2.isHidden = false
        }
        else
        {
            self.table_view2.isHidden = true
        }
        self.table_view1.isHidden = true
        self.table_view3.isHidden = true
        self.table_view4.isHidden = true
    }
    
    @IBAction func openDropDown3(_ sender: AnyObject) {
        if level < 4 {
            if self.table_view3.isHidden == true
            {
                self.table_view3.isHidden = false
            }
            else
            {
                self.table_view3.isHidden = true
            }
            self.table_view1.isHidden = true
            self.table_view2.isHidden = true
            self.table_view4.isHidden = true
        }
        else if level < 8 {
            if table_view6.isHidden == true {
                table_view6.isHidden = false
            }
            else {
                table_view6.isHidden = true
            }
            table_view5.isHidden = true
            table_view7.isHidden = true
            table_view8.isHidden = true
        }
        else if level < 12 {
            if table_view10.isHidden == true {
                table_view10.isHidden = false
            }
            else {
                table_view10.isHidden = true
            }
            table_view11.isHidden = true
            table_view9.isHidden = true
        }
        else if level < 16 {
            if table_view14.isHidden == true {
                table_view14.isHidden = false
            }
            else {
                table_view14.isHidden = true
            }
            table_view13.isHidden = true
            table_view12.isHidden = true
        }
        else {
            if table_view15.isHidden == true {
                table_view15.isHidden = false
            }
            else {
                table_view15.isHidden = true
            }
            table_view16.isHidden = true
            table_view17.isHidden = true
            table_view18.isHidden = true
        }
        
    }
    
    @IBAction func openDropDown4(_ sender: AnyObject) {
        if level < 4 {
            if self.table_view4.isHidden == true
            {
                self.table_view4.isHidden = false
            }
            else
            {
                self.table_view4.isHidden = true
            }
            self.table_view1.isHidden = true
            self.table_view2.isHidden = true
            self.table_view3.isHidden = true
        }
        else if level < 8 {
            if table_view8.isHidden == true {
                table_view8.isHidden = false
            }
            else {
                table_view8.isHidden = true
            }
            table_view6.isHidden = true
            table_view7.isHidden = true
            table_view5.isHidden = true
        }
        
    }
    
    @IBAction func openDropDown5(_ sender: AnyObject) {
        if level < 8 {
            if table_view7.isHidden == true {
                table_view7.isHidden = false
            }
            else {
                table_view7.isHidden = true
            }
            table_view8.isHidden = true
            table_view6.isHidden = true
            table_view5.isHidden = true
        }
        else if level < 12 {
            if table_view11.isHidden == true {
                table_view11.isHidden = false
            }
            else {
                table_view11.isHidden = true
            }
            table_view10.isHidden = true
            table_view9.isHidden = true
        }
        else if level < 16 {
            if table_view13.isHidden == true {
                table_view13.isHidden = false
            }
            else {
                table_view13.isHidden = true
            }
            table_view14.isHidden = true
            table_view12.isHidden = true
        }
        
    }
    
    @IBAction func openDropDown6(_ sender: AnyObject) {
        if level < 12 {
            if table_view9.isHidden == true {
                table_view9.isHidden = false
            }
            else {
                table_view9.isHidden = true
            }
            table_view11.isHidden = true
            table_view10.isHidden = true
            table_view19.isHidden = true
        }
    }
    
    @IBAction func openDropDown7(_ sender: AnyObject) {
        if table_view12.isHidden == true {
            table_view12.isHidden = false
        }
        else {
            table_view12.isHidden = true
        }
        table_view14.isHidden = true
        table_view13.isHidden = true
    }
    
    @IBAction func openDropDown8(_ sender: AnyObject) {
        if table_view16.isHidden == true {
            table_view16.isHidden = false
        }
        else {
            table_view16.isHidden = true
        }
        table_view15.isHidden = true
        table_view17.isHidden = true
        table_view18.isHidden = true
    }
    
    @IBAction func openDropDown9(_ sender: AnyObject) {
        if table_view17.isHidden == true {
            table_view17.isHidden = false
        }
        else {
            table_view17.isHidden = true
        }
        table_view16.isHidden = true
        table_view15.isHidden = true
        table_view18.isHidden = true
    }
    
    @IBAction func openDropDown10(_ sender: AnyObject) {
        if table_view18.isHidden == true {
            table_view18.isHidden = false
        }
        else {
            table_view18.isHidden = true
        }
        table_view16.isHidden = true
        table_view17.isHidden = true
        table_view15.isHidden = true
    }
    
    @IBAction func openDrop15(_ sender: AnyObject) {
        if level < 12 {
            if table_view19.isHidden == true {
                table_view19.isHidden = false
            }
            else {
                table_view19.isHidden = true
            }
            table_view11.isHidden = true
            table_view10.isHidden = true
            table_view9.isHidden = true
        }
    }
    
    
    @IBAction func openDropDown20(_ sender: AnyObject) {
        if table_view20.isHidden == true {
            table_view20.isHidden = false
        }
        else {
            table_view20.isHidden = true
        }
        table_view21.isHidden = true
        table_view22.isHidden = true
    }
    
    @IBAction func openDropDpwn21(_ sender: AnyObject) {
        if table_view21.isHidden == true {
            table_view21.isHidden = false
        }
        else {
            table_view21.isHidden = true
        }
        table_view20.isHidden = true
        table_view22.isHidden = true
    }
    
    @IBAction func openDropDown21(_ sender: AnyObject) {
        if table_view22.isHidden == true {
            table_view22.isHidden = false
        }
        else {
            table_view22.isHidden = true
        }
        table_view21.isHidden = true
        table_view20.isHidden = true
    }
    
    
    func correctAnswer() {
        
        // move rocket
        myDefaults.set(0, forKey: loadScreen)
        
        
        // present alert
        self.present(alert, animated: false, completion: nil)
    }
    
    func incorrectAnswer() {
        AlertView.showAlert(self)
    }
    
    @IBAction func submitAnswer(_ sender: AnyObject) {
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
    
    @IBAction func clickedMute(_ sender: AnyObject) {
        if mute {
            if music != nil {
                music.play()
            }
            self.mute_btn.setImage(UIImage(named: "mute"), for: UIControlState())
            mute = false
        }
        else {
            if music != nil {
                music.pause()
            }
            self.mute_btn.setImage(UIImage(named: "unmute"), for: UIControlState())
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
