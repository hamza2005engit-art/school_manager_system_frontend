import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../features/home_page/domain/entities/average_student_entity.dart';

class MarksDataSource extends DataGridSource {
  List<DataGridRow> _marksRows = [];

  MarksDataSource(List<AverageStudentEntity> marksList) {
    _marksRows = marksList.map<DataGridRow>((mark) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'subject', value: mark.materialName),
        DataGridCell<num>(columnName: 'exercises', value: mark.exercise),
        DataGridCell<num>(columnName: 'test', value: mark.test),
        DataGridCell<num>(columnName: 'final', value: mark.finalMark),
        DataGridCell<num>(columnName: 'total', value: mark.total),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _marksRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dataGridCell.value.toString(),
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }
}