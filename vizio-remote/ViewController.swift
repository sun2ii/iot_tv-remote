import UIKit

struct GlobalVar {
    static var HOST = "10.0.1.18"
    static var AUTH_TOKEN = "Z5ygsy6skc"
    struct CMD {
        static var TEST = [3, 8]

        struct MAIN {
            static var POWER = [11, 2]
            static var MUTE = [5, 4]
            static var ENTER = [3, 2]
            static var EXIT = [9, 0]
            static var BACK = [4, 0]
        }
        
        struct BASIC {
            static var VOLUME_DOWN = [5, 0]
            static var VOLUME_UP = [5, 1]
            static var CHANNEL_DOWN = [8, 0]
            static var CHANNEL_UP = [8, 1]
        }
        
        struct NAVIGATE {
            static var UP = [3, 8]
            static var DOWN = [3, 0]
            static var LEFT = [3, 1]
            static var RIGHT = [3, 7]
        }
        
        struct APP {
            static var NETFLIX = [nil, 3, "1"] as! Array<Any>
            static var PRIME = [nil, 2, "4"] as! Array<Any>
            static var YOUTUBE = [nil, 5, "1"] as! Array<Any>
            static var DISNEY = [] as Any
        }
    }
}

func pressButton(session: URLSession, cmd: Array<Int>, host: String, auth_token: String) -> Void {
    let item = [
        "KEYLIST" : [[
            "CODESET": cmd[0],
            "CODE": cmd[1],
            "ACTION": "KEYPRESS"
        ]]
    ]
    
    let parameterData = try? JSONSerialization.data(withJSONObject: item)
    let url = "https://\(host):7345/key_command/"
    guard let requestURL = URL(string: url) else { fatalError() }
    
    var request = URLRequest(url: requestURL)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue(auth_token, forHTTPHeaderField: "AUTH")
    
    request.httpMethod = "PUT"
    request.httpBody = parameterData
    
    let task = session.dataTask(with: request) { (data, response, error) in
        
        if let error = error {
            print("Error took place \(error)")
            return
        }
        
        if let response = response as? HTTPURLResponse { print("Status: \(response.statusCode) : \(cmd)") }
        if let data = data, let dataString = String(data: data, encoding: .utf8) { print("Response: \(dataString)") }
    }
    
    task.resume()
}

func goToApp(session: URLSession, app: Array<Any>, host: String, auth_token: String) -> Void {
    let data = [
        "VALUE": [
            "MESSAGE": app[0],
            "NAME_SPACE": app[1],
            "APP_ID": app[2]
        ]
    ]
    
    let appData = try? JSONSerialization.data(withJSONObject: data)
    let url = "https://\(host):7345/app/launch"
    guard let requestURL = URL(string: url) else { fatalError() }
    
    var request = URLRequest(url: requestURL)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue(auth_token, forHTTPHeaderField: "AUTH")
    
    request.httpMethod = "PUT"
    request.httpBody = appData
    
    let task = session.dataTask(with: request) { (data, response, error) in
        
        if let error = error {
            print("Error took place \(error)")
            return
        }
        
        if let response = response as? HTTPURLResponse { print("Status: \(response.statusCode) : \(app)") }
        if let data = data, let dataString = String(data: data, encoding: .utf8) { print("Response: \(dataString)") }
    }
    
    task.resume()
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func powerButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        pressButton(
            session: session,
            cmd: GlobalVar.CMD.MAIN.POWER,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
    
    @IBAction func navigateUpButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        pressButton(
            session: session,
            cmd: GlobalVar.CMD.NAVIGATE.UP,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
    
    @IBAction func navigateDownButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        pressButton(
            session: session,
            cmd: GlobalVar.CMD.NAVIGATE.DOWN,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
    
    @IBAction func navigateLeftButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        pressButton(
            session: session,
            cmd: GlobalVar.CMD.NAVIGATE.LEFT,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
    
    @IBAction func navigateRightButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        pressButton(
            session: session,
            cmd: GlobalVar.CMD.NAVIGATE.RIGHT,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }

    @IBAction func enterButtton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        pressButton(
            session: session,
            cmd: GlobalVar.CMD.MAIN.ENTER,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
    
    @IBAction func backButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        pressButton(
            session: session,
            cmd: GlobalVar.CMD.MAIN.BACK,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
    
    @IBAction func volumeUpButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        pressButton(
            session: session,
            cmd: GlobalVar.CMD.BASIC.VOLUME_UP,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
    
    @IBAction func volumeDownButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        pressButton(
            session: session,
            cmd: GlobalVar.CMD.BASIC.VOLUME_DOWN,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
    
    @IBAction func netflixButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        goToApp(
            session: session,
            app: GlobalVar.CMD.APP.NETFLIX,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
    
    @IBAction func primeButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        goToApp(
            session: session,
            app: GlobalVar.CMD.APP.PRIME,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
    
    @IBAction func youtubeButton(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        goToApp(
            session: session,
            app: GlobalVar.CMD.APP.YOUTUBE,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
    
    @IBAction func test(_ sender: Any) {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        goToApp(
            session: session,
            app: GlobalVar.CMD.APP.PRIME,
            host: GlobalVar.HOST,
            auth_token: GlobalVar.AUTH_TOKEN
        )
    }
}

extension ViewController: URLSessionDelegate {
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
       
       let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)

       completionHandler(.useCredential, urlCredential)
    }
}

