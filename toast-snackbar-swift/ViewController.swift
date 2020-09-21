//
//  ViewController.swift
//  Toast-snackbar
//
//  Created by Anjas Dwi on 21/09/20.
//  Copyright © 2020 Anjas Dwi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onClick(_ sender: Any) {
        showToast(message: "Hello World Hello World Hello World")
    }
    

}

extension ViewController {
    func showToast(message: String) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        let toastLbl = UILabel()
        toastLbl.text = message
        toastLbl.textAlignment = .center
        toastLbl.font = UIFont.systemFont(ofSize: 18)
        toastLbl.textColor = UIColor.white
        toastLbl.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLbl.numberOfLines = 0
        
        let textSize = toastLbl.intrinsicContentSize
        let labeHeight = (textSize.width/window.frame.width) * 30
        let labelWidth = min(textSize.width, window.frame.width - 40)
        let adjustHeight = max(labeHeight, textSize.height + 20)
        
        toastLbl.frame = CGRect(x:20, y: (window.frame.height - 90) - adjustHeight, width: labelWidth + 20, height: adjustHeight)
        toastLbl.center.x = window.center.x
        toastLbl.layer.cornerRadius = 10
        toastLbl.layer.masksToBounds = true
        
        window.addSubview(toastLbl)
        
        UIView.animate(withDuration: 3.0, animations: {toastLbl.alpha = 0}) { (_) in
            toastLbl.removeFromSuperview()
        }
    }
}

