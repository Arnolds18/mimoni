//
//  PieChart.swift
//  mimoni
//
//  Created by Nicky Santano on 22/06/22.
//

import SwiftUI
import Charts

struct PieChart: UIViewRepresentable {

    var entries: [PieChartDataEntry]
    @Binding var category: Wine.Category
    let pieChart = PieChartView()

    func makeUIView(context: Context) -> PieChartView{
        pieChart.delegate = context.coordinator
        return pieChart
    }

    func updateUIView(_ uiView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.colors = ChartColorTemplates.colorful()
        let pieChartData = PieChartData(dataSet: dataSet)
        uiView.data = pieChartData

        configureChart(pieChart: uiView)
        formatCenter(pieChart: uiView)
        formatDescription(description: uiView.chartDescription)
        formatLegend(legend: uiView.legend)
        formatDataSet(dataSet: dataSet)
        uiView.notifyDataSetChanged()
    }

    class Coordinator: NSObject, ChartViewDelegate{
        var parent: PieChart
        init(parent: PieChart){
            self.parent = parent
        }
        func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
            let labelText = entry.value(forKey: "label")! as! String
            let num = Int(entry.value(forKey: "value")! as! Double)
            parent.pieChart.centerText = """
                \(labelText)
                \(num)
                """
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func configureChart( pieChart: PieChartView){
        pieChart.rotationEnabled = false
        pieChart.animate(xAxisDuration: 0.5, easingOption: .easeInOutCirc)
        pieChart.drawEntryLabelsEnabled = false
        pieChart.highlightValue(x: -1, dataSetIndex: 0, callDelegate: false)
    }

    func formatCenter( pieChart: PieChartView){ //center hole chart
        pieChart.holeColor = UIColor.systemBackground
        pieChart.centerText = category.rawValue.capitalized
        pieChart.centerTextRadiusPercent = 0.95
    }

    func formatDescription( description: Description){ //description
        description.text = category.rawValue.capitalized
        description.font = UIFont.boldSystemFont(ofSize: 17)
    }

    func formatLegend( legend: Legend){ //legend
        legend.enabled = false
    }

    func formatDataSet( dataSet: ChartDataSet){ //center hole chart
        dataSet.drawValuesEnabled = false
    }
}

struct PieChart_Previews : PreviewProvider{
    static var previews: some View{
        PieChart(entries: Wine.entriesForWines(wines: Wine.allWines, category: .variety),
                 category: .constant(.variety))
            .frame(height: 400)
            .padding()
    }
}
