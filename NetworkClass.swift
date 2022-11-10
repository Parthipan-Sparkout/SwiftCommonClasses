
import Alamofire
import UIKit

extension API {
    
    class var authSessionManager: Session {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        let sessionsManager = Session.default
        return sessionsManager
    }
    
    static func request<T: Codable>(url: String,
                                        method: HTTPMethod = .post,
                                        multipartFormData: @escaping (MultipartFormData) -> Void,
                                        headers: HTTPHeaders? = nil,
                                        type: T.Type,
                                        completion: @escaping (Swift.Result<T, Error>) -> Void) {
        let headers: HTTPHeaders = [
                "Content-Type" : "application/json",
                "Accept" : "application/json"
            ]
            
            authSessionManager.upload(multipartFormData: multipartFormData,
                                      to: url,
                                      headers: headers).responseJSON { response in
                switch response.result {
                case .success(let value):
                    do {
                        let resultData = try JSONSerialization.data(withJSONObject: value)
                        let result = try JSONDecoder().decode(T.self, from: resultData)
                        completion(.success(result))
                    } catch {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    
    class func request<T: Codable>(url: String,
                                     method: Alamofire.HTTPMethod = .get,
                                     parameters: [String: Any]? = nil,
                                     headers: HTTPHeaders? = nil,
                                    encoding: ParameterEncoding = URLEncoding.default,
                                     type: T.Type,
                                     completion: @escaping (Swift.Result<T, Error>) -> Void) {
        let headerDefault: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        authSessionManager.request(url,
                                   method: method,
                                   parameters: parameters,
                                   encoding: encoding,
                                   headers: headerDefault).responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    let resultData = try JSONSerialization.data(withJSONObject: data)
                    let result = try JSONDecoder().decode(T.self, from: resultData)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
   
}
