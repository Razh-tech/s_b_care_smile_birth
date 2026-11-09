import 'dart:async';

import 'custom_auth_user_provider.dart';

export 'custom_auth_manager.dart';

class CustomAuthManager {
  // Auth session attributes
  String? authenticationToken;
  String? refreshToken;
  DateTime? tokenExpiration;
  // User attributes
  String? uid;

  Future signOut() async {
    authenticationToken = null;
    refreshToken = null;
    tokenExpiration = null;
    uid = null;

    // Update the current user.
    sBCareSmileBirthAuthUserSubject.add(
      SBCareSmileBirthAuthUser(loggedIn: false),
    );
  }

  Future<SBCareSmileBirthAuthUser?> signIn({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) async =>
      await _updateCurrentUser(
        authenticationToken: authenticationToken,
        refreshToken: refreshToken,
        tokenExpiration: tokenExpiration,
        authUid: authUid,
      );

  Future<void> updateAuthUserData({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) async {
    assert(
      currentUser?.loggedIn ?? false,
      'User must be logged in to update auth user data.',
    );

    await _updateCurrentUser(
      authenticationToken: authenticationToken,
      refreshToken: refreshToken,
      tokenExpiration: tokenExpiration,
      authUid: authUid,
    );
  }

  Future<SBCareSmileBirthAuthUser?> _updateCurrentUser({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
  }) async {
    this.authenticationToken = authenticationToken;
    this.refreshToken = refreshToken;
    this.tokenExpiration = tokenExpiration;
    this.uid = authUid;

    // Update the current user stream.
    final updatedUser = SBCareSmileBirthAuthUser(
      loggedIn: true,
      uid: authUid,
    );
    sBCareSmileBirthAuthUserSubject.add(updatedUser);

    return updatedUser;
  }
}

SBCareSmileBirthAuthUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
