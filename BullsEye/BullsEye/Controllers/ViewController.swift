//
//  ViewController.swift
//  BullsEye
//
//  Created by NGUYENLONGTIEN on 11/27/19.
//  Copyright © 2019 NGUYENLONGTIEN. All rights reserved.
//

import UIKit
var tragetValue = Int.random(in: 1...100)
var currentNumber:Int = 0
var scoreNumber:Int = 0
var roundNumber:Int = 1
var point:Int = 0
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupLayout()
        setupBottomButton()
    }
    let backgoundImage:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Background")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let containerViewTop:UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let containerViewBottom:UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let topLable:UILabel = {
        let lable = UILabel()
        lable.text = "Put the Bull's Eye as close as you can to: \(tragetValue) "
        //lable.backgroundColor = UIColor.red
        lable.textColor = UIColor.white
        lable.font = UIFont.boldSystemFont(ofSize: 20)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    let sliderValue:UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.setThumbImage(UIImage(named: "SliderThumb-Normal"), for: UIControl.State.normal)
        //slider.setMinimumTrackImage(UIImage(named: "SliderTrackLeft"), for: UIControl.State.normal)
        //slider.setMaximumTrackImage(UIImage(named: "SliderTrackRight"), for: UIControl.State.normal)
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    let leftSlideValue:UILabel = {
        let lable = UILabel()
        lable.text = "1"
        lable.textColor = .white
        lable.font = UIFont.boldSystemFont(ofSize: 18)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    let rightSlideValue:UILabel = {
        let lable = UILabel()
        lable.text = "100"
        lable.textColor = .white
        lable.font = UIFont.boldSystemFont(ofSize: 18)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    let hitMeButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setBackgroundImage(UIImage(named: "Button-Normal"), for: UIControl.State.normal)
        button.setTitle("Hit Me!", for: UIControl.State.normal)
        button.setTitleColor(UIColor(red: 96/255, green: 30/255, blue: 0, alpha: 1), for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleHitMeButton), for: UIControl.Event.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let startOverButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setImage(UIImage(named: "StartOverIcon")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), for: UIControl.State.normal)
        button.setBackgroundImage(UIImage(named: "SmallButton"), for: UIControl.State.normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleStartOverButton), for: UIControl.Event.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let scoreLable:UILabel = {
        let lable = UILabel()
        lable.text = "Score: \(scoreNumber)"
        lable.font = UIFont.boldSystemFont(ofSize: 16)
        lable.textColor = .white
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    let roundLable:UILabel = {
        let lable = UILabel()
        lable.text = "Round: \(roundNumber)"
        lable.font = UIFont.boldSystemFont(ofSize: 16)
        lable.textColor = .white
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    let infoButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setImage(UIImage(named: "InfoButton")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), for: UIControl.State.normal)
        button.contentMode = .scaleAspectFit
        button.setBackgroundImage(UIImage(named: "SmallButton"), for: UIControl.State.normal)
        button.addTarget(self, action: #selector(handleInfoButton), for: UIControl.Event.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    @objc func handleInfoButton(){
        let newScreen = AboutViewController()
        self.navigationController?.pushViewController(newScreen, animated: true)
    }
    @objc func handleStartOverButton(){
        startOverAgaint()
    }
    @objc func handleHitMeButton(){
        var title:String
        var difference:Int
        
        currentNumber = Int(sliderValue.value)
        if tragetValue > currentNumber{
            difference = tragetValue - currentNumber
        }else{
            difference = currentNumber - tragetValue
        }
        if difference == 0{
            title = "Perfect!"
            point = 200
        }else if difference < 5{
            title = "You almost had it!"
            point = 170
        }else if difference < 10{
            title = "Pretty good!"
            point = 120
        }else{
            title = "Not even close..."
            point = 100 - difference
        }
        
        let message = "Your score \(point) points"
        
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let btn_OK:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            self.startNewRound()
        }
        alert.addAction(btn_OK)
        present(alert, animated: true, completion: nil)
    }
    func startNewRound(){
        tragetValue = Int.random(in: 1...100)
        roundNumber = roundNumber + 1
        roundLable.text = "Round:\(roundNumber)"
        topLable.text = "Put the Bull's Eye as close as you can to: \(tragetValue) "
        sliderValue.setValue(1, animated: true)
        scoreNumber = scoreNumber + point
        self.scoreLable.text = "Score: \(scoreNumber)"
    }
    func startOverAgaint(){
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
        tragetValue = Int.random(in: 1...100)
        topLable.text = "Put the Bull's Eye as close as you can to: \(tragetValue) "
        roundNumber = 1
        roundLable.text = "Round:\(roundNumber)"
        sliderValue.setValue(1, animated: true)
        scoreNumber = 0
        scoreLable.text = "Score: \(scoreNumber)"
    }
}

