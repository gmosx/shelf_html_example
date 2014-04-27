part of shelf_html_example.frontend.middleware;

/**
 * Ensure there is an authToken in the application session.
 */
Middleware ensureSignedIn() => (Handler innerHandler) {
  return (Request request) {
    final Application app = request.context['app'];
    if (app.authToken == null) {
      if (window.localStorage.containsKey('authToken') && window.localStorage.containsKey('user.id')) {
        app.authToken = window.localStorage['authToken'];
        app.userId = int.parse(window.localStorage['user.id']);
      } else {
        // TODO: maybe use other 30x status?
        return new Response.seeOther('sign-in');
      }
    }
    return innerHandler(request);
  };
};