
import SwiftUI

@available(iOS 14.0, *)
public struct DevHelper03: View {
    public init(listData: [String: String], pushTo: @escaping () -> (), checkEmptyPw: String, pushToTwo: @escaping () -> ()) {
        self.listData = listData
        self.pushTo = pushTo
        self.checkEmptyPw = checkEmptyPw
        self.pushToTwo = pushToTwo
    }
    var listData: [String: String] = [:]
    var checkEmptyPw: String
    @State var next_screen_three = false
    @State var load_hide_three = false
    @State var get_pw_three: String = ""
    @State var check_pw_empt = false
    var pushTo: () -> ()
    var pushToTwo: () -> ()
    
    public var body: some View {
        if checkEmptyPw.isEmpty {
            ZStack {
                if next_screen_three {
                    Color.clear.onAppear {
                        self.pushTo()
                    }
                    
                } else {
                    if check_pw_empt {
                        Color.clear.onAppear {
                            self.pushToTwo()
                        }
                    } else {
                        if load_hide_three {
                            ProgressView("")
                        }
                        ZStack {
                            ThreeCoor(url: URL(string: listData[RemoKey.rmlink11.rawValue] ?? ""), next_screen_three: $next_screen_three, load_hide_three: $load_hide_three, get_pw_three: $get_pw_three, listData: self.listData).opacity(load_hide_three ? 0 : 1)
                        }.zIndex(2.0)
                    }
                    
                }
            }.foregroundColor(Color.black)
                .background(Color.white)
        } else {
            Color.clear.onAppear {
                self.pushTo()
            }
        }
    }
}
