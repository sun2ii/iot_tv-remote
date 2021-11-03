import UIKit

let H = Helper()

func pressButton(session: URLSession, cmd: Array<Int>) -> Void {
    let url = "https://\(GlobalVar.HOST):7345/key_command/"
    let btnInfo = [
        "KEYLIST" : [[
            "CODESET": cmd[0],
            "CODE": cmd[1],
            "ACTION": "KEYPRESS"
        ]]
    ]

    H.pressButton(
        session: session,
        request: H.prepareRequest(url: url, data: btnInfo),
        cmd: cmd
    )
}

func goToApp(session: URLSession, app: Array<Any>) -> Void {
    let url = "https://\(GlobalVar.HOST):7345/app/launch"
    let appInfo = [
        "VALUE": [
            "MESSAGE": app[0],
            "NAME_SPACE": app[1],
            "APP_ID": app[2]
        ]
    ]
    
    H.pressButton(
        session: session,
        request: H.prepareRequest(url: url, data: appInfo),
        cmd: appInfo
    )
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var searchField: UITextField!

    @IBAction func powerButton(_ sender: Any) {
        pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.MAIN.POWER
        )
    }
    
    @IBAction func prevButton(_ sender: Any) {
        pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.MAIN.PREV
        )
    }
    
    @IBAction func channelDown(_ sender: Any) {
        pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.BASIC.CHANNEL_DOWN
        )
    }
    
    
    @IBAction func channelUp(_ sender: Any) {
        pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.BASIC.CHANNEL_UP
        )
    }
    
    
    @IBAction func inputButton(_ sender: Any) {
        pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.MAIN.INPUT
        )
    }
    
    @IBAction func navigateUpButton(_ sender: Any) {
        pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.NAVIGATE.UP
        )
    }
    
    @IBAction func navigateDownButton(_ sender: Any) {
         pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.NAVIGATE.DOWN
        )
    }
    
    @IBAction func navigateLeftButton(_ sender: Any) {
        pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.NAVIGATE.LEFT
        )
    }
    
    @IBAction func navigateRightButton(_ sender: Any) {
        pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.NAVIGATE.RIGHT
        )
    }

    @IBAction func enterButtton(_ sender: Any) {
         pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.MAIN.ENTER
        )
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        pressButton(
           session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.MAIN.Settings
       )
    }
    
    
    @IBAction func infoButton(_ sender: Any) {
        pressButton(
           session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.MAIN.INFO
        )
    }
    
    
    @IBAction func homeButton(_ sender: Any) {
        pressButton(
           session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.MAIN.HOME
       )
    }
    
    @IBAction func backButton(_ sender: Any) {
         pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.MAIN.BACK
        )
    }
    
    @IBAction func volumeUpButton(_ sender: Any) {
         pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.BASIC.VOLUME_UP
        )
    }
    
    @IBAction func volumeDownButton(_ sender: Any) {
         pressButton(
            session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.BASIC.VOLUME_DOWN
        )
    }
    
    @IBAction func netflixButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        goToApp(
            session: session,
            app: GlobalVar.CMD.APP.NETFLIX
        )
    }
    
    @IBAction func primeButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        goToApp(
            session: session,
            app: GlobalVar.CMD.APP.PRIME
        )
    }
    
    @IBAction func youtubeButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        goToApp(
            session: session,
            app: GlobalVar.CMD.APP.YOUTUBE
        )
    }
    
    // For Mute Button - Earlier was for testing
    @IBAction func test(_ sender: Any) {
        pressButton(
           session: URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil),
            cmd: GlobalVar.CMD.MAIN.MUTE
       )
    }
}

extension ViewController: URLSessionDelegate {
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
       
       let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)

       completionHandler(.useCredential, urlCredential)
    }
}

