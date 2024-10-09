import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:app_dart_server_side/server_logic.dart' as app_dart_server_side;

void main() async {
  final router = app_dart_server_side.serverLogic();

  final handler = const Pipeline().addMiddleware(logRequests()).addHandler(router.call);

  HttpServer server = await io.serve(handler, '192.168.1.31', 8000);

  print("Server has successfully launched.\nServer Port:${server.port}");
}
