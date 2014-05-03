library shelf_html_example.components.app;

import 'package:logging/logging.dart';
import 'package:polymer/polymer.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_route/shelf_route.dart';
import 'package:shelf_html/shelf_html.dart' as shelf_html;

import 'package:shelf_html_example/middleware.dart';
import 'package:shelf_html_example/handlers.dart';

import 'package:shelf_html_example/application.dart';

@CustomTag('x-app')
class AppElement extends PolymerElement with Application {
  shelf_html.Local local;

  AppElement.created() : super.created() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen(print);

    Polymer.onReady.then((_) {
      final cardPipeline = const Pipeline()
          .addMiddleware(logRequests())
          .addMiddleware(ensureSignedIn())
          .addHandler(new CardHandler());

      final r = router()
          ..addRoute(new SignInHandler(), path: '/sign-in')
          ..addRoute(cardPipeline, path: '/');

      var handler = const Pipeline()
          .addMiddleware(logRequests())
          .addMiddleware(updateContext(this))
          .addHandler(r.handler);

// gmosx: use this if you run the example from within Dart Editor.
//      local = shelf_html.serve(handler, basePath: '/shelf_html_example/web');
      local = shelf_html.serve(handler);
    });
  }
}