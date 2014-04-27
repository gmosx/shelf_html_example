part of shelf_html_example.frontend.handlers;

/**
 *
 */
class CardHandler {
  Response call(Request request) {
    final AppElement app = request.context['app'];
    final cardsContainer = app.shadowRoot.querySelector('#cards');

    final CardElement cardElement = new Element.tag('x-card') as CardElement;

    cardsContainer.children.clear();
    cardsContainer.children.add(cardElement);

    cardElement.on['add'].listen((CustomEvent e) {
      final entry = e.detail;
      window.alert("User ${app.userId} entered ${entry}");
    });

    return new Response.ok('');
  }
}