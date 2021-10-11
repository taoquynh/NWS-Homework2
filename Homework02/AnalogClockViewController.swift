//
//  AnalogClockViewController.swift
//  Homework02
//
//  Created by Taof on 11/10/2021.
//

import UIKit

class AnalogClockViewController: UIViewController {
    
    @IBOutlet weak var kimGiayView: UIView!
    @IBOutlet weak var kimPhutView: UIView!
    @IBOutlet weak var kimGioView: UIView!
    @IBOutlet weak var clockImageView: UIImageView!
    @IBOutlet weak var centerView: UIView!
    
    var timerClock: Timer!
    var currentDate = NSDate()
    var calendar = NSCalendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bringSubviewToFront(centerView)
        centerView.frame.size = CGSize(width: 10, height: 10)
        centerView.center = view.center
        centerView.layer.cornerRadius = centerView.bounds.width/2
        centerView.layer.masksToBounds = true
        centerView.backgroundColor = UIColor.black
        setUI()
        runDongHo()
    }
    
    func setUI(){
        
        kimGiayView.frame.size = CGSize(width: clockImageView.bounds.size.width/10 * 3.5, height: 2)
        kimGiayView.center = clockImageView.center
        
        kimPhutView.frame.size = CGSize(width: clockImageView.bounds.size.width/10 * 3, height: 4)
        kimPhutView.center = clockImageView.center
        
        kimGioView.frame.size = CGSize(width: clockImageView.bounds.size.width/10 * 2.5, height: 6)
        kimGioView.center = clockImageView.center
    }
    
    func setAnchorPoint(kimView: UIView, point: CGPoint){
        kimView.layer.anchorPoint = point
    }
    
    func getLocation(kimView: UIView, alpha: CGFloat){
        let r = kimView.bounds.size.height/2
        kimView.layer.cornerRadius = r // bo viền
        
        setAnchorPoint(kimView: kimView, point: CGPoint(x: 0, y: 0.5))
        kimView.transform = CGAffineTransform(rotationAngle: alpha)
    }
    
    func setTimer() -> (hour: CGFloat, minute: CGFloat, second: CGFloat){
        let hour = calendar.component(.hour, from: currentDate as Date)
        let minute = calendar.component(.minute, from: currentDate as Date)
        let second = calendar.component(.second, from: currentDate as Date)
        
        let hourInAboutSecond = hour*60*60 + minute*60 + second
        let minuteInAboutSecond = minute*60 + second
        
        let firstAlphaHour = CGFloat.pi * (2*CGFloat(hourInAboutSecond)/12/60/60 - 0.5)
        let firstAlphaMinute = CGFloat.pi * (2*CGFloat(minuteInAboutSecond)/60/60 - 0.5)
        let firstAlphaSecond = CGFloat.pi * (2*CGFloat(second) - 0.5)
        
        return (firstAlphaHour, firstAlphaMinute, firstAlphaSecond)
    }
    
    func runDongHo(){
        getLocation(kimView: kimGioView, alpha: setTimer().hour)
        getLocation(kimView: kimPhutView, alpha: setTimer().minute)
        getLocation(kimView: kimGiayView, alpha: setTimer().second)
        
        timerClock = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    
    @objc func runTimer(){
        let omegaGiay = CGAffineTransform(rotationAngle: CGFloat.pi*2/60)
        let omegaPhut = CGAffineTransform(rotationAngle: CGFloat.pi*2/60/60)
        let omegaGio = CGAffineTransform(rotationAngle: CGFloat.pi*2/60/60/12)
        
        kimGiayView.transform = kimGiayView.transform.concatenating(omegaGiay)
        kimPhutView.transform = kimPhutView.transform.concatenating(omegaPhut)
        kimGioView.transform = kimGioView.transform.concatenating(omegaGio)
    }
    
}
