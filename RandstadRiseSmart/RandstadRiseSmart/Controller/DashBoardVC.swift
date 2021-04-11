//
//  ViewController.swift
//  RandstadRiseSmart
//
//  Created by Mangesh Shinde on 10/04/21.
//

import UIKit

class DashBoardVC: UIViewController {

    var buttonReusable = ReusabelButton()
    
    @IBOutlet weak var buttonEnable: UIButton!
    
    @IBAction func buttonEnableClicked(_ sender: UIButton) {
        self.buttonsEnableDisable(boolValue: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        buttonReusable = ReusabelButton(frame: CGRect(x: 20, y: self.view.frame.height - 100, width: (view.frame.size.width) - 40, height: 50))
        buttonReusable.configure(with: IconTextButtonViewModel(text: "Primary Button", icon: UIImage(systemName: "lock"), backgroundColor: Colors.buttonEnableBackgroundColor, textColor: .white))
        view.addSubview(buttonReusable)
        buttonReusable.addTarget(self, action: #selector(self.buttonClikced(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonClikced(sender:UIButton) {
        buttonsEnableDisable(boolValue: false)
    }
    
    func buttonsEnableDisable(boolValue : Bool) {
        buttonReusable.isEnabled = boolValue
        buttonEnable.isHidden = boolValue
    }

}


