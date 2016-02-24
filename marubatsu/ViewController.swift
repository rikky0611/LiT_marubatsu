//
//  ViewController.swift
//  marubatsu
//
//  Created by 荒川陸 on 2016/02/22.
//  Copyright © 2016年 riku_arakawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var board = Board()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        let boardSize = CGSizeMake(screenWidth,screenHeight)
        let boardOrigin = CGPointMake(0,(screenHeight - boardSize.height)/2)
        
        let boardView = UIView()
        boardView.frame.origin = boardOrigin
        boardView.frame.size = boardSize
        self.view.addSubview(boardView)
        
        let btnSize = boardSize.width/3
        
        for var y = 0; y<3; y++ {
            for var x = 0;x<3;x++ {
                let btn = UIButton(frame: CGRectMake(btnSize * CGFloat(x),btnSize * CGFloat(y),btnSize, btnSize))
                btn.layer.borderWidth = 2.0
                btn.layer.borderColor = UIColor.grayColor().CGColor
                boardView.addSubview(btn)
                
                btn.tag = y*3 + x
                btn.addTarget(self, action:Selector("onBtnClick:") , forControlEvents: .TouchUpInside)
                
            }
        }
    }
    
    func onBtnClick(btn : UIButton){
        if board.canPut(btn.tag) != true{
            return
        }
        btn.setTitle("\(board.currentPlayer())", forState: .Normal)
        btn.setTitleColor(UIColor.redColor(), forState: .Normal)
        board.put(btn.tag)
        
        let winner = board.winner()
        if winner != .Blank{
            NSLog("\(winner)の勝ち！")
            return
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
