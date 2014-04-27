part of shelf_html_example.frontend.handlers;

class SignInHandler {
  Response call(Request request) {
    final AppElement app = request.context['app'];
    final cardsContainer = app.shadowRoot.querySelector('#cards');

    final signInElement = new Element.tag('x-sign-in');

    cardsContainer.children.clear();
    cardsContainer.children.add(signInElement);

    signInElement.on['auth'].listen((CustomEvent e) {
      window.localStorage['authToken'] = 'authToken';
      window.localStorage['user.id'] = '9213';
      app.local.go('/');
    });

    return new Response.ok('');
  }
}
