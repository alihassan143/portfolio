import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/navbar.dart';
import 'sections/hero.dart';
import 'sections/about.dart';
import 'sections/skills.dart';
import 'sections/projects.dart';
import 'sections/contact.dart';

class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'site-root', [
      const Navbar(),
      main_(classes: 'site-main', [
        const HeroSection(),
        const AboutSection(),
        const SkillsSection(),
        const ProjectsSection(),
        const ContactSection(),
      ]),
      footer(classes: 'footer', [
        p([
          text('Crafted with '),
          span(classes: 'gradient-text', [text('Jaspr & Dart')]),
          text(' by '),
          a(
            href: 'https://github.com/alihassan143',
            attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
            [text('Ali Hassan')],
          ),
          text(' · Senior Flutter Developer'),
        ]),
      ]),
    ]);
  }
}
