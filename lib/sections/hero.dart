import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'hero', classes: 'hero', [
      // Animated orbs
      div(classes: 'hero-orbs', [
        div(classes: 'orb orb-1', []),
        div(classes: 'orb orb-2', []),
        div(classes: 'orb orb-3', []),
      ]),
      div(classes: 'hero-grid-lines', []),

      div(classes: 'hero-inner', [
        // Available badge
        div(classes: 'hero-badge', [
          span(classes: 'pulse', []),
          .text('Available for Opportunities'),
        ]),

        // Profile photo with spinning ring
        div(classes: 'avatar-wrap', [
          div(classes: 'avatar-ring', []),
          div(classes: 'avatar-photo', [
            img(
              src: 'https://avatars.githubusercontent.com/u/71745182?v=4',
              alt: 'Ali Hassan',
              width: 160,
              height: 160,
            ),
          ]),
          div(classes: 'avatar-glow', []),
        ]),

        // Name
        h1(classes: 'hero-name', [.text('Ali Hassan')]),

        // Role
        p(classes: 'hero-title', [
          .text('Senior Flutter Developer · '),
          strong([.text('Team Lead')]),
          .text(' at Enzipe'),
        ]),

        // Bio
        p(classes: 'hero-bio', [
          .text('I craft '),
          span([.text('beautiful, high-performance')]),
          .text(
            ' cross-platform apps with Flutter & Dart — '
            'iOS, Android, macOS, Windows, Linux, and Web. '
            'Open-source contributor with packages that ',
          ),
          span([.text('developers worldwide')]),
          .text(' use every day.'),
        ]),

        // Buttons
        div(classes: 'hero-actions', [
          a(href: '#projects', classes: 'btn btn-primary', [.text('View Projects')]),
          a(
            href: 'https://github.com/alihassan143',
            classes: 'btn btn-outline',
            attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
            [.text('GitHub Profile')],
          ),
          a(href: '#contact', classes: 'btn btn-cyan', [.text('Get In Touch')]),
        ]),

        // Stats
        div(classes: 'hero-stats', [
          div(classes: 'h-stat', [
            span(classes: 'h-stat-val', [.text('110+')]),
            span(classes: 'h-stat-lbl', [.text('Repositories')]),
          ]),
          div(classes: 'h-divider', []),
          div(classes: 'h-stat', [
            span(classes: 'h-stat-val', [.text('27 ★')]),
            span(classes: 'h-stat-lbl', [.text('Top Package')]),
          ]),
          div(classes: 'h-divider', []),
          div(classes: 'h-stat', [
            span(classes: 'h-stat-val', [.text('43')]),
            span(classes: 'h-stat-lbl', [.text('Most Forked')]),
          ]),
          div(classes: 'h-divider', []),
          div(classes: 'h-stat', [
            span(classes: 'h-stat-val', [.text('6 yr')]),
            span(classes: 'h-stat-lbl', [.text('Experience')]),
          ]),
        ]),
      ]),
    ]);
  }
}
