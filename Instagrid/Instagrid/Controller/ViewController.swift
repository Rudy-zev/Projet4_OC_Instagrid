//
//  ViewController.swift
//  Instagrid
//
//  Created by Rudy on 13/06/2020.
//  Copyright © 2020 ruzev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animation = Animation.shared
    
    var buttonCompoType: ButtonCompoSelect = .type3
    
    @IBOutlet weak var compositionView: CompositionView!
    
    // Button choice composition style
    @IBOutlet weak var buttonCompo1: UIButton!
    @IBOutlet weak var buttonCompo2: UIButton!
    @IBOutlet weak var buttonCompo3: UIButton!
    
    // Img button select
    @IBOutlet weak var imgButtonCompo1: UIImageView!
    @IBOutlet weak var imgButtonCompo2: UIImageView!
    @IBOutlet weak var imgButtonCompo3: UIImageView!
    
    // ImgView for insert picture select
    @IBOutlet weak var pic1: UIImageView!
    @IBOutlet weak var pic2: UIImageView!
    @IBOutlet weak var pic3: UIImageView!
    @IBOutlet weak var pic4: UIImageView!

    var picSelected: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonCompoManagement(button: buttonCompoType)
        
        // Swipe gesture creation
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeUpComposition(_: )))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftComposition(_: )))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
    }
    
    
    @objc func swipeUpComposition(_ sender: UISwipeGestureRecognizer) {
        // Checks that the phone is in portrait mode
        if UIDevice.current.orientation != .landscapeLeft && UIDevice.current.orientation != .landscapeRight {
            if sender.state == .ended {
                       compositionViewAnimationSendUp()
                   }
        }
    }
    
    @objc func swipeLeftComposition(_ sender: UISwipeGestureRecognizer) {
         // Check that the phone is in landscape mode
         if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
             if sender.state == .ended {
                        compositionViewAnimationSendLeft()
                    }
         }
     }
    
    // Animation of the composition view when sending
    private func compositionViewAnimationSendUp() {
        UIView.animate(withDuration: TimeInterval(animation.duration),
                       delay: 0,
                       animations: {
            self.compositionView.transform = CGAffineTransform(translationX: 0, y: -self.view.bounds.height)
        }) { (success) in
            if success {
                self.share()
            }
        }
    }
    
    private func compositionViewAnimationSendLeft() {
        UIView.animate(withDuration: TimeInterval(animation.duration),
                       delay: 0,
                       animations: {
            self.compositionView.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
        }) { (success) in
            if success {
                self.share()
            }
        }
    }
    
    // Animation of the composition view at the end of the selection or cancellation
    private func compositionViewAnimationEnd() {
        UIView.animate(withDuration: TimeInterval(animation.duration),
                        delay: 0,
                        animations: {
                        self.compositionView.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    private func share() {
        // Allow sharing with what we want to send
        let activityVC = UIActivityViewController(activityItems: [convertViewToImage(view: compositionView)], applicationActivities: nil)
        // Allows the display of the selection pop-up
        activityVC.popoverPresentationController?.sourceView = self.view
        
        // Management of the triggering of the animation following the selection or cancellation in the pop up share
        activityVC.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            if !completed {
                self.compositionViewAnimationEnd()
                return
            }
            self.compositionViewAnimationEnd()
        }

        self.present(activityVC, animated: true, completion: nil)
    }

    // Change composition style and button composition style
    @IBAction func pressButtonCompo1() {
        buttonCompoType = .type1
        buttonCompoManagement(button: buttonCompoType)
        compositionView.styleCompo = .style1
    }
    
    @IBAction func pressButtonCompo2() {
        buttonCompoType = .type2
        buttonCompoManagement(button: buttonCompoType)
        compositionView.styleCompo = .style2
    }
    
    @IBAction func pressButtonCompo3() {
        buttonCompoType = .type3
        buttonCompoManagement(button: buttonCompoType)
        compositionView.styleCompo = .style3
    }
    
    // Press button for add picture
    @IBAction func pressAddPic1() {
        addPicture(pic: pic1)
    }
    
    @IBAction func pressAddPic2() {
       addPicture(pic: pic2)
    }
    
    @IBAction func pressAddPic3() {
        addPicture(pic: pic3)
    }
    
    @IBAction func pressAddPic4() {
        addPicture(pic: pic4)
    }

    public func addPicture(pic: UIImageView) {
    
        picSelected = pic
        pic.contentMode = .scaleAspectFill
    
        showImagePickerController()
    }
    
    private func buttonCompoManagement(button: ButtonCompoSelect) {
        imgButtonCompo1.isHidden = button != .type1
        imgButtonCompo2.isHidden = button != .type2
        imgButtonCompo3.isHidden = button != .type3
        buttonCompo1.isUserInteractionEnabled = button != .type1
        buttonCompo2.isUserInteractionEnabled = button != .type2
        buttonCompo3.isUserInteractionEnabled = button != .type3
            
    }
    
    enum ButtonCompoSelect {
        case type1, type2, type3
    }
}


