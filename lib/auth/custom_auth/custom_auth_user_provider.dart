import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class SBCareSmileBirthAuthUser {
  SBCareSmileBirthAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<SBCareSmileBirthAuthUser> sBCareSmileBirthAuthUserSubject =
    BehaviorSubject.seeded(SBCareSmileBirthAuthUser(loggedIn: false));
Stream<SBCareSmileBirthAuthUser> sBCareSmileBirthAuthUserStream() =>
    sBCareSmileBirthAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
