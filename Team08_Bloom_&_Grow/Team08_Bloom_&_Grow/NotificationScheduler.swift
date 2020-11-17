//
//  NotificationScheduler.swift
//  GreenHouse
//
//  Created by student on 4/1/20.
//  Copyright © 2020 S531823. All rights reserved.
//
import Foundation
import UserNotifications
//This class primary purpose is to schedule the notifications based on the user requirement
class NotificationScheduler  {
    private var waterFrequancy : Int
    private var waterTimeFrame : String
    private var sunlightDuration : Int
    private var sunlightTimeFrame: String
    
    init(waterFrequancy : Int, waterTimeFrame : String,sunlightDuration : Int, sunlightTimeFrame: String) {
        self.waterFrequancy = waterFrequancy
        self.waterTimeFrame = waterTimeFrame
        self.sunlightDuration = sunlightDuration
        self.sunlightTimeFrame = sunlightTimeFrame
    }
    // requesting authorization for sending notifications if succeed then respective notifications are scheduled
    func requestPermission()  {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("permission granted")
                self.waterSchedule()
                print("scheduling sunlight remainder notifications")
                self.sunlightSchedule()
                print("sunLight remainder added")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    //scheduling the remainder for pouring water in specified frequency
    func waterSchedule() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        let content = UNMutableNotificationContent()
        content.title = "Pour Water to Plant"
        content.body = "Remainder for pouring water"
        content.categoryIdentifier = "Remainder"
        content.sound = .default
        var dateComponents = DateComponents()
        //switch between week and day of pickview
        switch self.waterTimeFrame {
        case "day":
            let  time = 24 / self.waterFrequancy
            var tempHour = 1
            for _ in 1...self.waterFrequancy
            {
                dateComponents.hour = tempHour
                dateComponents.minute = 00
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) {(error) in
                    if let error = error {
                        print("error: \(error)")
                    } else {
                        print("water remainder added for day pick")
                    }
                }
                tempHour += time
                if tempHour >= 24
                {
                    tempHour = 0
                }
                //print("completeday" + String(tempHour))
            }
        default:
            var day : Double = Double(7.0 / Double(self.waterFrequancy))
            let check : Int = 7 / self.waterFrequancy
            if day-Double(check) > 0
            {
                day+=1
            }
            var tempDay = 0
            for _ in 1...self.waterFrequancy
            {
                
                dateComponents.weekday = Int(day)
                dateComponents.hour = 09
                dateComponents.minute = 00
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) {(error) in
                    if let error = error {
                        print("error: \(error)")
                    } else {
                        print("water remainder added for week pick")
                    }
                    
                }
                tempDay += Int(day)
                if tempDay > 7
                {
                    tempDay = 1
                }
                
            }
        }
        
        
    }
    
    //scheduling the remainder for keeping the plant under sun for specified number of hours
    func sunlightSchedule() {
        
        let content = UNMutableNotificationContent()
        content.title = "Keep plant under the sun"
        content.body = "Remainder for keeping plant under the sun"
        content.categoryIdentifier = "Remainder"
        content.sound = .default
        var dateComponents = DateComponents()
        //switch between week and day of pickview
        switch self.sunlightTimeFrame {
        case "day":
            var  time = self.sunlightDuration
            time += 09
            dateComponents.hour = 09
            dateComponents.minute = 00
            var trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            var request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) {(error) in
                if let error = error {
                    print("error: \(error)")
                } else {
                    print("keep plant remainder added for day pick")
                }
            }
            content.title = "Remove plant under the sun"
            content.body = "Remainder for removing plant under the sun"
            content.categoryIdentifier = "Remainder"
            content.sound = .default
            if time > 20
            {
                time = 19
            }
            dateComponents.hour = time
            dateComponents.minute = 00
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) {(error) in
                if let error = error {
                    print("error: \(error)")
                } else {
                    print("remove plant remainder added for day pick")
                }
            }
            if time > 20
            {
                time = 09
            }
        default:
            var time = self.sunlightDuration
            time += 09
            content.title = "Keep plant under the sun"
            content.body = "Remainder for keeping plant under the sun"
            content.categoryIdentifier = "Remainder"
            content.sound = .default
            dateComponents.weekday = 1
            dateComponents.hour = 09
            dateComponents.minute = 00
            var trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            var request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) {(error) in
                if let error = error {
                    print("error: \(error)")
                } else {
                    print("water remainder added  for week pick")
                }
            }
            content.title = "Remove plant under the sun"
            content.body = "Remainder for removing plant under the sun"
            content.categoryIdentifier = "Remainder"
            dateComponents.weekday = 1
            dateComponents.hour = time
            dateComponents.minute = 00
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request) {(error) in
                if let error = error {
                    print("error: \(error)")
                } else {
                    print("water remainder added for week pick")
                }
            }
            if time > 20
            {
                time = 09
            }
        }
    }
    
}






