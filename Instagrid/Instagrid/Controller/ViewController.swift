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
    
    @IBOutlet weak var compositionView: CompositionView!
    
    //Button choice composition style
    @IBOutlet weak var buttonCompo1: UIButton!
    @IBOutlet weak var buttonCompo2: UIButton!
    @IBOutlet weak var buttonCompo3: UIButton!
    //ImgView for insert picture select
    @IBOutlet weak var pic1: UIImageView!
    @IBOutlet weak var pic2: UIImageView!
    @IBOutlet weak var pic3: UIImageView!
    @IBOutlet weak var pic4: UIImageView!

    var picSelected: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonCompo1.imageView?.isHidden = true
        buttonCompo2.imageView?.isHidden = true
        buttonCompo3.imageView?.isHidden = false
        
        //Création du geste pour le swipe
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(switchComposition(_: )))
        upSwipe.direction = .up
        
        view.addGestureRecognizer(upSwipe)
    }
    
    @objc func switchComposition(_ sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            share()
        }
    }
    
    private func convertViewToImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: compositionView.bounds.size)
        let image = renderer.image { ctx in compositionView.drawHierarchy(in: compositionView.bounds, afterScreenUpdates: true) }
        
        return image
    }
    
    private func share() {
        //Permet le share avec ce qu'on veux envoyer
        let activityVC = UIActivityViewController(activityItems: [convertViewToImage()], applicationActivities: nil)
        //Permet l'affichage de la pop up de selection
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }

    //Change composition style and button composition style
    @IBAction func pressButtonCompo1() {
        buttonCompo1.imageView?.isHidden = false
        buttonCompo2.imageView?.isHidden = true
        buttonCompo3.imageView?.isHidden = true
        compositionView.styleCompo = .style1
    }
    
    @IBAction func pressButtonCompo2() {
        buttonCompo1.imageView?.isHidden = true
        buttonCompo2.imageView?.isHidden = false
        buttonCompo3.imageView?.isHidden = true
        compositionView.styleCompo = .style2
    }
    
    @IBAction func pressButtonCompo3() {
        buttonCompo1.imageView?.isHidden = true
        buttonCompo2.imageView?.isHidden = true
        buttonCompo3.imageView?.isHidden = false
        compositionView.styleCompo = .style3
    }
    

    //Press button for add picture
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
}


