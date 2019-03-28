//
//  Functions.swift
//  SwiftBasics
//
//  Created by 侯伟 on 17/1/11.
//  Copyright © 2017年 侯伟. All rights reserved.
//

import Foundation
import AVFoundation


typealias Task = (_ cancle : Bool) -> Void

func delayEx(_ time: TimeInterval, task: @escaping() -> ()) -> Task? {
    
    func dispatch_later(block: @escaping()->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    
    var closure : (() -> Void)? = task
    var result : Task?
    
    let delayedClosure : Task = {
        cancle in
        if let internalClosure = closure {
            if cancle == false {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    
    return result
}

func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
    
    let jsonData:Data = jsonString.data(using: .utf8)!
    
    let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
    if dict != nil {
        return dict as! NSDictionary
    }
    return NSDictionary()
    
    
}

func cancle(_ task: Task?) {
    task?(true)
}

/// 延迟执行代码
public func delay(_ seconds: UInt64, task: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(seconds * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: task)
}

/// 异步执行代码块（先非主线程执行，再返回主线程执行）
public func async(_ backgroundTask: @escaping () -> AnyObject?, mainTask: @escaping (AnyObject?) -> Void) {
    DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
        let result = backgroundTask()
        DispatchQueue.main.sync {
            mainTask(result)
        }
    }
}

/// 异步执行代码块（主线程执行）
public func async(_ mainTask: @escaping () -> Void) {
    DispatchQueue.main.async(execute: mainTask)
}

/// 顺序执行代码块（在队列中执行）
public func sync(_ task: () -> Void) {
    DispatchQueue(label: "com.hw.LockQueue", attributes: []).sync(execute: task)
}

public func alert(_ message: String, title: String! = nil, completion: (() -> Void)? = nil) {
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    controller.addAction(UIAlertAction(title: "I KNOW", style: .default) { action in
        controller.dismiss(animated: true, completion: nil)
        completion?()
        })
    UIViewController.topViewController?.present(controller, animated: true, completion: nil)
}

public func confirm(_ message: String, title: String! = nil, completion: @escaping (Bool) -> Void)->UIAlertController {
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    controller.addAction(UIAlertAction(title: "取消", style: .cancel) { action in
        controller.dismiss(animated: true, completion: nil)
        completion(false)
        })
    controller.addAction(UIAlertAction(title: "确定", style: .default) { action in
        controller.dismiss(animated: true, completion: nil)
        completion(true)
        })
    UIViewController.topViewController?.present(controller, animated: true, completion: nil)
    return controller
}

public func confirm(_ message: String, title: String! = nil ,cancelTitle: String?,sureTitle:String?, completion: @escaping (Bool) -> Void)->UIAlertController{
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    if cancelTitle != nil {
        controller.addAction(UIAlertAction(title: cancelTitle ?? "", style: .cancel) { action in
            controller.dismiss(animated: true, completion: nil)
            completion(false)
        })
    }
    
    controller.addAction(UIAlertAction(title: sureTitle ?? "Ok", style: .default) { action in
        controller.dismiss(animated: true, completion: nil)
        completion(true)
    })
    UIViewController.topViewController?.present(controller, animated: true, completion: nil)
    return controller
}

func getJSONStringFromArray(array:NSArray) -> String {
    
    if (!JSONSerialization.isValidJSONObject(array)) {
        print("无法解析出JSONString")
        return ""
    }
    
    let data : NSData! = try? JSONSerialization.data(withJSONObject: array, options: []) as NSData!
    let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
    return JSONString! as String
    
}


public func confirmCancel(_ message: String, title: String! = nil, completion: @escaping (Bool) -> Void) {
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    controller.addAction(UIAlertAction(title: "CANCEL", style: .cancel) { action in
        controller.dismiss(animated: true, completion: nil)
        completion(false)
    })
    controller.addAction(UIAlertAction(title: "YES", style: .default) { action in
        controller.dismiss(animated: true, completion: nil)
        completion(true)
    })
    UIViewController.topViewController?.present(controller, animated: true, completion: nil)
}

public func prompt(_ message: String, title: String! = nil, text: String! = nil, placeholder: String! = nil, positiveBtn: String! = "YES", completion: @escaping (String?) -> Void) {
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    controller.addAction(UIAlertAction(title: "CANCEL", style: .cancel) { action in
        controller.dismiss(animated: true, completion: nil)
        completion(nil)
        })
    controller.addAction(UIAlertAction(title: positiveBtn, style: .default) { action in
        controller.dismiss(animated: true, completion: nil)
        completion(controller.textFields?[0].text ?? "")
        })
    controller.addTextField { textField in
        if let value = text {
            textField.text = value
        }
        if let ph = placeholder {
            textField.placeholder = ph
        }
    }
    UIViewController.topViewController?.present(controller, animated: true, completion: nil)
}

public func toast(_ message: String?, in view: UIView? = nil, duration: TimeInterval? = nil, position: ToastPosition? = nil, title: String? = nil, image: UIImage? = nil, style: ToastStyle? = nil, completion: ((_ didTap: Bool) -> Void)? = nil) {
    guard let view = view ?? UIApplication.shared.keyWindow else { return }
    let manager = ToastManager.shared
    view.hideToastActivity()
    view.makeToast(message, duration: duration ?? manager.duration, position: position ?? manager.position, title: title, image: image, style: style, completion: completion)
}

public func spin(in view: UIView?, at position: ToastPosition = .center,isModel:Bool = false) {
    guard let _ = view else {
        return
    }
    view?.makeToastActivity(position,isModel:isModel)
}

public func spin(in view: UIView?, at position: CGPoint) {
    guard let _ = view else {
        return
    }
    view?.makeToastActivity(position)
}

public func spin(in view: UIView?, stop: Bool) {
    guard let _ = view else {
        return
    }
    if stop {
        view?.hideToastActivity()
    } else {
        spin(in: view)
    }
}

var audioPlayer: AVAudioPlayer?
public func playMp3(_ fileName: String) {
    do {
        let path = Bundle.main.path(forResource: fileName, ofType: "mp3")
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path!))
        audioPlayer?.play()
    } catch let err {
        print("播放失败:\(err.localizedDescription)")
    }
}

public func nameForClass(_ className: String) -> String {
    guard let extutableName = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String else {
        return ""
    }
    return extutableName + "." + className
}


