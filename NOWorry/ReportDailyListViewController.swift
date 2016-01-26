//
//  ReportDailyListViewController.swift
//  NOWorry
//
//  Created by 司浩杰 on 16/1/13.
//  Copyright © 2016年 司浩杰. All rights reserved.
//

import UIKit
import SwiftyJSON
import TTReflect
import RealmSwift
import CVCalendar

class reportItem:Object{
    var id: CLongLong = 0
    
    var isCreator: String?
    
    var projectname: String?
    
    var commentCounts: CLongLong = 0
    
    var describe: String?
    
    var isedit: String?
    
    var level: String?
    
    var reportTitle: String?
    
    var behFlowId: CLongLong = 0
    
    var projectId: String?
    
    var openflag: String?
    
    var createname: String?
    
    var reportenddate: String?
    
    var reportstartdate: String?
    
    var shareemployee: String?
}

class ReportDailyListViewController: SHJBaseViewController,SHJRequestDelegate,UITableViewDelegate,UITableViewDataSource,CVCalendarViewDelegate {
    var calendarView: CVCalendarView!
    var menuView: CVCalendarMenuView!
    var report_list:Array<reportItem>! = Array()
    var table:UITableView!
    var selectedDay:DayView!

    override func viewDidLoad() {
        super.viewDidLoad()
        Title_label.text = "工作日程"
//        addSengmentView("自己",with: "公司")
//        Mysegment.delegate = self
        table = UITableView.init(frame: CGRectMake(0,80, Window_width, Window_height-80))
        table.showsHorizontalScrollIndicator = false
        table.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(table)
        weak var s_delegate = self;
        s_request.request(withURL: reportdailyList, withParams: ["currentpage":"1","keyword":"2016-01-18"], withKeyArr: ["username","currentpage","keyword"], withDelegate:s_delegate, With: 1)
        print(s_request.username)
        table.registerNib(UINib.init(nibName: "dailyListCell", bundle: nil), forCellReuseIdentifier:"Cell" )
        table.delegate = self
        table.dataSource = self
        calendarView = CVCalendarView.init(frame: CGRectMake(0, 64.0, Window_width,16))
        calendarView.delegate = self
        self.view.addSubview(calendarView)
        
        // Do any additional setup after loading the view.
    }

    func requestFail(error: NSError, with tag:Int) {
        
    }
    func requestFinishedNOresult(with message: String, and tag: Int) {
        if (message == "尚未登录成功，请稍后重试"){
            let cancelAction = UIAlertController.init(title: "尚未登录成功", message: "请稍后重试", preferredStyle:UIAlertControllerStyle.Alert)
            self.presentViewController(cancelAction, animated:true, completion: { () -> Void in
                
            })

        }
    }
    func requestFinished(result:JSON, with tag: Int) {
        if result["code"].intValue == 100{
            report_list.removeAll()
            report_list.appendContentsOf(Reflect.modelArray(result["dailyreports"].arrayObject, type: reportItem.self)!)
            let realm = try! Realm()
            print(realm.path)
            try! realm.write {
                realm.add(report_list)
            }
            table.reloadData()
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return report_list.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:dailyListCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:  indexPath) as! dailyListCell
        cell.updateWith(report_list[indexPath.row])
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
    func presentationMode() -> CalendarMode {
        return .MonthView
    }
    
    /// Required method to implement!
    func firstWeekday() -> Weekday {
        return .Sunday
    }
    
    // MARK: Optional methods
    
    func shouldShowWeekdaysOut() -> Bool {
        return true
    }
    
    func shouldAnimateResizing() -> Bool {
        return true // Default value is true
    }
    
    func didSelectDayView(dayView: CVCalendarDayView, animationDidFinish: Bool) {
        print("\(dayView.date.commonDescription) is selected!")
        selectedDay = dayView
    }
    
    func presentedDateUpdated(date: CVDate) {
 
    }
    
    func topMarker(shouldDisplayOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
    
    func dotMarker(shouldShowOnDayView dayView: CVCalendarDayView) -> Bool {
        let day = dayView.date.day
        let randomDay = Int(arc4random_uniform(31))
        if day == randomDay {
            return true
        }
        
        return false
    }
    
    func dotMarker(colorOnDayView dayView: CVCalendarDayView) -> [UIColor] {
        
        let red = CGFloat(arc4random_uniform(600) / 255)
        let green = CGFloat(arc4random_uniform(600) / 255)
        let blue = CGFloat(arc4random_uniform(600) / 255)
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        
        let numberOfDots = Int(arc4random_uniform(3) + 1)
        switch(numberOfDots) {
        case 2:
            return [color, color]
        case 3:
            return [color, color, color]
        default:
            return [color] // return 1 dot
        }
    }
    
    func dotMarker(shouldMoveOnHighlightingOnDayView dayView: CVCalendarDayView) -> Bool {
        return true
    }
    
    func dotMarker(sizeOnDayView dayView: DayView) -> CGFloat {
        return 13
    }
    
    
    func weekdaySymbolType() -> WeekdaySymbolType {
        return .Short
    }
    
    func selectionViewPath() -> ((CGRect) -> (UIBezierPath)) {
        return { UIBezierPath(rect: CGRectMake(0, 0, $0.width, $0.height)) }
    }
    
    func shouldShowCustomSingleSelection() -> Bool {
        return false
    }
    
    func preliminaryView(viewOnDayView dayView: DayView) -> UIView {
        let circleView = CVAuxiliaryView(dayView: dayView, rect: dayView.bounds, shape: CVShape.Circle)
        circleView.fillColor = .colorFromCode(0xCCCCCC)
        return circleView
    }
    
    func preliminaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
        if (dayView.isCurrentDay) {
            return true
        }
        return false
    }
    
    func supplementaryView(viewOnDayView dayView: DayView) -> UIView {
        let π = M_PI
        
        let ringSpacing: CGFloat = 3.0
        let ringInsetWidth: CGFloat = 1.0
        let ringVerticalOffset: CGFloat = 1.0
        var ringLayer: CAShapeLayer!
        let ringLineWidth: CGFloat = 4.0
        let ringLineColour: UIColor = .blueColor()
        
        let newView = UIView(frame: dayView.bounds)
        
        let diameter: CGFloat = (newView.bounds.width) - ringSpacing
        let radius: CGFloat = diameter / 2.0
        
        let rect = CGRectMake(newView.frame.midX-radius, newView.frame.midY-radius-ringVerticalOffset, diameter, diameter)
        
        ringLayer = CAShapeLayer()
        newView.layer.addSublayer(ringLayer)
        
        ringLayer.fillColor = nil
        ringLayer.lineWidth = ringLineWidth
        ringLayer.strokeColor = ringLineColour.CGColor
        
        let ringLineWidthInset: CGFloat = CGFloat(ringLineWidth/2.0) + ringInsetWidth
        let ringRect: CGRect = CGRectInset(rect, ringLineWidthInset, ringLineWidthInset)
        let centrePoint: CGPoint = CGPointMake(ringRect.midX, ringRect.midY)
        let startAngle: CGFloat = CGFloat(-π/2.0)
        let endAngle: CGFloat = CGFloat(π * 2.0) + startAngle
        let ringPath: UIBezierPath = UIBezierPath(arcCenter: centrePoint, radius: ringRect.width/2.0, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        ringLayer.path = ringPath.CGPath
        ringLayer.frame = newView.layer.bounds
        
        return newView
    }
    
    func supplementaryView(shouldDisplayOnDayView dayView: DayView) -> Bool {
        if (Int(arc4random_uniform(3)) == 1) {
            return true
        }
        
        return false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
