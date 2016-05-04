//
//  ViewController.swift
//  ImagePicker
//
//  Created by zaktech on 4/25/16.
//  Copyright © 2016 zaktech. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, RSKImageCropViewControllerDelegate {
    
    static let kPhotoDiameter = 130.0
    static let kPhotoFrameViewPadding = 2.0
    
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBInspectable var myText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectImageFromPhotoLibrary(sender: AnyObject) {
        
        //        let gestureRecognizer = sender as! UITapGestureRecognizer
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .PhotoLibrary
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    
    // MARK: ImagePickerViewController Delegate Methods
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        let imageCropperVC = RSKImageCropViewController(image: selectedImage, cropMode: .Circle)
        imageCropperVC.delegate = self
        self.navigationController?.pushViewController(imageCropperVC, animated: true)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: RSKImageCropViewController Delegate Methods
    
    func imageCropViewControllerDidCancelCrop(controller: RSKImageCropViewController) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func imageCropViewController(controller: RSKImageCropViewController, didCropImage croppedImage: UIImage, usingCropRect cropRect: CGRect){
        
        let selecteImage = croppedImage
        myImageView.image = selecteImage
        self.navigationController?.popViewControllerAnimated(true)
    }
}

// 1+5+25+4+4+3+1+2+1+1+6+11+4+3+5+7+5+6+1+3+1+7+5+6+11+4+7+56+18 = 213