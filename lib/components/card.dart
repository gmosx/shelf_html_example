library shelf_html_example.components.card;

import 'dart:html';

import 'package:polymer/polymer.dart';

@CustomTag('x-card')
class CardElement extends PolymerElement {
  @observable
  List<Map> events = toObservable([]);

  bool get applyAuthorStyles => true;

  CardElement.created() : super.created();

  void submit(MouseEvent e) {
    e.preventDefault();
    final InputElement entry = shadowRoot.querySelector('#entry');
    fire('add', detail: entry.value);
  }
}