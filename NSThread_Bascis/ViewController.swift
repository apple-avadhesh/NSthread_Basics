//
//  ViewController.swift
//  NSThread_Bascis
//
//  Created by PC Gamer on 18/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Initiate Thread
       // testThread()
        testThreadUsingBlock()
//        testSubclassedThread()
    }
    
    
    //MARK: Test NSThread
    func testThread(){
        let thread1 = Thread.init(target: self, selector: #selector(loopMethod), object: nil)
        thread1.name = "Thread 1"
        thread1.start()
    }
    
    func testThreadUsingBlock() {
        let thread2 = Thread.init {
            for i in 0...100 {
                print("Index \(i)")
            }
        }
        thread2.name = "Thread 2"
        thread2.start()
    }
    
    @objc func loopMethod(){
        for i in 0...100 {
            print("Index \(i)")
        }
    }
    
    func testSubclassedThread() {
        let thread = ASThread.init()
        thread.name = "Custom Thread"
        thread.start()
    }
    
    func stopTheThread() {
        
        let thread = ASThread.init()
        thread.name = "Custom Thread"
        thread.start()
        thread.isExecuting
        thread.cancel()
    }
    
}


class ASThread: Thread {
    
    override func main() {
        for i in 0..<10000 {
            print(String(format: "1--%i--%@", i, Thread.current))
        }


        if isCancelled {
            return
        }

        for i in 10000..<20000 {
            print(String(format: "2--%i--%@", i, Thread.current))
        }

        if isCancelled {
            return
        }

        for i in 20000..<30000 {
            print(String(format: "3--%i--%@", i, Thread.current))
        }
    }
}



