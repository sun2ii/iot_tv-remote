import Foundation

public struct GlobalVar {
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
