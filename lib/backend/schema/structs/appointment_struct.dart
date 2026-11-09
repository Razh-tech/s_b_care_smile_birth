// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentStruct extends BaseStruct {
  AppointmentStruct({
    List<String>? appointmentTitle,
  }) : _appointmentTitle = appointmentTitle;

  // "appointment_title" field.
  List<String>? _appointmentTitle;
  List<String> get appointmentTitle => _appointmentTitle ?? const [];
  set appointmentTitle(List<String>? val) => _appointmentTitle = val;

  void updateAppointmentTitle(Function(List<String>) updateFn) {
    updateFn(_appointmentTitle ??= []);
  }

  bool hasAppointmentTitle() => _appointmentTitle != null;

  static AppointmentStruct fromMap(Map<String, dynamic> data) =>
      AppointmentStruct(
        appointmentTitle: getDataList(data['appointment_title']),
      );

  static AppointmentStruct? maybeFromMap(dynamic data) => data is Map
      ? AppointmentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'appointment_title': _appointmentTitle,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'appointment_title': serializeParam(
          _appointmentTitle,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static AppointmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppointmentStruct(
        appointmentTitle: deserializeParam<String>(
          data['appointment_title'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'AppointmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AppointmentStruct &&
        listEquality.equals(appointmentTitle, other.appointmentTitle);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([const ListEquality().hash(appointmentTitle)]);
}

AppointmentStruct createAppointmentStruct() => AppointmentStruct();
