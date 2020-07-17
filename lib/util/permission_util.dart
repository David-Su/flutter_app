import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<PermissionStatus> requestPermission(
      PermissionWithService permission) async {
    var status = await requestPermissions([permission]);
    return status[permission];
  }

  static Future<Map<Permission, PermissionStatus>> requestPermissions(
      List<PermissionWithService> permissions) async {
    return await permissions.request();
  }

}
