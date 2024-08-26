//
//  ContentView.swift
//  Floating Tab Bar
//
//  Created by L Af on 2024/8/25.
//

import SwiftUI

struct ContentView: View {
  @State private var activeTab: TabModel = .home
  @State private var isTabBarHidden: Bool = false
    var body: some View {
      if #available(iOS 18, *){
        TabView(selection: $activeTab){
          Tab.init(value: .home ){
            Text("Home")
              .toolbarVisibility(.hidden, for: .tabBar)
          }
          Tab.init(value: .search ){
            Text("Search")
              .toolbarVisibility(.hidden, for: .tabBar)
          }
          Tab.init(value: .notifications ){
            
            Text("Notifications")
              .toolbarVisibility(.hidden, for: .tabBar)
          }
          Tab.init(value: .settings ){
            Text("Settings")
              .toolbarVisibility(.hidden, for: .tabBar)
          }
        }
      } else {
        TabView(selection: $activeTab){
          Text("Home")
            .tag(TabModel.home)
            .background{
              if !isTabBarHidden{
                HideTabBar{
                  print("Hidden")
                  isTabBarHidden = true
                }
              }
            }
          Text("Search")
            .tag(TabModel.search)
        
          Text("Notifications")
            .tag(TabModel.notifications)

          Text("Settings")
            .tag(TabModel.settings)
           
        }
        .overlay{
          Color.red.opacity(0.5) // 用于调试，确保 overlay 正确显示
          Button{
            activeTab = activeTab == .home ? .search: .home
          } label: {
            Text("Switch Tabs")
              .padding()
              .background(Color.blue)
              .foregroundColor(.white)
              .cornerRadius(8)
          }
          .offset(y:100)
        }
      }
    }
}


struct HideTabBar: UIViewRepresentable{
  var result: () -> ()
  func makeUIView(context: Context) -> some UIView {
    let view = UIView(frame: .zero)
    view.backgroundColor = .clear
    
    DispatchQueue.main.sync{
      if let tabController = view.tabController{
        tabController.tabBar.isHidden = true
        result()
      }
    }
    return view
  }
  func updateUIView(_ uiView: UIViewType, context: Context) {
    
  }
}

extension UIView {
  var tabController: UITabBarController?{
    if let controller = sequence(first: self, next: {
      $0.next
    }).first(where: {$0 is UITabBarController}) as? UITabBarController{
      return controller
    }
    return nil
  }
}


#Preview {
    ContentView()
}
