//
//  AthleteDetailsViewController.swift
//  Apptcom
//
//  Created by BinaryBoy on 10/19/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import UIKit
import Kingfisher

class AthleteDetailsViewController: UIViewController {

    var athlete:Athlete? = nil
    
    
    
    @IBOutlet var athleteImageView: UIImageView!
    @IBOutlet var briefLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let url = URL(string: (athlete?.image!)!)
        athleteImageView.kf.setImage(with: url)
        
        briefLabel.text = athlete?.brief
        self.title = athlete?.name
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
