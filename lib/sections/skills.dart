import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class SkillsSection extends StatelessComponent {
  const SkillsSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'skills', classes: 'sec-wrap', [
      div(classes: 'sec-header', [
        span(classes: 'sec-tag', [text('Tech Stack')]),
        h2(classes: 'sec-title', [text('Skills & Technologies')]),
        p(classes: 'sec-sub', [
          text(
            'A versatile toolkit honed over 6+ years of shipping '
            'cross-platform apps and open-source packages.',
          ),
        ]),
      ]),
      div(classes: 'skills-grid', [
        _category('📱', 'Flutter & Dart', [
          _chip('Flutter',      'p'),
          _chip('Dart',         'p'),
          _chip('Jaspr',        'p'),
          _chip('Flame Engine', 'p'),
          _chip('Dart FFI',     'p'),
        ]),
        _category('🏗️', 'State Management', [
          _chip('Riverpod', 'c'),
          _chip('BLoC',     'c'),
          _chip('GetX',     'c'),
          _chip('Provider', 'c'),
          _chip('MobX',     'c'),
        ]),
        _category('📡', 'Backend & APIs', [
          _chip('Firebase',    'c'),
          _chip('REST APIs',   'c'),
          _chip('GraphQL',     'c'),
          _chip('WebRTC',      'c'),
          _chip('Dart Alfred', 'c'),
          _chip('PostgreSQL',  'c'),
        ]),
        _category('💻', 'Platforms', [
          _chip('iOS',         'g'),
          _chip('Android',     'g'),
          _chip('macOS',       'g'),
          _chip('Windows',     'g'),
          _chip('Linux',       'g'),
          _chip('Web',         'g'),
        ]),
        _category('🧰', 'Native & Tools', [
          _chip('Swift',       'p'),
          _chip('Kotlin',      'p'),
          _chip('Java',        'p'),
          _chip('C++',         'p'),
          _chip('CMake',       'p'),
        ]),
        _category('🛠️', 'Workflow & DevOps', [
          _chip('Git',           'c'),
          _chip('GitHub',        'c'),
          _chip('GitHub Actions','c'),
          _chip('Fastlane',      'c'),
          _chip('Xcode',         'c'),
          _chip('Android Studio','c'),
        ]),
      ]),
    ]);
  }

  Component _category(String icon, String title, List<Component> chips) {
    return div(classes: 'skill-cat', [
      div(classes: 'sk-head', [
        span(classes: 'sk-ico', [text(icon)]),
        text(title),
      ]),
      div(classes: 'sk-chips', chips),
    ]);
  }

  Component _chip(String label, String type) {
    return span(classes: 'chip chip-$type', [text(label)]);
  }
}
