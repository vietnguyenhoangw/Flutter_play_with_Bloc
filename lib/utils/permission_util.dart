import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<PermissionStatus> checkPermission(permission) async {
    if (permission == Permission.location) {
      return await Permission.location.status;
    }
    return PermissionStatus.denied;
  }

  static Future<dynamic> requirePermission(permission) async {
    final status = await checkPermission(permission);

    if (status.isDenied) {
      // We didn't ask for permission yet.
      if (permission == Permission.location) {
        return await Permission.location.request();
      }
    }

    // You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }
  }

  static openAppPermissionSetting() async {
    await openAppSettings();
  }
}
