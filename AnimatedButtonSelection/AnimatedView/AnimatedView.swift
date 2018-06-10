//
//  AnimatedView.swift
//  AnimatedButtonSelection
//
//  Created by Harpreet on 10/06/18.
//  Copyright © 2018 Animators. All rights reserved.
//

import UIKit


protocol AnimatedButtonsProtocol {
    func buttonSelectedAtIndex(index:Int)
}

class AnimatedView: UIView {
    
    @IBOutlet weak var backgroundOverlay: UIView!
    var backgroundOverlayFrame:CGRect!
    var animatedDelegate:AnimatedButtonsProtocol?
    var repeatBtnCenter:CGPoint!
       var playListBtnCenter:CGPoint!
       var shuffleBtnCenter:CGPoint!
    

    @IBOutlet weak var repeatBtn: RoundButton!
    
    @IBOutlet weak var playBtn: RoundButton!
    @IBOutlet weak var playListBtn: RoundButton!
    @IBOutlet weak var shuffleBtn: RoundButton!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
       
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
     commitInit()
        
    }
        
    
    private func commitInit(){
        
      Bundle.main.loadNibNamed("AnimatedView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
        repeatBtnCenter = repeatBtn.center
        playListBtnCenter = playListBtn.center
        shuffleBtnCenter = shuffleBtn.center
        
        backgroundOverlayFrame = backgroundOverlay.frame
        
        backgroundOverlay.frame = playBtn.frame
        backgroundOverlay.center = playBtn.center
        
        backgroundOverlay.alpha = 0.0
        
        backgroundOverlay.layer.cornerRadius = 5.0
        backgroundOverlay.layer.masksToBounds = true

        
        playListBtn.center = playBtn.center
        shuffleBtn.center = playBtn.center
        repeatBtn.center = playBtn.center
        
       playListBtn.alpha = 0.0
        shuffleBtn.alpha = 0.0
        repeatBtn.alpha = 0.0
        

        
    }
    
    
    func updateBackground(){
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.backgroundOverlay.alpha = 1.0
             self.backgroundOverlay.frame = self.backgroundOverlayFrame
        }, completion: nil)
        
       
        
        
    }
    
    
    func updateBackgroundAgain(){
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.backgroundOverlay.alpha = 0.0
            self.backgroundOverlay.frame = self.playBtn.frame
            self.backgroundOverlay.center = self.playBtn.center
        }, completion: nil)
        
        
        
        
    }
    
   
    @IBAction func playBtnTapped(_ sender: RoundButton) {
        
        animatedDelegate?.buttonSelectedAtIndex(index:sender.tag)
        
        
        if shuffleBtn.center == shuffleBtnCenter {
            
            UIView.animate(withDuration:0.3, animations: {
                
                self.playListBtn.alpha = 0.0
                self.shuffleBtn.alpha = 0.0
                self.repeatBtn.alpha = 0.0
                
                
                self.playListBtn.center = self.playBtn.center
                self.shuffleBtn.center = self.playBtn.center
                self.repeatBtn.center = self.playBtn.center
                
           //   self.updateBackgroundAgain()
                
            })
            
            
            
            
            
        }else{
            
            UIView.animate(withDuration: 0.3, animations: {
                self.playListBtn.alpha = 1.0
                self.shuffleBtn.alpha = 1.0
                self.repeatBtn.alpha = 1.0
                
      
                
                
                self.repeatBtn.center = self.repeatBtnCenter
                self.playListBtn.center = self.playListBtnCenter
                self.shuffleBtn.center = self.shuffleBtnCenter
          //  self.updateBackground()
            })
            
            
            
        }
        
        
        
        
    }
        
    }
    

