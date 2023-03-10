//
//  ContentView.swift
//  DiaryStudy
//
//  Created by 柳和花 on 2023/03/10.
//

import SwiftUI
import FSCalendar

struct ContentView: View {
    var body: some View {
        VStack {
            CalendarTestView()
                .frame(width: 500, height: 500)
            Spacer()
            Text("hhjog")
            
            
            
        }
        .padding()
    }
    
    func calendar(_ calendar: FSCalendar, didset date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let tmpCalendar = Calendar(identifier: .gregorian)
        
        let month = tmpCalendar.component(.month, from: date)
        
        let day = tmpCalendar.component(.day, from: date)
        
        let m = String(format: "%02d", month)
        let d = String(format: "%02d", day)
        
        var testText = "\(m)/\(d)"
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalendarTestView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        typealias UIViewType = FSCalendar
        let fscalendar = FSCalendar()
        
        return fscalendar
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    
}
