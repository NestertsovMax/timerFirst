//
//  ViewController.swift
//  timerFirst
//
//  Created by M1 on 02.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var switchВirectionChange: UISwitch!
    
    var timer: Timer?
    var counter = 0
    var isTimerStarted: Bool = false {
        didSet {
            updateStopButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        updateStopButton()
    }
    
    @objc func timerTickHandler() {
        switchВirectionChange.isOn ? (counter += 1) : (counter -= 1)
        updateCounterLabel()
    }
    
    
    @IBAction func switchChangeDirection(_ sender: UISwitch) {
        startTimer()
    }
    
    @IBAction func startTimerBotton(_ sender: UIButton) {
        startTimer()
    }
    
    func startTimer() {
        guard !isTimerStarted else { return }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTickHandler), userInfo: nil, repeats: true)
        isTimerStarted = true
    }
    
    @IBAction func stopTimerBotton(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
        counter = 0
        isTimerStarted = false
    }
    
    func updateCounterLabel() {
        counterLabel.text = "\(counter)"
    }
    
    func updateStopButton() {
        stopButton.isEnabled = isTimerStarted
    }
}

