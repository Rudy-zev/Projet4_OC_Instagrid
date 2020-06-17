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
    //Button add picture
    @IBOutlet weak var buttonAdd1: UIButton!
    @IBOutlet weak var buttonAdd2: UIButton!
    @IBOutlet weak var buttonAdd3: UIButton!
    @IBOutlet weak var buttonAdd4: UIButton!
    //Image add pic
    @IBOutlet weak var imgPic1: UIImageView!
    @IBOutlet weak var imgPic2: UIImageView!
    @IBOutlet weak var imgPic3: UIImageView!
    @IBOutlet weak var imgPic4: UIImageView!
    
    
    var picSelected: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            imgPic1.isHidden = true
        case 2:
            picSelected = pic2
            imgPic2.isHidden = true
        case 3:
            picSelected = pic3
            imgPic3.isHidden = true
        case 4:
            picSelected = pic4
            imgPic4.isHidden = true
        default:
            break
        }
        
        showImagePickerController()
    }
    
    public func switchComposition() {
        
    }
    
    public func swipeShare() {
        
    }
    
    public func share() {
        
    }
}

//Permet l'affichage du choix de la photo dans la librairy
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePickerController() {
        let imagePickerControler = UIImagePickerController()
        imagePickerControler.delegate = self
        //Permet la modification de l'image après la selection
        imagePickerControler.allowsEditing = true
        //Permet de choisir la source de la photo
        imagePickerControler.sourceType = .photoLibrary
        present(imagePickerControler, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //Récuperation de la photo choisi
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            picSelected.image = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            picSelected.image = originalImage
        }
        
        //Close the picker after select a image
        dismiss(animated: true, completion: nil)
    }
}

