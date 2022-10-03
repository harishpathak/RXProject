//
//  FirstModel.swift
//  RXProject
//
//  Created by Harish on 27/09/22.
//

import Foundation
import ObjectMapper

struct CatResponse: ImmutableMappable {
    var currentPage: Int?
    var facts: [Fact]
    var firstPageURL: String?
    var from: Int?
    var lastPage: Int?
    var lastPageURL: String?
    var links: [Link]
    var nextPageURL: String?
    var path: String?
    var perPage: Int?
    var prevPageURL: String?
    var to: Int?
    var total: Int?
    
    init(map: Map) throws {
        currentPage = try? map.value("currentPage")
        facts = try map.value("data") as [Fact]
        firstPageURL = try? map.value("firstPageURL")
        from = try? map.value("from")
        lastPage = try? map.value("lastPage")
        lastPageURL = try? map.value("lastPageURL")
        links = try map.value("links") as [Link]
        nextPageURL = try? map.value("nextPageURL")
        path = try? map.value("path")
        perPage = try? map.value("perPage")
        prevPageURL = try? map.value("prevPageURL")
        to = try? map.value("to")
        total = try? map.value("total")
    }
    
    public func mapping(map: Map) {
        currentPage >>> map["currentPage"]
        facts >>> map["data"]
        firstPageURL >>> map["firstPageURL"]
        from >>> map["from"]
        lastPage >>> map["lastPage"]
        lastPageURL >>> map["lastPageURL"]
        links >>> map["links"]
        nextPageURL >>> map["nextPageURL"]
        path >>> map["path"]
        perPage >>> map["perPage"]
        prevPageURL >>> map["prevPageURL"]
        to >>> map["to"]
        total >>> map["total"]
    }
}

struct Fact: ImmutableMappable {
    var fact: String?
    var length: Int?
    
    init(map: Map) throws {
        fact = try? map.value("fact")
        length = try? map.value("length")
    }
    
    public func mapping(map: Map) {
        fact >>> map["fact"]
        length >>> map["length"]
    }
}

struct Link: ImmutableMappable {
    var url: String?
    var label: String?
    var active: Bool?
    
    init(map: Map) throws {
        url = try? map.value("url")
        label = try? map.value("label")
        active = try? map.value("active")
    }
    
    public func mapping(map: Map) {
        url >>> map["url"]
        label >>> map["label"]
        active >>> map["active"]
    }
}
