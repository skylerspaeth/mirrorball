//
//  ViewController.swift
//  Mirror Ball
//
//  Created by Skyler Spaeth on 1/13/16.
//  Copyright © 2016 Skyler Spaeth. All rights reserved.
//

import UIKit
import SwiftHTTP

class ViewController: UIViewController {

    func showAlert(status: String, title:String) {
        let alertController = UIAlertController(title: status, message: title, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Back", style: .Cancel) { (action) in }
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true) {}
    }
    
    //Start Dance Party
    @IBAction func start(sender: AnyObject) {
        print("Turning On...")
        do {
            let opt = try HTTP.GET("http://10.0.1.15/api/on")
            opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    self.showAlert("Error", title: "Error starting dance party.")
                    return //also notify app of failure as needed
                }
                // response.data
                self.showAlert("Success", title: "Dance party started.")
            }
        } catch let error {
            print("got an error creating the request: \(error)")
            self.showAlert("Error", title: "Error starting dance party.")
        }
    }
    //Stop Dance Party
    @IBAction func stop(sender: AnyObject) {
        print("Turning Off...")
        do {
            let opt = try HTTP.GET("http://10.0.1.15/api/off")
            opt.start { response in
                if let err = response.error {
                    print("error: \(err.localizedDescription)")
                    self.showAlert("Error", title: "Error stopping dance party.")
                    return //also notify app of failure as needed
                }
                // response.data
                self.showAlert("Success", title: "Dance party stopped.")
            }
        } catch let error {
            print("got an error creating the request: \(error)")
            self.showAlert("Error", title: "Error stopping dance party.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}

