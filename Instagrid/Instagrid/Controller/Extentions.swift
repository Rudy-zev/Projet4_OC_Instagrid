//
//  Extentions.swift
//  Instagrid
//
//  Created by Rudy on 18/06/2020.
//  Copyright © 2020 ruzev. All rights reserved.
//

import UIKit

// MARK: - Picker
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
