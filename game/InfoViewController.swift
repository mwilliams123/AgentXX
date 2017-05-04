//
//  InfoViewController.swift
//  game
//
//  Created by Megan Williams on 8/24/16.
//  Copyright © 2016 Megan Williams. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var stack: UIStackView!
    
    @IBOutlet weak var scroller: UIScrollView!
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    // determines which images to load
    var level:Int = 0
    var maze:Bool = false
    var casefile:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // get images
        let stringNum:String = String(level)
        
        var imageString1:String
        var imageString2:String
        var imageString3:String
        var imageString4:String = ""
        
        
        if maze {
            // load maze help
            imageString1 = "infomaze" + stringNum + "_1"
            imageString2 = "infomaze" + stringNum + "_2"
            imageString3 = "infomaze" + stringNum + "_3"
            imageString4 = "infomaze" + stringNum + "_4"
        }
        
        else if casefile {
            imageString1 = "casefile1"
            imageString2 = "casefile2"
            imageString3 = "casefile3"
        }
        else {
            // load regular info sheets
            imageString1 = "info" + stringNum + "_1"
            imageString2 = "info" + stringNum + "_2"
            imageString3 = "info" + stringNum + "_3"
            imageString4 = "info" + stringNum + "_4"
            
        }
        
        // get width of screen
        let screenSize = UIScreen.main.bounds
        let width: CGFloat = screenSize.width
        
        // set width of stack view to width of screen
        stack.addConstraint(NSLayoutConstraint(item: stack, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: width))
        
        // load and scale images:
        
        //image 1
        let im1: UIImage? = UIImage(named: imageString1)
        // scale image height to maintain aspect ratio
        var scale1: CGFloat = 0
        var height1: CGFloat = 0
        if (im1 != nil){
            scale1 = width / (im1!.size.width)
            height1 = (im1!.size.height) * scale1
        }
        let rect1 = CGRect(x: 0, y: 0, width: width, height: height1)
        // redraw images to fit screen width and scaled height
        UIGraphicsBeginImageContext(rect1.size)
        im1?.draw(in: rect1)
        let new_image1 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        image1.frame = rect1
        image1.image = new_image1
        
        var height2: CGFloat = 0
        
        // image 2
        let im2 = UIImage(named: imageString2)
        let scale2 =  width / (im2?.size.width)!
        height2 = (im2?.size.height)! * scale2
        let rect2 = CGRect(x: 0, y: 0, width: width, height: height2)
        UIGraphicsBeginImageContext(rect2.size)
        im2?.draw(in: rect2)
        let new_image2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        image2.frame = rect2
        image2.image = new_image2
        
        
        var height3: CGFloat = 0
        
        // image 3
        if level != 12 || maze {
            let im3 = UIImage(named: imageString3)
            let scale3 =  width / (im3?.size.width)!
            height3 = (im3?.size.height)! * scale3
            let rect3 = CGRect(x: 0, y: 0, width: width, height: height3)
            UIGraphicsBeginImageContext(rect3.size)
            im3?.draw(in: rect3)
            let new_image3 = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            image3.frame = rect3
            image3.image = new_image3
        }
        
        
        // image 4
        var height4: CGFloat = 0
        
        // add fourth image if necessary
        if (level == 0 || (level == 4 && !maze) || level == 10 || level == 19) && !casefile {
            let im4 = UIImage(named: imageString4)
            let scale4 =  width / (im4?.size.width)!
            height4 = (im4?.size.height)! * scale4
            let rect4 = CGRect(x: 0, y: 0, width: width, height: height4)
            UIGraphicsBeginImageContext(rect4.size)
            im4?.draw(in: rect4)
            let new_image4 = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            image4.frame = rect4
            image4.image = new_image4
        }
        
        
        // let height of stack view be height of combined images
        let height = height1 + height2 + height3 + height4
        stack.addConstraint(NSLayoutConstraint(item: stack, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: height))
        
        //show the vertical scroll bar
        scroller.flashScrollIndicators()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // go to next screen
    @IBAction func next(_ sender: AnyObject) {
        if casefile {
            self.dismiss(animated: true, completion: nil)
        }
        else if maze {
            let maze_view:MazeViewController = storyboard?.instantiateViewController(withIdentifier: "maze") as! MazeViewController
            maze_view.level = level
            self.present(maze_view, animated: false, completion: nil)
        }
        else {
            let returnScreen:ViewController = storyboard?.instantiateViewController(withIdentifier: "main") as! ViewController
            self.present(returnScreen, animated: false, completion: nil)
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
