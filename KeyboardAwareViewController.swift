//
//  KeyboardAwareViewController.swift
//  Testing
//
//  Created by Josip Jurić on 25/10/2017.
//  Copyright © 2017 Josip Jurić. All rights reserved.
//

import UIKit

protocol KeyboardAwareViewController where Self:UIViewController {
    var scrollView: UIScrollView! {get}
}

extension KeyboardAwareViewController{
  
    public func setupKeyboardListener(){
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidShow, object: nil, queue: nil) { (notification) in
            self.keyboardDidShow(notification)
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidHide, object: nil, queue: nil) { (notification) in
            self.keyboardDidHide(notification)
        }
    }
    
    private func keyboardDidShow(_ notification: Notification){
        let userInfo = notification.userInfo!
        let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect).size
        let keyboardHeight = keyboardSize.height
       
        if keyboardHeight > 0 {
            var contentInset:UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = keyboardHeight
            self.scrollView.contentInset = contentInset
            
            if let firstResponder = findFirstResponder(inView: self.view){
                let scrollPoint = CGPoint(x: 0, y: firstResponder.frame.minY)
                self.scrollView.setContentOffset(scrollPoint, animated: true)
            }
        }
    }
    
    private func keyboardDidHide(_ notification: Notification){
        UIView.animate(withDuration: 0.15) {
            self.scrollView.contentInset = UIEdgeInsets.zero
        }
    }
    
    public func findFirstResponder(inView view: UIView) -> UIView? {
        for subView in view.subviews{
            if subView.isFirstResponder {
                return subView
            }
            
            if let recursiveSubView = self.findFirstResponder(inView: subView) {
                return recursiveSubView
            }
        }
        
        return nil
    }
}



