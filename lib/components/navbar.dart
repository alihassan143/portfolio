import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Navbar extends StatelessComponent {
  const Navbar({super.key});

  @override
  Component build(BuildContext context) {
    return nav(classes: 'navbar', [
      a(href: '#hero', classes: 'nav-logo', [text('Ali Hassan')]),
      ul(classes: 'nav-links', [
        li([a(href: '#about',    [text('About')])]),
        li([a(href: '#skills',   [text('Skills')])]),
        li([a(href: '#projects', [text('Projects')])]),
        li([a(href: '#contact',  [text('Contact')])]),
        li([
          a(
            href: 'mailto:alihassan143cool@gmail.com',
            classes: 'nav-hire',
            [text('Hire Me')],
          ),
        ]),
      ]),
    ]);
  }
}
