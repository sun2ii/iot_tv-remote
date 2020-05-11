import Foundation

public class Helper {
    
    func prepareRequest(url: String, data: Any) -> URLRequest {
        let jsonData = try? JSONSerialization.data(withJSONObject: data)
        guard let requestURL = URL(string: url) else { fatalError() }
        var request = URLRequest(url: requestURL)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(GlobalVar.AUTH_TOKEN, forHTTPHeaderField: "AUTH")
        
        request.httpMethod = "PUT"
        request.httpBody = jsonData
        
        return request
    }
    
    func pressButton(session: URLSession, request: URLRequest, cmd: Any) {
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
    
    
}
