import 'dart:io';

import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadUtil {
  Future<bool> download(
      TargetPlatform? platform, String url, String filename) async {
    bool downloaded = false;
    var permissionReady = await checkPermission(platform);
    if (permissionReady) {
      var localPath = await prepareSaveDir(platform);
      String savePath = "$localPath/$filename";

      try {
        await Dio().download(url, savePath);
        await StorageRepository.putBool(key: url, value: true);

        downloaded = true;
      } catch (e) {
        downloaded = false;
      }
    }
    return downloaded;
  }

  Future<bool> checkPermission(TargetPlatform? platform) async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<String> prepareSaveDir(TargetPlatform? platform) async {
    var localPath = (await _findLocalPath(platform))!;

    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    return localPath;
  }

  Future<String?> _findLocalPath(TargetPlatform? platform) async {
    if (platform == TargetPlatform.android) {
      var directory = await getExternalStorageDirectory();
      return directory == null
          ? "/storage/emulated/0/Download/"
          : directory.path;
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return '${directory.path}${Platform.pathSeparator}Download';
    }
  }
}
