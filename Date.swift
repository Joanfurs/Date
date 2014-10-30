//
//  Date.swift
//  Date
//
//  Created by Zhanna Fursova on 10/28/14.
//  Copyright (c) 2014 John Doe. All rights reserved.
//

import UIKit

class Date: NSObject {
	//year, month, and day are stored properties.
	var year: Int;
	
	var month: Int {
		willSet(newMonth) {	//a property observer
			if newMonth < 1 || newMonth > 12 {
				println("bad month \(newMonth)");
			}
		}
	}
	
	var day: Int {
		willSet(newDay) {
			if newDay < 1 || newDay > monthLength() {
				println("bad day \(newDay) for month \(month)");
			}
		}
	}
	
	//description is a read-only computed property.
	
	override var description: String {
		return "\(month)/\(day)/\(year)";
	}
	
	init(month: Int, day: Int, year: Int) {
		self.year = year;	//self.year is the property, year is the parameter
		self.month = month;
		self.day = day;
		super.init();
	}
	
	//Put today's date into the newborn Date object.
	
	override init() {
		let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!;
		let today: NSDate = NSDate();
		let unitFlags: NSCalendarUnit =
			NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.DayCalendarUnit;
		let components: NSDateComponents = calendar.components(unitFlags, fromDate: today);
		
		year  = components.year;
		month = components.month;
		day   = components.day;
		super.init();
	}
	
	//Return the number of days in the month instance variable (1 to 31 inclusive).
	
	func monthLength() -> Int {
		let calendar: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!;
		
		let components: NSDateComponents = NSDateComponents();
		components.year = year;
		components.month = month;
		components.day = day;
		
		let range: NSRange = calendar.rangeOfUnit(NSCalendarUnit.CalendarUnitDay,
			inUnit: NSCalendarUnit.CalendarUnitMonth,
			forDate: calendar.dateFromComponents(components)!);
		
		return range.length;
	}
	
	//Advance this Date one day into the future.
	//This method accepts no parameters.
	
	func next() -> Void {
		if day < monthLength() {
			++day;
			return;
		}
		
		day = 1;
		if month < Date.yearLength() {
			++month;
			return;
		}
		
		month = 1;
		++year;
	}
	
	/*
	Advance this Date many days into the future.
	This method accepts one parameter.
	It does the bulk of its work by calling the above method over and over.
	*/
	
	func next(distance: Int) {
		if distance < 0 {
			println("argument \(distance) of next must be non-negative");
			return;
		}
		
		for var i: Int = 1; i <= distance; ++i {
			next();
		}
	}
	
	// Return the number of months in a year.  A type method is marked with the keyword "class".
	
	class func yearLength() -> Int {
		return 12;
	}
	
	
	
	func prev () -> Void {
		if day != 1 {
			--day;
			return;
		} else
		if month == 1 || month == 2 || month == 4 || month == 6 || month == 8 || month == 9 || month == 11 {
			day = 31
			} else
		if month == 5 || month == 7 || month == 10 || month == 12  {
			day = 30
			} else
		if month == 3 {
			var isLeap: Bool;

			if year % 400 == 0 {
			isLeap = true;
			} else if year % 100 == 0 {
			isLeap = false;
			} else if year % 4 == 0 {
			isLeap = true;
			} else {
			isLeap = false;
			}

			if isLeap {
			day = 29
			} else {
			day = 28
			}
		}
		
		if month != 1 {
			--month;
			return;
		}
		
		month = 12;
		--year;
	}
	
	func prev(distance: Int) {
		if distance < 0 {
			println("argument \(distance) of previous must be non-negative");
			return;
		}
		
		for var i: Int = 1; i <= distance; ++i {
			prev();
		}
	}


	
	
}