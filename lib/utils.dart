import 'dart:io';

import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;

/// convenient print for errors
void error(Object? object) => stderr.write('$object\n');

extension X on Iterable<FileSystemEntity> {
  /// Easy extension allowing you to filter for files that are photo or video
  Iterable<File> wherePhotoVideo() => whereType<File>().where((e) {
        final mime = lookupMimeType(e.path) ?? "";
        return mime.startsWith('image/') || mime.startsWith('video/');
      });
}

extension Y on Stream<FileSystemEntity> {
  Stream<T> whereType<T>() => where((e) => e is T).cast<T>();

  /// Easy extension allowing you to filter for files that are photo or video
  Stream<File> wherePhotoVideo() => whereType<File>().where((e) {
        final mime = lookupMimeType(e.path) ?? "";
        return mime.startsWith('image/') || mime.startsWith('video/');
      });
}

/// This will add (1) add end of file name over and over until file with such
/// name doesn't exist yet. Will leave without "(1)" if is free already
File findNotExistingName(File initialFile) {
  var file = initialFile;
  while (file.existsSync()) {
    file = File('${p.withoutExtension(file.path)}(1)${p.extension(file.path)}');
  }
  return file;
}