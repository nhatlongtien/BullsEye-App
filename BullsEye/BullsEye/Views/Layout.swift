//
//  Layout.swift
//  BullsEye
//
//  Created by NGUYENLONGTIEN on 12/2/19.
//  Copyright © 2019 NGUYENLONGTIEN. All rights reserved.
//

import Foundation
import UIKit
extension ViewController{
    func setupBottomButton(){
        let startoverbuttonContainer:UIView = UIView()
        //startoverbuttonContainer.backgroundColor = .red
        let scoreLableContainer:UIView = UIView()
        //scoreLableContainer.backgroundColor = .blue
        let roundLableContainer:UIView = UIView()
        //roundLableContainer.backgroundColor = .yellow
        let infoButtonContainer:UIView = UIView()
        //infoButtonContainer.backgroundColor = .purple
        
        let bottomStackView:UIStackView = UIStackView(arrangedSubviews: [startoverbuttonContainer,scoreLableContainer,roundLableContainer,infoButtonContainer])
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        containerViewBottom.addSubview(bottomStackView)
        startoverbuttonContainer.addSubview(startOverButton)
        scoreLableContainer.addSubview(scoreLable)
        roundLableContainer.addSubview(roundLable)
        infoButtonContainer.addSubview(infoButton)
        
        //put constraint for bottomStackView
        bottomStackView.centerXAnchor.constraint(equalTo: containerViewBottom.centerXAnchor).isActive = true
        bottomStackView.widthAnchor.constraint(equalTo: containerViewBottom.widthAnchor,multiplier: 0.8).isActive = true
        bottomStackView.bottomAnchor.constraint(equalTo: containerViewBottom.bottomAnchor, constant: -30).isActive = true
        bottomStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //put anchor for startOverButton
        startOverButton.centerXAnchor.constraint(equalTo: startoverbuttonContainer.centerXAnchor).isActive = true
        startOverButton.topAnchor.constraint(equalTo: startoverbuttonContainer.topAnchor).isActive = true
        startOverButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        startOverButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //put anchor for scoreLable
        scoreLable.leftAnchor.constraint(equalTo: scoreLableContainer.leftAnchor).isActive = true
        scoreLable.topAnchor.constraint(equalTo: scoreLableContainer.topAnchor).isActive = true
        scoreLable.widthAnchor.constraint(equalTo: scoreLableContainer.widthAnchor).isActive = true
        scoreLable.heightAnchor.constraint(equalTo: scoreLableContainer.heightAnchor).isActive = true
        //put anchor for roundLable
        roundLable.leftAnchor.constraint(equalTo: roundLableContainer.leftAnchor).isActive = true
        roundLable.topAnchor.constraint(equalTo: roundLableContainer.topAnchor).isActive = true
        roundLable.widthAnchor.constraint(equalTo: roundLableContainer.widthAnchor).isActive = true
        roundLable.heightAnchor.constraint(equalTo: roundLableContainer.heightAnchor).isActive = true
        //put anchor for infoButton
        infoButton.centerXAnchor.constraint(equalTo: infoButtonContainer.centerXAnchor).isActive = true
        infoButton.topAnchor.constraint(equalTo: infoButtonContainer.topAnchor).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    func setupLayout(){
        view.addSubview(backgoundImage)
        view.addSubview(containerViewTop)
        view.addSubview(containerViewBottom)
        containerViewTop.addSubview(topLable)
        containerViewTop.addSubview(sliderValue)
        containerViewTop.addSubview(leftSlideValue)
        containerViewTop.addSubview(rightSlideValue)
        containerViewBottom.addSubview(hitMeButton)
        //but anchor for backgound image
        backgoundImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgoundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgoundImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        backgoundImage.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        //but anchor for containerViewTop
        containerViewTop.leftAnchor.constraint(equalTo: backgoundImage.leftAnchor).isActive = true
        containerViewTop.topAnchor.constraint(equalTo: backgoundImage.topAnchor).isActive = true
        containerViewTop.widthAnchor.constraint(equalTo: backgoundImage.widthAnchor).isActive = true
        containerViewTop.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        //but anchor for containerViewBottom
        containerViewBottom.leftAnchor.constraint(equalTo: containerViewTop.leftAnchor).isActive = true
        containerViewBottom.topAnchor.constraint(equalTo: containerViewTop.bottomAnchor).isActive = true
        containerViewBottom.widthAnchor.constraint(equalTo: backgoundImage.widthAnchor).isActive = true
        containerViewBottom.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2).isActive = true
        //put anchor for topLable
        topLable.topAnchor.constraint(equalTo: containerViewTop.topAnchor, constant: 35).isActive = true
        topLable.centerXAnchor.constraint(equalTo: containerViewTop.centerXAnchor).isActive = true
        //topLable.widthAnchor.constraint(equalToConstant: 200).isActive = true
        topLable.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //but anchor for sliderValue
        sliderValue.bottomAnchor.constraint(equalTo: containerViewTop.bottomAnchor, constant: -30).isActive = true
        sliderValue.centerXAnchor.constraint(equalTo: containerViewTop.centerXAnchor).isActive = true
        sliderValue.widthAnchor.constraint(equalTo: containerViewTop.widthAnchor, multiplier: 0.65).isActive = true
        sliderValue.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //but anchor for leftSlideValue
        leftSlideValue.leftAnchor.constraint(equalTo: sliderValue.leftAnchor, constant: -20).isActive = true
        leftSlideValue.centerYAnchor.constraint(equalTo: sliderValue.centerYAnchor).isActive = true
        leftSlideValue.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //but anchor for rightSlideValue
        rightSlideValue.leftAnchor.constraint(equalTo: sliderValue.rightAnchor, constant: 15).isActive = true
        rightSlideValue.centerYAnchor.constraint(equalTo: sliderValue.centerYAnchor).isActive = true
        rightSlideValue.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //but anchor for hitMeButton
        hitMeButton.topAnchor.constraint(equalTo: containerViewBottom.topAnchor).isActive = true
        hitMeButton.centerXAnchor.constraint(equalTo: containerViewBottom.centerXAnchor).isActive = true
        hitMeButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        hitMeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}
