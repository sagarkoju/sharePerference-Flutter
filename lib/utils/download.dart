import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class DioFileDownlaod {
  void startDownloading(String file, BuildContext context,
      {String progress = ''}) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      //add more permission to request here.
    ].request();
    if (statuses[Permission.storage]!.isGranted) {
      var dir = await DownloadsPathProvider.downloadsDirectory;
      if (dir != null) {
        String savename = file.toString();
        var save = savename.split('/').last;
        String savePath = "${dir.path}/$save";
        if (kDebugMode) {
          print(savePath);
        }
        //output:  /storage/emulated/0/Download/banner.png

        try {
          await Dio().download(file, savePath,
              onReceiveProgress: (received, total) {
            if (total != -1) {
              progress = "${(received / total * 100).toStringAsFixed(0)}%";

              showDialog(
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator.adaptive(),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Downloading: $progress",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).then((value) => Navigator.pop(context));
            }
          }).then((value) => Navigator.pop(context));
          if (kDebugMode) {
            print("File is saved to download folder.");
          }
        } on DioError catch (e) {
          if (kDebugMode) {
            print(e.message);
          }
        }
      }
    } else {
      if (kDebugMode) {
        print("No permission to read and write.");
      }
    }
  }
}
