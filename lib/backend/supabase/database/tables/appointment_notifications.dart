import '../database.dart';

class AppointmentNotificationsTable
    extends SupabaseTable<AppointmentNotificationsRow> {
  @override
  String get tableName => 'appointment_notifications';

  @override
  AppointmentNotificationsRow createRow(Map<String, dynamic> data) =>
      AppointmentNotificationsRow(data);
}

class AppointmentNotificationsRow extends SupabaseDataRow {
  AppointmentNotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppointmentNotificationsTable();

  String? get appointmentId => getField<String>('appointment_id');
  set appointmentId(String? value) => setField<String>('appointment_id', value);

  String? get uuidUser => getField<String>('uuid_user');
  set uuidUser(String? value) => setField<String>('uuid_user', value);

  String? get uuidProvider => getField<String>('uuid_provider');
  set uuidProvider(String? value) => setField<String>('uuid_provider', value);

  String get serviceName => getField<String>('service_name')!;
  set serviceName(String value) => setField<String>('service_name', value);

  String get nameClient => getField<String>('name_client')!;
  set nameClient(String value) => setField<String>('name_client', value);

  String get nameProvider => getField<String>('name_provider')!;
  set nameProvider(String value) => setField<String>('name_provider', value);

  String get emailClient => getField<String>('email_client')!;
  set emailClient(String value) => setField<String>('email_client', value);

  String get emailProvider => getField<String>('email_provider')!;
  set emailProvider(String value) => setField<String>('email_provider', value);

  String get appointmentDate => getField<String>('appointment_date')!;
  set appointmentDate(String value) =>
      setField<String>('appointment_date', value);

  String get appointmentTime => getField<String>('appointment_time')!;
  set appointmentTime(String value) =>
      setField<String>('appointment_time', value);

  String get appointmentLocation => getField<String>('appointment_location')!;
  set appointmentLocation(String value) =>
      setField<String>('appointment_location', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  int? get statusNotification => getField<int>('status_notification');
  set statusNotification(int? value) =>
      setField<int>('status_notification', value);

  DateTime? get sentAt => getField<DateTime>('sent_at');
  set sentAt(DateTime? value) => setField<DateTime>('sent_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
