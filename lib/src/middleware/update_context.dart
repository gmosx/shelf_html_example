part of shelf_html_example.frontend.middleware;

/**
 *
 */
Middleware updateContext(app) => (Handler innerHandler) {
  return (Request request) {
    final context = new Map.from({
      'app': app
    })..addAll(request.context);
    return innerHandler(new Request(request.method, request.requestedUri, context: context));
  };
};