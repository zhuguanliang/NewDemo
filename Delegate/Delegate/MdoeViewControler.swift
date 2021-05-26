//
//  MdoeViewControlDelegate.swift
//  Delegate
//
//  Created by 朱官亮 on 2021/5/26.
//


import UIKit

class ModeViewController: UIViewController {
    var textF:UITextField?
    var delegate:MdoeViewControlDelegate?

    //点击事件
    @objc func btnOnClick(){
        let str = textF?.text
        print(str as Any)
        
        // 调用代理函数 改变label值
        self.delegate?.changeLabel(neString: str!)
        //返回RootView
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor=UIColor.cyan
        
        
        textF=UITextField()
        textF!.frame=CGRect(x: 110,y: 200,width: 100,height: 20)
        textF!.backgroundColor=UIColor.white
        textF!.borderStyle = .roundedRect
        
        
        let btn=UIButton(frame:CGRect(x: 110,y: 240,width: 100,height: 20))
        btn.backgroundColor=UIColor.orange
        btn.setTitle("返回上视图",for:.normal)
        //绑定事件
        btn.addTarget(self,action:#selector(ModeViewController.btnOnClick),for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(btn)
        self.view.addSubview(textF!)
        
        
        // Do any additional setup after loading the view.
    }
}
