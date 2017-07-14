//
//  ViewController.swift
//  Display
//
//  Created by Elliott Minns on 14/07/2017.
//  Copyright © 2017 Slack Technologies, Inc. All rights reserved.
//

import UIKit
import SlackTextViewController

class ViewController: SLKTextViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    self.leftButton.setImage(#imageLiteral(resourceName: "camera"), for: UIControlState())
    self.imageCloseButton.setImage(#imageLiteral(resourceName: "close_icon"), for: UIControlState())
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    textInputbar.textView.becomeFirstResponder()
    self.image = #imageLiteral(resourceName: "landscape")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func didPressLeftButton(_ sender: Any?) {
    super.didPressLeftButton(sender)
    
    let actionsheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    if UIImagePickerController.isCameraDeviceAvailable(.front) || UIImagePickerController.isCameraDeviceAvailable(.rear) {
      actionsheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
        self.loadImagePicker(for: .camera)
      }))
    }
    actionsheet.addAction(UIAlertAction(title: "Photos", style: .default, handler: { _ in
      self.loadImagePicker(for: .photoLibrary)
    }))
    actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    
    present(actionsheet, animated: true, completion: nil)
  }
  
}

extension ViewController {
  func loadImagePicker(for sourceType: UIImagePickerControllerSourceType) {
    let controller = UIImagePickerController()
    controller.delegate = self
    controller.sourceType = sourceType
    self.present(controller, animated: true, completion: nil)
  }
}



extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    picker.dismiss(animated: true)
    
    let image: UIImage?
    
    if let img = info[UIImagePickerControllerEditedImage] as? UIImage {
      image = img
    } else if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
      image = img
    } else {
      image = nil
    }
    
    if let image = image, let _ = UIImageJPEGRepresentation(image, 1.0) {
      self.image = image
    }
  }
}

