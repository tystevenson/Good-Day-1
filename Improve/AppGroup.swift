//
//  AppGroup.swift
//  Improve
//
//  Created by Ryan Haraki on 2021-04-27.
//

import Foundation

public enum AppGroup: String {
  case facts = "group.com.haraki.Improve"

  public var containerURL: URL {
    switch self {
    case .facts:
      return FileManager.default.containerURL(
      forSecurityApplicationGroupIdentifier: self.rawValue)!
    }
  }
}
