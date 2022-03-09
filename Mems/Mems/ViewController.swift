//
//  ViewController.swift
//  Mems
//
//  Created by ios on 2022/3/4.
//

/*
 1.feature分支：当需要开发一个新的功能时，建一个feature分支，命名：feature_add_like_button,开发完成后和测试OK后，和并到主分支并删除这个feature分支
 
 2.bugfix分支：当我们发现bug的时候，会专门建立一个bugfix分支,修改bug后把它合并到主分支中
 
 3.spike分支：当想要探索一个新技术时，建一个spike分支，至于是否要合并到主分支看产品需求
 
 4.release分支：发布成功后，将主分支的代码合并到发布分支中去

 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        #if TOCAPPStore
        print("1111")
        
        #else
        print("2222")
        
        #endif
        
        
        let info = Bundle.main.infoDictionary
        print("info ==",info)
        let executable = (info?[kCFBundleExecutableKey as String] as? String) ??
            (ProcessInfo.processInfo.arguments.first?.split(separator: "/").last.map(String.init)) ??
            "Unknown"
        print("executable ==",executable)
        let bundle = info?[kCFBundleIdentifierKey as String] as? String ?? "Unknown"
        print("bundle ==",bundle)
        let appVersion = info?["CFBundleShortVersionString"] as? String ?? "Unknown"
        print("appVersion ==",appVersion)
        let appBuild = info?[kCFBundleVersionKey as String] as? String ?? "Unknown"
        print("appBuild ==",appBuild)
        let localVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        print("localVersion ==",localVersion)
        let osNameVersion: String = {
            let version = ProcessInfo.processInfo.operatingSystemVersion
            let versionString = "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
            let osName: String = {
                #if os(iOS)
                #if targetEnvironment(macCatalyst)
                return "macOS(Catalyst)"
                #else
                return "iOS"
                #endif
                #elseif os(watchOS)
                return "watchOS"
                #elseif os(tvOS)
                return "tvOS"
                #elseif os(macOS)
                return "macOS"
                #elseif os(Linux)
                return "Linux"
                #elseif os(Windows)
                return "Windows"
                #else
                return "Unknown"
                #endif
            }()

            return "\(osName) \(versionString)"
        }()

        let alamofireVersion = "Alamofire/\(appVersion)"
        print("alamofireVersion ==",alamofireVersion)
        let userAgent = "\(executable)/\(appVersion) (\(bundle); build:\(appBuild); \(osNameVersion)) \(alamofireVersion)"
        print("userAgent ==",userAgent)
        print(Bundle.main.bundleIdentifier)
    }


}

