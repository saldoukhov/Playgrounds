// Playground - noun: a place where people can play

import UIKit

var dateStr = "9/2/2014"
let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "MM/dd/yyyy"
let date = dateFormatter.dateFromString(dateStr)

let now = NSDate()
let units = NSCalendarUnit.DayCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.YearCalendarUnit
let cal = NSCalendar.currentCalendar()
let components = cal.components(units, fromDate: now)
let d = components.day
let m = components.month
let y = components.year
let h = components.hour
let todayMidnight = cal.dateFromComponents(components)!
let seconds = now.timeIntervalSinceDate(todayMidnight)