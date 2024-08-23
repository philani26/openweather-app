import 'dart:io';

String readJson(String file) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File('$dir/test/$file').readAsStringSync();
}
