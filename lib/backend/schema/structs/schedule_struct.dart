// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduleStruct extends BaseStruct {
  ScheduleStruct({
    DaysofWeek? days,
    List<String>? sessions,
  })  : _days = days,
        _sessions = sessions;

  // "days" field.
  DaysofWeek? _days;
  DaysofWeek get days => _days ?? DaysofWeek.Sunday;
  set days(DaysofWeek? val) => _days = val;

  bool hasDays() => _days != null;

  // "sessions" field.
  List<String>? _sessions;
  List<String> get sessions => _sessions ?? const [];
  set sessions(List<String>? val) => _sessions = val;

  void updateSessions(Function(List<String>) updateFn) {
    updateFn(_sessions ??= []);
  }

  bool hasSessions() => _sessions != null;

  static ScheduleStruct fromMap(Map<String, dynamic> data) => ScheduleStruct(
        days: data['days'] is DaysofWeek
            ? data['days']
            : deserializeEnum<DaysofWeek>(data['days']),
        sessions: getDataList(data['sessions']),
      );

  static ScheduleStruct? maybeFromMap(dynamic data) =>
      data is Map ? ScheduleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'days': _days?.serialize(),
        'sessions': _sessions,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'days': serializeParam(
          _days,
          ParamType.Enum,
        ),
        'sessions': serializeParam(
          _sessions,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static ScheduleStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScheduleStruct(
        days: deserializeParam<DaysofWeek>(
          data['days'],
          ParamType.Enum,
          false,
        ),
        sessions: deserializeParam<String>(
          data['sessions'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ScheduleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ScheduleStruct &&
        days == other.days &&
        listEquality.equals(sessions, other.sessions);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([days, const ListEquality().hash(sessions)]);
}

ScheduleStruct createScheduleStruct({
  DaysofWeek? days,
}) =>
    ScheduleStruct(
      days: days,
    );
