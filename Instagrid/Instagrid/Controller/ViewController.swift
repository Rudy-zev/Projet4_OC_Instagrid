//
//  ViewController.swift
//  Instagrid
//
//  Created by Rudy on 13/06/2020.
//  Copyright © 2020 ruzev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var composition =  Composition()
    
    var animation = Animation.shared
    
    @IBOutlet weak var compositionView: CompositionView!
    
    // Button choice composition style
    @IBOutlet weak var buttonCompo1: UIButton!
    @IBOutlet weak var buttonCompo2: UIButton!
    @IBOutlet weak var buttonCompo3: UIButton!
    // ImgView for insert picture select
    @IBOutlet weak var pic1: UIImageView!
    @IBOutlet weak var pic2: UIImageView!
    @IBOutlet weak var pic3: UIImageView!
    @IBOutlet weak var pic4: UIImageView!

    var picSelected: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonCompoManagement(button: .type3)
        
        // Création du geste pour le swipe
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeUpComposition(_: )))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftComposition(_: )))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
    }
    
    @objc func swipeUpComposition(_ sender: UISwipeGestureRecognizer) {
        // Vérifie que le téléphone est en mode portrait
        if UIDevice.current.orientation == .portrait {
            if sender.state == .ended {
                       compositionViewAnimationSendUp()
                   }
        }
    }
    
    @objc func swipeLeftComposition(_ sender: UISwipeGestureRecognizer) {
         // Vérifie que le téléphone est en mode portrait
         if UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight {
             if sender.state == .ended {
                        compositionViewAnimationSendLeft()
                    }
         }
     }
    
    // Animation de la vue composition lors de l'envoi
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
    
    // Animation de la vue composition lors de la fin de la selection ou l'annulation
    private func compositionViewAnimationEnd() {
        UIView.animate(withDuration: TimeInterval(animation.duration),
                        delay: 0,
                        animations: {
                        self.compositionView.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    // Permet la conertion de compositionView vers une UIImage (TODO Possible de le mettre dans les extention)
    private func convertViewToImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: compositionView.bounds.size)
        let image = renderer.image { ctx in compositionView.drawHierarchy(in: compositionView.bounds, afterScreenUpdates: true) }
        
        return image
    }
    
    private func share() {
        // Permet le share avec ce qu'on veux envoyer
        let activityVC = UIActivityViewController(activityItems: [convertViewToImage()], applicationActivities: nil)
        // Permet l'affichage de la pop up de selection
        activityVC.popoverPresentationController?.sourceView = self.view
        
        // Gestion du declanchement de l'animation suite à la selection ou l'annulation dans la pop up share
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
        buttonCompoManagement(button: .type1)
        compositionView.styleCompo = .style1
    }
    
    @IBAction func pressButtonCompo2() {
        buttonCompoManagement(button: .type2)
        compositionView.styleCompo = .style2
    }
    
    @IBAction func pressButtonCompo3() {
        buttonCompoManagement(button: .type3)
        compositionView.styleCompo = .style3
    }
    
    // Press button for add picture
    @IBAction func pressAddPic1() {
        addPicture(pic: 1)
    }
    
    @IBAction func pressAddPic2() {
       addPicture(pic: 2)
    }
    
    @IBAction func pressAddPic3() {
        addPicture(pic: 3)
    }
    
    @IBAction func pressAddPic4() {
        addPicture(pic: 4)
    }

    public func addPicture(pic: Int) {
        switch pic {
        case 1:
            picSelected = pic1
        case 2:
            picSelected = pic2
        case 3:
            picSelected = pic3
        case 4:
            picSelected = pic4
        default:
            break
        }
        
        showImagePickerController()
    }
    
    private func buttonCompoManagement(button: ButtonCompoSelect) {
        switch button {
        case .type1:
            buttonCompo1.imageView?.isHidden = false
            buttonCompo2.imageView?.isHidden = true
            buttonCompo3.imageView?.isHidden = true
            buttonCompo1.isUserInteractionEnabled = false
            buttonCompo2.isUserInteractionEnabled = true
            buttonCompo3.isUserInteractionEnabled = true
        case .type2:
            buttonCompo1.imageView?.isHidden = true
            buttonCompo2.imageView?.isHidden = false
            buttonCompo3.imageView?.isHidden = true
            buttonCompo1.isUserInteractionEnabled = true
            buttonCompo2.isUserInteractionEnabled = false
            buttonCompo3.isUserInteractionEnabled = true
        case .type3:
            buttonCompo1.imageView?.isHidden = true
            buttonCompo2.imageView?.isHidden = true
            buttonCompo3.imageView?.isHidden = false
            buttonCompo1.isUserInteractionEnabled = true
            buttonCompo2.isUserInteractionEnabled = true
            buttonCompo3.isUserInteractionEnabled = false
        }
        
    }
    
    enum ButtonCompoSelect {
        case type1, type2, type3
    }
}


