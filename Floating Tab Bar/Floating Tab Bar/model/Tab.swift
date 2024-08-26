//
//  Tab.swift
//  Floating Tab Bar
//
//  Created by L Af on 2024/8/25.
//

import SwiftUI

enum TabModel: String, CaseIterable{
  case home = "house"
  case search = "magnifyingglass"
  case notifications = "bell"
  case settings = "gearshape"
  
  var title:String{
    switch self{
    case .home: "Home"
    case .search: "Search"
    case .notifications: "Notifications"
    case .settings: "Settings"
    }
  }
}
