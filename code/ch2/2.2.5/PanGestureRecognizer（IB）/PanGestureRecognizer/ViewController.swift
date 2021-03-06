//
//  ViewController.swift
//  PanGestureRecognizer
//
//  Created by 关东升 on 15/2/4.
//  本书网站：http://www.51work6.com
//  智捷课堂在线课堂：http://www.zhijieketang.com/
//  智捷课堂微信公共号：zhijieketang
//  作者微博：@tony_关东升
//  QQ：569418560 邮箱：eorient@sina.com
//  QQ交流群：162030268
//

import UIKit

class ViewController: UIViewController {
    
    var imageTrashFull : UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = NSBundle.mainBundle()
        let imageTrashFullPath = bundle.pathForResource("Blend Trash Full", ofType: "png")
        self.imageTrashFull = UIImage(contentsOfFile: imageTrashFullPath!)
        
        self.imageView.image = self.imageTrashFull

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func foundTap(sender: AnyObject) {
        
        let paramSender = sender as! UIPanGestureRecognizer
        NSLog("平移 state = %i", paramSender.state.rawValue)
        
        if (paramSender.state != .Ended &&
            paramSender.state != .Failed){
                let location = paramSender.locationInView(paramSender.view!.superview)
                paramSender.view!.center = location
        }
    }
    
}

