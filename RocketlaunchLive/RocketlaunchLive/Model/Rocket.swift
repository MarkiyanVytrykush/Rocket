//
//  Rocket.swift
//  RocketlaunchLive
//
//  Created by Nanter on 21.11.2020.
//

import Foundation
import SwiftUI

// MARK: - Rocket

struct Rocket: Codable {
  var validAuth: Bool?
  var count: Int?
  var limit: Int?
  var total: Int?
  var lastPage: Int?
  var result: [Result]?
}

// MARK: - Result

struct Result: Codable, Identifiable {
  var id: Int?
//  var cosparId: String?
//  var sortDate: String?
  var name: String?
//  var provider: Provider?
//  var vehicle: Provider?
//  var missions: [Mission]?
  var launchDescription: String?
//  var estDate: EstDate?
//  var tags: [Tag]?
  var weatherSummary: String?
  var weatherTemp: Int?
//  var weatherIcon: String?
//  var weatherUpdated: Date?
//  var quicktext: String?
//  var result: Int?
//  var suborbital: Bool?
//  var modified: Date?
}

// MARK: - EstDate

struct EstDate: Codable {
  var month: Int?
  var day: Int?
  var year: Int?
}

// MARK: - Mission

struct Mission: Codable {
  var id: Int?
  var name: String?
}

// MARK: - Pad

struct Pad: Codable {
  var id: Int?
  var name: String?
  var location: Location?
}

// MARK: - Location

struct Location: Codable {
  var id: Int?
  var name: String?
  var state: String?
  var statename: String?
  var country: String?
  var slug: String?
}

// MARK: - Provider

struct Provider: Codable {
  var id: Int?
  var name: String?
  var slug: String?
  var companyId: Int?
}

// MARK: - Tag

struct Tag: Codable {
  var id: Int?
  var text: String?
}
