//
//  ViewController.swift
//  OriCamera
//
//  Created by Rebecca on 2019/10/7.
//  Copyright © 2019 Jasmine. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            print("本裝置俱拍照功能")
        }
        if UIImagePickerController.isCameraDeviceAvailable(.front){
            print("有前方鏡頭")
        }
        if UIImagePickerController.isCameraDeviceAvailable(.rear){
            print("有後方鏡頭")
        }
        if UIImagePickerController.isFlashAvailable(for: .front){
            print("有前方閃光燈")
        }
        if UIImagePickerController.isFlashAvailable(for: .rear){
            print("有後方閃光燈")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imagePicker = UIImagePickerController()
            //設定相片來源為相機
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            
            //開啟拍照介面
            show(imagePicker, sender: self)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //取得拍下來的照片
        let image = info[.originalImage] as! UIImage
        //將相片存檔
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        dismiss(animated: true, completion: nil)
    }


}

