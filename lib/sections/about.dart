import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class AboutSection extends StatelessComponent {
  const AboutSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'about-bg', [
      div(classes: 'globe-wrap', [
        RawText('<canvas id="about-globe-canvas"></canvas>'),
      ]),
      div(id: 'about', classes: 'sec-wrap', [
        div(classes: 'sec-header', attributes: {'data-reveal': ''}, [
          span(classes: 'sec-tag', [.text('About Me')]),
          h2(classes: 'sec-title', [.text('Passionate Flutter Developer')]),
          p(classes: 'sec-sub', [
            .text(
              'Building world-class cross-platform experiences since Flutter '
              'was in its early days.',
            ),
          ]),
        ]),
        div(classes: 'about-grid', [
          // Left — bio text
          div(classes: 'about-text', attributes: {'data-reveal': 'left'}, [
            p([
              .text('Hey! I\'m '),
              span(classes: 'hi', [.text('Ali Hassan')]),
              .text(
                ', a Senior Flutter Developer and Team Lead at '
                'Enzipe, based in Faisalabad, Pakistan. I\'ve been '
                'crafting mobile & desktop applications with Flutter and '
                'Dart for over 6 years.',
              ),
            ]),
            p([
              .text('I specialise in building '),
              span(classes: 'accent', [.text('production-grade')]),
              .text(
                ' Flutter applications across all platforms — iOS, '
                'Android, macOS, Windows, Linux, and Web. My work spans '
                'everything from slick consumer apps to complex enterprise tools.',
              ),
            ]),
            p([
              .text('I\'m an active open-source contributor with packages on '),
              span(classes: 'blue', [.text('pub.dev')]),
              .text(
                ' — including an Html-to-PDF converter with 27 GitHub stars '
                'and 43 forks, and a Docx Viewer package used by developers worldwide.',
              ),
            ]),
            p([
              .text(
                'Beyond Flutter, I enjoy backend development with Dart '
                '(Alfred + PostgreSQL), desktop apps using native C++ plugins, '
                'and exploring new technologies that push what\'s possible.',
              ),
            ]),
          ]),

          // Right — info cards
          div(classes: 'info-cards', attributes: {'data-reveal': 'right'}, [
            _card('🏢', 'Company', 'Enzipe · Team Lead'),
            _card('📍', 'Location', 'Faisalabad, Pakistan'),
            _card('🐦', 'Twitter / X', '@alihassan143co1'),
            _card('📦', 'Pub.dev', 'Flutter & Dart Packages'),
            _card('✉️', 'Email', 'alihassan143cool@gmail.com'),
            _card('🔓', 'Status', 'Open to Work · Hireable'),
          ]),
        ]),
      ]),
    ]);
  }

  Component _card(String icon, String title, String value) {
    return div(classes: 'info-card', [
      div(classes: 'ic-icon', [.text(icon)]),
      div([
        p(classes: 'ic-title', [.text(title)]),
        p(classes: 'ic-val', [.text(value)]),
      ]),
    ]);
  }
}
