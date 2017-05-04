//
//  BioViewController.swift
//  game
//
//  Created by Megan Williams on 8/26/16.
//  Copyright © 2016 Megan Williams. All rights reserved.
//

import UIKit

class BioViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var label: UITextView!
    
    
    var level:Int = 0
    
    let text1: [String] = [
        "Driven, Accomplished",
        "Child Prodigy, genius",
        "Curious, Intellectually-driven",
        "Rebellious",
        "Meticulous, Studious",
        "Pioneering, Courageous",
        "Prodigy, curious",
        "Highly intelligent, hard working",
        "Hard working, Independent, Passionate",
        "Brilliant, defiant",
        "Inventive, Intelligent, Creative",
        "Brave, Self-Advocate",
        "Determined, Studious",
        "Keen attention to detail, inventive",
        "Fearless, Highly Intelligent",
        "Daring, Courageous",
        "Highly Intelligent, Respected Leader",
        "Inquisitive, Persistent, Courageous",
        "Forward-thinking, Very bright",
        "Innovative, Adventurous"
    ]
    
    let text2: [String] = [
        "Computer Science, Leadership",
        "Calculus",
        "Fossil-hunting, geology",
        "Physics, Math",
        "Innovation",
        "Astronomy, Teaching",
        "Mathematics",
        "Chemistry, Physics",
        "Engineering",
        "Astronomy, Physics",
        "Engineering",
        "Teaching, Abstract Algebra",
        "Electrical Engineering, Math",
        "Electrical Engineering, Math",
        "Management, Technology",
        "Math",
        "Education, Math",
        "Writing, Science Journalism",
        "X-Ray Diffraction",
        "Chemistry, Engineering"
        
    ]
    
    let text3: [String] = [
        "Admiral Grace Hopper worked her way through an excellent education, earning a PhD from Yale University, and is now working on standardizing compilers and assisting with the UNIVAC. Perseverance has made Grace Hopper an admirable leader. A visionary, Admiral Hopper recognized early that a much wider audience could use computers if there were tools that were both programmer-friendly and application-friendly. To accomplish this, Admiral Hopper has encouraged programmers to collect and share common portions of programs. Setting aside her technological innovation, Admiral Hopper feels her greatest contribution to society is 'all the young people [she’s] trained.'",
        "Maria Agnesi is known as the “Seven-Tongued Orator”. Maria possessed an immense intellect, and was recognized by all who knew her as a child prodigy. She learned to speak Greek, Hebrew, Spanish, German, Latin, and Italian before her eleventh birthday.  As she grew older, Maria channeled her genius into studying mathematics, publishing works on differential and integral calculus by age 20. Maria is now 30, has just published two books, and spends all her free time learning more mathematics.",
        "Young Mary Anning takes long walks on the shore looking for shells to sell for money to help her family. Recently, while searching for shells with her brother, Mary discovered a large skull sticking out of the cliff. She chipped away at the rock until the skull was freed, and used what she had learned from reading books to popularize the concept of “fossils”. The skull they found belonged to a dinosaur. She shows great potential as a fossil-hunter.",
        "When Mary Somerville was ten, she was sent away to boarding school, where she became dissatisfied with the education she was receiving. Intellectually curious, Mary took initiative and began reading books to educate herself about mathematics. Because there were no math resources for women during this period, Mary relied on eavesdropping on conversations between her male classmates and their tutors. A few years ago, she heard a professor advise his students to read Euclid. Since then, she has been memorizing theorems to herself at night. When Mary’s mother found out about her studying, she instructed the servants to confiscate Mary’s candles so she could no longer study. Overcoming all of these obstacles, Mary has written several important papers, and just published a piece on Newton.",
        "Ada Lovelace was the first programmer. She was encouraged to study mathematics by her mother, a rare privilege given the prevalent sexism at this time. The chance for women to study rigorously and unrestrained translated into a brilliant mind. Ada published translations of the Analytical Engine (8,000 words), and added extensively detailed notes of her own (20,000 words). In her notes, Ada showed extraordinary skill, and her work demonstrated that complex equations could be broken down into much simpler ones. Impressed by Ada’s achievements, Charles Babbage invited her to his drawing room to demonstrate his machine.",
        "On a clear night in October, 29 year old Maria Mitchell saw a small blurry blue streak in the sky. She correctly identified the streak as a comet, will soon become famous as the first professional female astronomer in the United States. Maria is a particularly brave woman who all her life has refused to abide by the petty rules of sexism that dictated female behavior in the 19th century.  When Maria was offered a position on faculty at Vasser, she enjoyed teaching astronomy, but remained incredulous that her female students were not allowed to go outside at night. At Vasser, she instilled in her students was the power of observation, always asking them, 'do you rely on books for information, or do you observe for it yourself?'.",
        "Sonya’s introduction to mathematics was a chance event. When her family was re-papering walls of her home in Russia, the builders forgot to bring enough paper from St. Petersburg. So, instead of using the usual paper, they covered one bedroom with old transcriptions of Ostrogradsky’s lectures on differential and integral calculus. Young Sonya passed massive amounts of time in front of these walls trying to comprehend the strange figures on the paper. When she was 15, she took her first lesson in calculus and immediately grasped the concepts as the wallpaper she had memorized came rushing back. However, despite her prodigal abilities, she was not allowed in Russian universities. To overcome this challenge, she moved to Germany, where she still encountered setbacks. Ultimately, she overcame these barriers by convincing a great mathematician to be her mentor. He allowed her to study with him, giving her his hardest problems, which she solved quickly.\n\nLate in her life, Sonya heard that the French Royal Academy was holding a math competition. One additional requirement was that the writer submit a motto by which they could be identified. Sonya submitted a brilliant paper, which easily won, and her motto remains as poignant as it was then: 'Say what you know, do what you must, come what may.'",
        "Born in Poland, Marie graduated from an all-girls school with the Gold medal, which was the highest honor possible at the time. She traveled to France to get her college degree, where she studied during the day, and tutored at night to earn enough money for school tuition.  After passing all her exams, she found out she scored at the very top of the class. After excelling in the classroom, Marie began working on Uranium research. She worked with great skill, and was able to conclude from her observations that radiation was coming from the atoms of the Uranium themselves. She also found two other substances, which appeared to be much more radioactive than Uranium. She and her husband eventually announced the name of this other mineral--Radium. She was awarded two nobel prizes--one in Physics and one in Chemistry.",
        "Nora Stanton was an american civil engineer who studied engineering at Cornell University, and also took additional courses in mathematics and electricity at Columbia.  She ultimately became the first woman to join the American Society of Civil Engineers. Although it was uncommon during this time, Nora held a full-time career as an engineer. She was also an advocate for women’s right to vote, and fought for women’s rights while maintaining an outstanding career.  Blatch’s first husband turned out to be sexist, so she divorced him, and was known for encouraging women to 'fill man’s place, to surpass him in his own sphere.'",
        "Henrietta began volunteering for the Harvard observatory 17 years ago, and has since been appointed to permanent staff. Her male bosses refuse to let her--being a woman--pursue her own projects, and demand that she only research what the head of the observatory asks of her. Clever Henrietta does not let these tight restrictions affect her work; before she dies she will have cataloged half of the known stars in the 20th century.Known for meticulously counting stars on photographic plates, Henrietta noticed a pattern in her data; brighter stars appeared to have longer period. Her attention to detail and determination to extend beyond what men asked of her paved the path for her to make extremely valuable discovery entirely on her own initiative. Retrospective statements have praised her for having 'the most brilliant mind at Harvard'.",
        "Hedy Lamarr had already pursued acting as a career when she realized she had a natural talent for technology and mathematics. This happened when she  accompanied an arms manufacturer friend to his meetings with technicians and business partners, where she listened to their conversations  on military technology. Hedy drew on this knowledge to aid the American war effort after she realized that radio communications could be protected from the enemy by switching between frequencies in a pre-programmed pattern. She implemented her ingenious idea with a player piano to create the first ‘frequency-hopping-spread-spectrum’. She accomplished this extraordinary mental feat all while maintaining a successful career as an film actress.",
        "Amalie, called Emmy by those who know her, is a true mathematical genius. Her revolutionary mathematical formulas of relativity, and differential operators have changed abstract algebra altogether. Despite her intelligence and her doctorate, when Amalie applied to be a college lecturer, the universities refused to hire her as because she was a woman. Undeterred, Amalie convinced her friend Hilbert to advocate on her behalf, and in the meantime lectured when her father was sick. Despite his efforts, the University staff still refused to change their position, so Amalie cleverly lectured under Hilbert’s name. Because of her determination and hard work, Amalie eventually earned the prestigious title of Professor and began giving lectures in her own name.",
        "Edith is a brilliant inventor, and the first woman to earn an electrical engineering degree from MIT. She was orphaned at the age of 12, and began studying electrical engineering at Columbia at night. She designed what we know today as the ‘graphical calculator’--at the time it was named the Clarke calculator. She was an extraordinary electrical engineer, and was asked to lecture at the University of Texas, Austin. She accepted and became the first woman to teach engineering there. Her calculator, which earned a patent, earned her a place in the Inventor’s Hall of Fame, which includes the likes of Thomas Edison and Nikola Tesla.",
        "After Olive Dennis spent two summers studying civil engineering, she knew she had passion for the subject. With this in mind, she approached the president of the Baltimore and Ohio railroad and asked for an engineering job. Just last year, in 1920, Olive worked her way to a job promotion that put her in charge of attracting female passengers to the railroad line, because, ‘if women went on it, men would follow’. Olive was charged with hunting for ways to improve passengers experiences. She pioneered a number of innovations: seats that could recline, free paper towels, soap, drinking cups, individual window vents, and air conditioned compartments. Her ability to identify weak points in passenger trains allowed her to make railroad travel more comfortable in every way for the passenger.",
        "Adele Goldstine has made pivotal contributions to the development of computers.  Adele wrote the manual for the first electronic digital computer, the ENIAC ( the ‘Electronic Numerical Integrator and Computer’), and is in charge of training and recruiting women to the ENIAC project. Recruits  (who will soon number 80) performed manual calculations and operate the control pains Adele’s manual will help these women program the ENIAC.",
        "Betty Jennings boarded an overnight train last week from to Penn after seeing an ad for women mathematicians. She interviewed with Adele Goldstine’s husband, and quickly became one of the first recruits to the ENIAC project. The University of Pennsylvania hired her to work for the Army Ordnance at Aberdeen Proving Ground, a United States Army facility. Now, as a part of the first group of programmers for the ENIAC, Jennings is responsible for essentially working as a human computer, performing routinized math tasks.",
        "Marjorie Lee Brown is currently a researcher and lecturer at North Carolina Central University. She works with talented mathematics students, training them to pursue higher education like she did. She graduated cum laude with a degree in mathematics, and later earned a graduate degree in mathematics as well. Currently she is working on establishing a summer institute to provide continuing education resources to high school teachers.",
        "Rachel Carson is a scientist with a rare talent for writing. She had her first story published when she was ten. She trained as a marine biologist, but is now using her knowledge to write a book on environmental issues. Most importantly, Dr. Carson believes that pesticides need to be more tightly  regulated by the government. Her work will inspire a ban on one particular pesticide, DDT, and will lead to the creation of the U.S. Environmental Protection Act.",
        "Rosalind “Rosy” Franklin was an uncommonly intelligent young girl who knew she wanted to be a scientist.  She faced discouragement from her parents, but persisted in her studies and impressed scientist Marcel Mathieu so much that he offered her a job working with X-ray diffraction techniques. She was soon offered a 3-year research scholarship at King's College in London. It was here that she worked on X-ray crystallography, and took 2 high-resolution pictures of DNA, which Watson and Crick used to confirm the structure of DNA. They did not, however, give her the credit she deserved, and she was left out of the Nobel Prize. Despite all of the sexism she has faced, Franklin will receive publicity in the future as the fourth major contributing figure.",
        "Stephanie Kwolek entered textile chemistry by chance. She had planned to become a physician, but did not have the money for medical school, so she instead became a textile chemist the textile facility of DuPont. There, she made a revolutionary discovery: a new fiber, which was five times stronger than steel, and resistant to fire. The technology will be used in the future in bulletproof vests to save thousands of lives. After making this groundbreaking discovery, Stephanie will retire and begin training young women to work in science."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // load the image
        let string = String(level)
        let image_name = "bio" + string
        let im = UIImage(named: image_name)!
        
        // get width of screen
        let screenSize = UIScreen.main.bounds
        let width: CGFloat = screenSize.width - 44
        
        // scale image height to maintain aspect ratio
        let scale =  width / (im.size.width)
        let height = (im.size.height) * scale
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        // redraw images to fit screen width and scaled height
        UIGraphicsBeginImageContext(rect.size)
        im.draw(in: rect)
        let new_image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        image.frame = rect
        image.image = new_image
        
        
        // add in the text
        let font = UIFont(name: "AmericanTypewriter", size:17)
        
        let font2:UIFont? = UIFont(name: "AmericanTypewriter-Bold", size:17)
        let a1:NSMutableAttributedString = NSMutableAttributedString(string: "Psychology Profile: ")
        let a2:NSMutableAttributedString = NSMutableAttributedString(string: "Special Skills: ")
        let a3:NSMutableAttributedString = NSMutableAttributedString(string: "Background: ")
        a1.addAttribute(NSFontAttributeName, value: font2!, range: NSMakeRange(0, a1.length))
        a2.addAttribute(NSFontAttributeName, value: font2!, range: NSMakeRange(0, a2.length))
        a3.addAttribute(NSFontAttributeName, value: font2!, range: NSMakeRange(0, a3.length))

        let a4 = NSMutableAttributedString(string: text1[level] + "\n\n")
        let a5 = NSMutableAttributedString(string: text2[level] + "\n\n")
        let a6 = NSMutableAttributedString(string: text3[level])
        a4.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, a4.length))
        a5.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, a5.length))
        a6.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, a6.length))
        
        a1.append(a4)
        a1.append(a2)
        a1.append(a5)
        a1.append(a3)
        a1.append(a6)
        label.attributedText = a1
    }
    
    
    
    @IBAction func closeView(_ sender: AnyObject) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.setContentOffset(CGPoint.zero, animated: false)
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
