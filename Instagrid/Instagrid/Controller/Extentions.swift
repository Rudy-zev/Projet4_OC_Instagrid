//
//  Extentions.swift
//  Instagrid
//
//  Created by Rudy on 18/06/2020.
//  Copyright © 2020 ruzev. All rights reserved.
//

import UIKit

// MARK: - Picker
// Allows the display of the choice of photo in the library
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePickerController() {
        let imagePickerControler = UIImagePickerController()
        imagePickerControler.delegate = self
        // Allows modification of the image after selection
        /*imagePickerControler.allowsEditing = true*/
        // Choose the source of the photo
        imagePickerControler.sourceType = .photoLibrary
        present(imagePickerControler, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Recovery of the selected photo
        /*if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            picSelected.image = editedImage
        }else */
        if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            picSelected.image = originalImage
        }
        
        // Close the picker after select a image
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Convert view to img 
extension ViewController {
    // Allows conversion of View composition to a UIImage
        func convertViewToImage(view: UIView) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let image = renderer.image { ctx in view.drawHierarchy(in: view.bounds, afterScreenUpdates: true) }
        
        return image
    }
}
