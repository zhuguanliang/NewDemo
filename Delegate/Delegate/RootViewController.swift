//
//  RootViewController.swift
//  Delegate
//
//  Created by 朱官亮 on 2021/5/26.
//


import UIKit
//实现ModeViewControlDelegate协议
class RootViewController: UIViewController,MdoeViewControlDelegate{
    var btn:UIButton?
    var label:UILabel?
    //实现协议中的方法
    func changeLabel(neString newString:String)  {
        self.label!.text = newString
    }
    @objc func btnOnClick(){
        print("Onclick")
        
        let modeView = ModeViewController()
        //设置modeView中的代理为RootViewController自身
        modeView.delegate=self
        //跳转到ModelView
        modeView.modalPresentationStyle = .fullScreen
        self.present(modeView,animated: true , completion: {
                                    print("OK")
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        label = UILabel()
        label!.frame = CGRect(x: 110, y: 200, width: 100, height: 20)
        label!.backgroundColor = UIColor.white
        label!.text = "你好！"
        label!.textAlignment = .center
        
        btn = UIButton()
        btn!.frame = CGRect(x: 110, y: 240, width: 100, height: 20)
        btn!.backgroundColor = UIColor.green
        btn!.setTitle("下一视图", for: .normal)
        btn!.addTarget(self, action:#selector(RootViewController.btnOnClick), for: .touchUpInside)
        self.view.addSubview(label!)
        self.view.addSubview(btn!)
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
