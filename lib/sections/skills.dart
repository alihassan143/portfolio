import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class SkillsSection extends StatelessComponent {
  const SkillsSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'skills', classes: 'sec-wrap', [
      div(classes: 'sec-header', attributes: {'data-reveal': ''}, [
        span(classes: 'sec-tag', [.text('Tech Stack')]),
        h2(classes: 'sec-title', [.text('Skills & Technologies')]),
        p(classes: 'sec-sub', [
          .text(
            'A versatile toolkit honed over 6+ years of shipping '
            'cross-platform apps and open-source packages.',
          ),
        ]),
      ]),
      div(classes: 'skills-grid', [
        _cat('📱', 'Flutter & Dart', [
          _chip('Flutter', 'p'), _chip('Dart', 'p'),
          _chip('Jaspr', 'p'), _chip('Flame Engine', 'p'), _chip('Dart FFI', 'p'),
        ], ''),
        _cat('🏗️', 'State Management', [
          _chip('Riverpod', 'c'), _chip('BLoC', 'c'),
          _chip('GetX', 'c'), _chip('Provider', 'c'), _chip('MobX', 'c'),
        ], 'sd-1'),
        _cat('📡', 'Backend & APIs', [
          _chip('Firebase', 'c'), _chip('REST APIs', 'c'),
          _chip('GraphQL', 'c'), _chip('WebRTC', 'c'),
          _chip('Dart Alfred', 'c'), _chip('PostgreSQL', 'c'),
        ], 'sd-2'),
        _cat('💻', 'Platforms', [
          _chip('iOS', 'g'), _chip('Android', 'g'), _chip('macOS', 'g'),
          _chip('Windows', 'g'), _chip('Linux', 'g'), _chip('Web', 'g'),
        ], 'sd-3'),
        _cat('🧰', 'Native & Tools', [
          _chip('Swift', 'p'), _chip('Kotlin', 'p'),
          _chip('Java', 'p'), _chip('C++', 'p'), _chip('CMake', 'p'),
        ], 'sd-4'),
        _cat('🛠️', 'DevOps & Workflow', [
          _chip('Git', 'c'), _chip('GitHub', 'c'),
          _chip('GitHub Actions', 'c'), _chip('Fastlane', 'c'),
          _chip('Xcode', 'c'), _chip('Android Studio', 'c'),
        ], 'sd-5'),
      ]),
    ]);
  }

  Component _cat(String icon, String title, List<Component> chips, String stagger) {
    return div(
      classes: 'skill-cat $stagger',
      attributes: {'data-reveal': ''},
      [
        div(classes: 'sk-head', [
          span(classes: 'sk-ico', [.text(icon)]),
          .text(title),
        ]),
        div(classes: 'sk-chips', chips),
      ],
    );
  }

  Component _chip(String label, String type) =>
      span(classes: 'chip chip-$type', [.text(label)]);
}
