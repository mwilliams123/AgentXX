//
//  BagViewController.swift
//  game
//
//  Created by Megan Williams on 7/16/16.
//  Copyright © 2016 Megan Williams. All rights reserved.
//

import UIKit

class BagViewController: UIViewController {

    
    var pieces:Int = 0
    
    var year: Int = 0
    
    @IBOutlet weak var numDisplay: UILabel!
    
    @IBOutlet weak var yearDisplay: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // display # pieces out of 20
        let stringNum:String = String(pieces)
        let displayString:String = stringNum + "/20"
        let imageString:String = "bag" + stringNum
        numDisplay.text = displayString
        image.image = UIImage(named: imageString)
        
        // display the year
        yearDisplay.text = String(year)
        
    }
    @IBOutlet weak var bag_image: UIButton!

    @IBAction func changeRobot(_ sender: AnyObject) {
    }
    
    @IBAction func closeBag(_ sender: AnyObject) {
        bag_image.setImage(UIImage(named: "new_bag"), for: UIControlState())
    }
    @IBAction func clickedBag(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickedBack(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
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
