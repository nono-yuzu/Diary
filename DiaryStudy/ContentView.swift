//
//  ContentView.swift
//  DiaryStudy
//
//  Created by 柳和花 on 2023/03/10.
//

import SwiftUI
import FSCalendar

struct ContentView: View {
    @State private var selectedDate: Date?
    @State  var selectedDate_2: Date = Date()
    @State private var showPicker = false
    var body: some View {
        VStack {
            CalendarTestView(selectedDate: $selectedDate)
                .frame(width: 500, height: 500)
            Spacer()
            if let date = selectedDate {
                Label(getFormattedDate(date: date), systemImage: "calendar")
            } else {
                Text("No date selected")
            }
            Button("勉強時間を追加する"){
                showPicker
            }
            if showPicker {
                DatePicker("Date",
                              selection: $selectedDate_2,
                              displayedComponents: [.hourAndMinute]
                            )

            }
           
            
        }
        .padding()
    }
    
    func picker() {
        DatePicker("Date",
                      selection: $selectedDate_2,
                      displayedComponents: [.hourAndMinute]
                    )
    }
    
    private func getFormattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
        return formatter.string(from: date)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CalendarTestView: UIViewRepresentable {
    @Binding var selectedDate: Date?
    
    func makeUIView(context: Context) -> UIView {
        let fscalendar = FSCalendar()
        fscalendar.delegate = context.coordinator
        return fscalendar
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // No update needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(selectedDate: $selectedDate)
    }
    
    class Coordinator: NSObject, FSCalendarDelegate {
        @Binding var selectedDate: Date?
        
        init(selectedDate: Binding<Date?>) {
            self._selectedDate = selectedDate
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            selectedDate = date
        }
    }
}
