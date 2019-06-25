//
//  DataServiceProvider.swift
//  MVVMPTesting
//
//  Created by Zsolt Pete on 2019. 06. 25..
//  Copyright © 2019. Zsolt Pete. All rights reserved.
//
//swiftlint:disable force_unwrapping
//swiftlint:disable force_cast

import Alamofire
import AlamofireObjectMapper
import CYExtensions
import Foundation
import ObjectMapper
import RxCocoa
import RxSwift
import SwiftyJSON

class DataServiceProvider {
    
    init() {
        
    }
    
    let disposeBag = DisposeBag()
    
    internal var header = HTTPHeaders(
        [
            "Content-Type": "application/json"
        ]
    )
}

extension DataServiceProvider {
    
    internal func uploadImage(imgData: Data, endPoint: String, method: HTTPMethod, parameters: Parameters? = nil) -> Single<BaseResponse> {
        return Single<BaseResponse>.create { single in
            guard let url = endPoint.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
                Log.error("Cannot create url...")
                return Disposables.create()
            }
            Log.network(url)
            Log.network(self.header)
            var uploadHeader = self.header
            uploadHeader["Content-Type"] = "multipart/form-data"
            AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imgData, withName: "content", fileName: "document.jpeg", mimeType: "image/jpeg")
                if let parameters = parameters {
                    for (key, value) in parameters {
                        
                        multipartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
                    }
                }
            }, usingThreshold: UInt64(), to: url, method: method, headers: uploadHeader, interceptor: nil).response(completionHandler: { response in
                
                debugPrint(response)
                
                if let error = response.error {
                    single(.error(error))
                }
                if response.result.isSuccess && response.response?.statusCode == 200 {
                    do {
                        guard let _ = response.result.value, let data = response.data else {
                            Log.error("Cannot cast to return value...")
                            return
                        }
                        let responseJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
                        Log.info(responseJson as Any)
                        let baseResponse = BaseResponse()!
                        single(.success(baseResponse))
                        
                    } catch let error as NSError {
                        Log.error(error)
                    }
                    
                }
            })
            
            return Disposables.create()
            
        }
    }
    
    internal func request<ReturnValue: Mappable>(endPoint: String, method: HTTPMethod, parameters: Parameters? = nil) -> Single<ReturnValue> {
        return Single<ReturnValue>.create { single in
            guard let url = endPoint.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
                Log.error("Cannot create url...")
                return Disposables.create()
            }
            Log.network(url)
            Log.network(self.header)
            AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: self.header)
                .responseObject(completionHandler: { (response: DataResponse<ReturnValue>) in
                    
                    debugPrint(response)
                    
                    do {
                        guard let returnValue = response.result.value, let data = response.data else {
                            Log.error("Cannot cast to return value...")
                            return
                        }
                        if let responseJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                            Log.info(responseJson as Any)
                            
                            single(.success(returnValue))
                        }
                        
                    } catch let error as NSError {
                        Log.error(error)
                    }
                })
            return Disposables.create()
            
        }
    }
    
    internal func request<ReturnValue: Mappable>(endPoint: String, method: HTTPMethod, parameters: Parameters? = nil) -> Single<[ReturnValue]> {
        return Single<[ReturnValue]>.create { single in
            guard let url = endPoint.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
                Log.error("Cannot create url...")
                return Disposables.create()
            }
            Log.network(url)
            Log.network(self.header)
            AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: self.header)
                .responseArray(completionHandler: { (response: DataResponse<[ReturnValue]>) in
                    
                    debugPrint(response)
                    
                    do {
                        guard let returnValue = response.result.value, let data = response.data else {
                            Log.error("Cannot cast to return value...")
                            return
                        }
                        if let responseJson = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                            Log.info(responseJson as Any)
                            
                            single(.success(returnValue))
                        }
                        
                    } catch let error as NSError {
                        Log.error(error)
                    }
                })
            return Disposables.create()
            
        }
    }
}
