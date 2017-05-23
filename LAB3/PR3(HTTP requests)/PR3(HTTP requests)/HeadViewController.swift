//
//  HeadViewController.swift
//  PR3(HTTP requests)
//
//  Created by Ion Damaschin on 5/19/17.
//  Copyright © 2017 Ion Damaschin. All rights reserved.
//

import UIKit
import Alamofire 

class HeadViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Alamofire.request("https://httpbin.org/headers").responseJSON { response in
            if(response.result.isSuccess) {
                if((response.response?.statusCode)! == 200){
                    self.textView.text = String.init(data: response.data!, encoding: .utf8)
                    
                } else {
                    print("Error!")
                }
            } else {
                print("Connection error!")
            }
        }

        
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
