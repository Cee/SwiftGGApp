//
//  SwiftGGAPI.swift
//  SwiftGG
//
//  Created by 杨志超 on 16/1/15.
//  Copyright © 2016年 swiftgg. All rights reserved.
//

import Foundation
import Moya

let endpointClosure = { (target: SwiftGGAPI) -> Endpoint<SwiftGGAPI> in
    let endpoint: Endpoint<SwiftGGAPI> = Endpoint<SwiftGGAPI>(URL: url(target), sampleResponseClosure: {.NetworkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters, parameterEncoding: .JSON)
    return endpoint
}

let stubClosure = { (target: SwiftGGAPI) -> StubBehavior in
    return .Immediate
}

let SwiftGGProvider = MoyaProvider<SwiftGGAPI>(endpointClosure: endpointClosure, stubClosure: stubClosure )

enum SwiftGGAPI {
    case CategoryListings
}

extension SwiftGGAPI: TargetType {
    var base: String { return "http://www.swiftgg.com/" }
    var baseURL: NSURL { return NSURL(string: base)! }
    
    var path: String {
        switch self {
        case .CategoryListings:
            return "api/v1/article/getCategoryList"
        }
    }
    
    var parameters: [String: AnyObject]? {
        switch self {
        default:
            return nil
        }
    }
    
    var method: Moya.Method {
        return .POST
    }
    
    var sampleData: NSData {
        switch self {
        case .CategoryListings:
            return stubbedResponse("CategoryList")
        }
    }
}

// MARK: - Provider support
func stubbedResponse(filename: String) -> NSData! {
    let bundle = NSBundle.mainBundle()
    let path = bundle.pathForResource(filename, ofType: "json")
    return NSData(contentsOfFile: path!)
}

private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}

public func url(route: TargetType) -> String {
    return route.baseURL.URLByAppendingPathComponent(route.path).absoluteString
}