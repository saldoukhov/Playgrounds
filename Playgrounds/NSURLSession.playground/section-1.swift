import UIKit
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely()

let session = NSURLSession.sharedSession()

let url = NSURL(string: "http://lenta.ru/rss")

let dataTask = session.dataTaskWithURL(url!, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) in
    let string = NSString(data: data!, encoding: NSUTF8StringEncoding)
} )

dataTask.resume()
