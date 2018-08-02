//
//  ShareOnFbViewController.swift
//  FacebookOperations
//
//  Created by Prashant G on 8/2/18.
//  Copyright © 2018 MyOrg. All rights reserved.
//

import UIKit
import FacebookShare
import FBSDKShareKit

class ShareOnFbViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebookShareTap() {
        let content = FBSDKShareLinkContent()
        // content.contentTitle = "imageTitle"
        content.contentURL =  URL(string: "http://google.com/")
        // content.imageURL = URL(string: "imageURL")
        // content.contentDescription = "imageDescription"
        
        let dialog : FBSDKShareDialog = FBSDKShareDialog()
        dialog.fromViewController = self
        dialog.shareContent = content
        dialog.mode = FBSDKShareDialogMode.feedWeb
        dialog.show()
    }

}
