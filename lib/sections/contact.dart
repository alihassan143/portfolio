import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ContactSection extends StatelessComponent {
  const ContactSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(id: 'contact', classes: 'sec-wrap', [
      div(classes: 'contact-box', [
        span(classes: 'sec-tag', [text("Get In Touch")]),
        h2([
          text("Let's Build Something "),
          span(classes: 'gradient-text', [text('Amazing')]),
        ]),
        p([
          text(
            'Have a project in mind? Looking for a Flutter developer or '
            'a team lead for your next product? I\'d love to hear from you.',
          ),
        ]),

        // Email button
        a(
          href: 'mailto:alihassan143cool@gmail.com',
          classes: 'email-btn',
          [
            text('✉️  alihassan143cool@gmail.com'),
          ],
        ),

        // CTA row
        div(classes: 'cta-row', [
          a(
            href: 'https://github.com/alihassan143',
            classes: 'btn btn-primary',
            attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
            [text('GitHub Profile')],
          ),
          a(
            href: 'https://twitter.com/alihassan143co1',
            classes: 'btn btn-outline',
            attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
            [text('Twitter / X')],
          ),
        ]),

        // Social links
        div(classes: 'socials', [
          a(
            href: 'https://github.com/alihassan143',
            classes: 'soc-link',
            attributes: {
              'target': '_blank',
              'rel': 'noopener noreferrer',
              'aria-label': 'GitHub',
              'title': 'GitHub',
            },
            [
              RawText(
                '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" '
                'viewBox="0 0 24 24" fill="currentColor">'
                '<path d="M12 0C5.374 0 0 5.373 0 12c0 5.302 3.438 9.8 8.207 '
                '11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-'
                '4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-'
                '.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807'
                ' 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-'
                '1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-'
                '1.524.117-3.176 0 0 1.008-.322 3.301 1.23A11.509 11.509 0 0 1 '
                '12 5.803c1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 '
                '3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 '
                '1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.'
                '823 2.222v3.293c0 .319.192.694.801.576C20.566 21.797 24 17.3 '
                '24 12c0-6.627-5.373-12-12-12z"/></svg>',
              ),
            ],
          ),
          a(
            href: 'https://twitter.com/alihassan143co1',
            classes: 'soc-link',
            attributes: {
              'target': '_blank',
              'rel': 'noopener noreferrer',
              'aria-label': 'Twitter / X',
              'title': 'Twitter',
            },
            [
              RawText(
                '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" '
                'viewBox="0 0 24 24" fill="currentColor">'
                '<path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-4.714'
                '-6.231-5.401 6.231H2.746l7.73-8.835L1.254 2.25H8.08l4.259 5.631'
                ' 5.905-5.631zm-1.161 17.52h1.833L7.084 4.126H5.117z"/></svg>',
              ),
            ],
          ),
          a(
            href: 'mailto:alihassan143cool@gmail.com',
            classes: 'soc-link',
            attributes: {'aria-label': 'Email', 'title': 'Email'},
            [
              RawText(
                '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" '
                'viewBox="0 0 24 24" fill="none" stroke="currentColor" '
                'stroke-width="2" stroke-linecap="round" stroke-linejoin="round">'
                '<rect width="20" height="16" x="2" y="4" rx="2"/>'
                '<path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>',
              ),
            ],
          ),
        ]),
      ]),
    ]);
  }
}
