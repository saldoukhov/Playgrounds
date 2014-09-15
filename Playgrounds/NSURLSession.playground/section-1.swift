import UIKit
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely()

let session = NSURLSession.sharedSession()

let url = NSURL.URLWithString("http://lenta.ru/rss")

let dataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) in
    data.length
    println(data)
} )

dataTask.resume()