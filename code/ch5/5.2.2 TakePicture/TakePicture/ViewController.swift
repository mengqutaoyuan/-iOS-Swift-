//
//  ViewController.swift
//  TakePicture
//
//  Created by 关东升 on 15/2/6.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import UIKit

class ViewController: UIViewController,
        UIImagePickerControllerDelegate,
        UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takeImage(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            self.imagePicker = UIImagePickerController()
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .Camera
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        } else {
            NSLog("照相机不可用。")
        }
    }
    
    // MARK: --实现UIImagePickerControllerDelegate协议
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = originalImage
        self.imageView.contentMode = .ScaleAspectFill
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: --实现UINavigationControllerDelegate协议
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        NSLog("图像选择器将要显示。")
    }
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        NSLog("图像选择器显示结束。")
    }
}

