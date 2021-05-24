//
//  CreatNewCardVC.swift
//  Memoria
//
//  Created by Muhamed Hammam on 15/04/2021.
//

import UIKit

class CreatNewCardVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var ContainerVOut: UIView!
    
    @IBOutlet weak var FrontVOut: UIView!
    @IBOutlet weak var FrontTVOut: UITextView!
    @IBOutlet weak var FrontPlusImageOut: UIImageView!
    
    @IBOutlet weak var BackVOut: UIView!
    @IBOutlet weak var BackTVOut: UITextView!
    @IBOutlet weak var BackPlusImageOut: UIImageView!
    
    @IBOutlet weak var CardStatusVOut: UIView!
    
    @IBOutlet weak var CArdStatusTxtFOut: UITextField!
    @IBAction func CardStatusTFOut(_ sender: Any) {
    }
    
    //    @IBOutlet weak var PickerViewOut: UIPickerView!
    
    
    var PickerViewOut: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Collection View
        //         collectionsetup()
        
        //Picker View
        PickerViewOut = UIPickerView()
        PickerViewOut.dataSource = self
        PickerViewOut.delegate = self
        CArdStatusTxtFOut.inputView = PickerViewOut
        
        
    }
    
    
    
    @IBAction func BackBtn(_ sender: Any) {
        print("Back Pressed")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //PickerView
    var cardStatusArray = ["st 1","st 2"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cardStatusArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        cardStatusArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        CArdStatusTxtFOut.text  = cardStatusArray[row]
        PickerViewOut.endEditing(true)
        //        PickerViewOut.isHidden = true
    }
    
    
    // image picker in CollectionView
    @IBOutlet weak var collectionViewOut: UICollectionView!
    
    func collectionsetup() {
        collectionViewOut.delegate = self
        collectionViewOut.dataSource = self
        //        collectionViewOut.registerCell(cellClass: NewCardImageCVCell.self)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        showPhotoMenu()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewOut.dequeueReusableCell(withReuseIdentifier: "NewCardImageCVCell", for: indexPath)
        return cell
    }
    
    var AddIndex = 0
    @IBAction func AddImage(_ sender: UIButton) {
        if sender.tag == 1 {
            showPhotoMenu()
            AddIndex  = 0
        } else if sender.tag == 2 {
            showPhotoMenu()
            AddIndex = 1
        } else {
            
        }
    }
    
    
    var deleteIndex = 0
    @IBAction func DeleteImageBtn(_ sender: UIButton) {
        if sender.tag == 1{
            deleteIndex = 0
            deleteImage()
        }else if sender.tag == 2{
            deleteIndex = 1
            deleteImage()
        }
    }
    
    @IBOutlet weak var frontImageOut: UIImageView!
    @IBOutlet weak var backimageout: UIImageView!
    @IBOutlet weak var DeletFrontImageOut: UIButton!
    @IBOutlet weak var DeleteBackImageOut: UIButton!
    
    func deleteImage(){
        if deleteIndex == 0 {
            //            frontImageOut.image = UIImage(systemName: "")
            frontImageOut.isHidden = true
            DeletFrontImageOut.isHidden = true
        }else {
            //            backimageout.image = UIImage(systemName: "")
            backimageout.isHidden = true
            DeleteBackImageOut.isHidden = true
        }
    }
    
    // Pass Image To Your ImageView
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else { return }
        if AddIndex == 0 {
            frontImageOut.isHidden = false
            frontImageOut.image = image
            DeletFrontImageOut.isHidden = false
        } else {
            backimageout.isHidden = false
            backimageout.image = image
            DeleteBackImageOut.isHidden = false
        }
    }
    
    
    
}

// Image from Library or By Camera
extension UIViewController:
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    // MARK:- Image Helper Methods
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK:- Image Helper Methods
    func choosePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    // shoose library or camera
    func showPhotoMenu() {
        let alert = UIAlertController(title: nil, message: nil,
                                      preferredStyle: .actionSheet)
        
        let actCancel = UIAlertAction(title: "Cancel", style: .cancel,
                                      handler: nil)
        alert.addAction(actCancel)
        
        let actPhoto = UIAlertAction(title: "Take Photo",
                                     style: .default, handler: { (action) in
                                        self.takePhotoWithCamera()
                                        
                                     })
        alert.addAction(actPhoto)
        
        let actLibrary = UIAlertAction(title: "Choose From Library",
                                       style: .default, handler: { (action) in
                                        self.choosePhotoFromLibrary()
                                       })
        alert.addAction(actLibrary)
        
        present(alert, animated: true, completion: nil)
    }
}
