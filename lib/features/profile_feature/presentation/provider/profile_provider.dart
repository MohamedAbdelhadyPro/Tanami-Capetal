import 'package:flutter/cupertino.dart';

import '../../../../app_core/routes/app_routes.dart';
import '../../../../app_core/routes/nav_service.dart';
import '../../../../app_core/storage/storage_repo.dart';
import 'profile_state.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileState state = ProfileState();
  StorageRepo storageRepo;

  ProfileProvider({required this.storageRepo});

  logout() {
    storageRepo.deleteAll();
    GoTo.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
  }
}
