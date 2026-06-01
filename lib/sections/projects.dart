import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ProjectsSection extends StatelessComponent {
  const ProjectsSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'projects-bg', [
      div(id: 'projects', classes: 'sec-wrap', [
        div(classes: 'sec-header', attributes: {'data-reveal': ''}, [
          span(classes: 'sec-tag', [.text('Open Source')]),
          h2(classes: 'sec-title', [.text('Featured Projects')]),
          p(classes: 'sec-sub', [
            .text(
              'Original packages and apps I\'ve authored and maintain '
              'on GitHub and pub.dev.',
            ),
          ]),
        ]),
        div(classes: 'projects-grid', [
          _card(
            icon: '📄', name: 'flutter-packages', featured: true,
            desc: 'Html-to-PDF converter for Flutter — render any HTML/CSS '
                'content to a PDF file on all platforms. Most starred package.',
            stars: '27', forks: '43', lang: 'Dart', lc: 'l-dart',
            url: 'https://github.com/alihassan143/flutter-packages', stagger: '',
          ),
          _card(
            icon: '🖼️', name: 'backgroundremover',
            desc: 'A Flutter plugin to remove image backgrounds on-device. '
                'Pure Dart/Flutter implementation, supports all major platforms.',
            stars: '6', forks: '6', lang: 'Dart', lc: 'l-dart',
            url: 'https://github.com/alihassan143/backgroundremover', stagger: 'sd-1',
          ),
          _card(
            icon: '📝', name: 'docx_viewer',
            desc: 'Flutter package for rendering DOCX files inside your app. '
                'No server required. Available on pub.dev with full API docs.',
            stars: '5', forks: '5', lang: 'Dart', lc: 'l-dart',
            url: 'https://github.com/alihassan143/docx_viewer', stagger: 'sd-2',
          ),
          _card(
            icon: '🖥️', name: 'Screenstate',
            desc: 'Flutter desktop plugin that detects and monitors the screen '
                'power state (on/off/sleep/wake) on macOS and Windows via native C++.',
            stars: '0', forks: '2', lang: 'C++', lc: 'l-cpp',
            url: 'https://github.com/alihassan143/Screenstate', stagger: 'sd-3',
          ),
          _card(
            icon: '🎨', name: 'canvas_app',
            desc: 'High-performance Flutter desktop drawing app built with '
                'a custom canvas engine. Freehand drawing, shapes, and export.',
            stars: '1', forks: '0', lang: 'C++', lc: 'l-cpp',
            url: 'https://github.com/alihassan143/canvas_app', stagger: 'sd-4',
          ),
          _card(
            icon: '🗄️', name: 'dart_alfred_postgress',
            desc: 'Full-stack Dart backend template combining Alfred HTTP '
                'server with PostgreSQL — demonstrating Dart on the server side.',
            stars: '0', forks: '0', lang: 'Dart', lc: 'l-dart',
            url: 'https://github.com/alihassan143/dart_alfred_postgress', stagger: 'sd-5',
          ),
          _card(
            icon: '🔐', name: 'gorouter_riverpod_auth',
            desc: 'Production-ready Flutter auth boilerplate using GoRouter '
                'for navigation and Riverpod for state management. Reference arch.',
            stars: '0', forks: '0', lang: 'Dart', lc: 'l-dart',
            url: 'https://github.com/alihassan143/gorouter_riverpod_auth', stagger: 'sd-6',
          ),
          _card(
            icon: '✂️', name: 'imagecropper',
            desc: 'Flutter image-cropping widget with intuitive gesture '
                'controls. Crop, rotate, and flip images natively across all platforms.',
            stars: '0', forks: '0', lang: 'Dart', lc: 'l-dart',
            url: 'https://github.com/alihassan143/imagecropper', stagger: 'sd-7',
          ),
          _card(
            icon: '💤', name: 'window_sleep_detector',
            desc: 'Flutter desktop plugin detecting system sleep and wake '
                'events on Windows and macOS. Pause/resume apps on idle.',
            stars: '0', forks: '0', lang: 'C++', lc: 'l-cpp',
            url: 'https://github.com/alihassan143/window_sleep_detector', stagger: 'sd-8',
          ),
        ]),

        div(classes: 'view-all-wrap', attributes: {'data-reveal': ''}, [
          a(
            href: 'https://github.com/alihassan143?tab=repositories',
            classes: 'btn btn-outline',
            attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
            [.text('View All 110+ Repositories →')],
          ),
        ]),
      ]),
    ]);
  }

  Component _card({
    required String icon,
    required String name,
    bool featured = false,
    required String desc,
    required String stars,
    required String forks,
    required String lang,
    required String lc,
    required String url,
    required String stagger,
  }) {
    return div(classes: 'pcard $stagger', attributes: {'data-reveal': ''}, [
      div(classes: 'pc-top', [
        div(classes: 'pc-icon', [.text(icon)]),
        if (featured) span(classes: 'pc-badge', [.text('⭐ Most Starred')]),
      ]),
      a(
        href: url,
        classes: 'pc-name',
        attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
        [.text(name)],
      ),
      p(classes: 'pc-desc', [.text(desc)]),
      div(classes: 'pc-foot', [
        div(classes: 'pc-meta', [
          span(classes: 'pc-stat', [.text('★ $stars')]),
          span(classes: 'pc-stat', [.text('⑂ $forks')]),
          span(classes: 'pc-lang', [
            span(classes: 'ldot $lc', []),
            .text(lang),
          ]),
        ]),
        a(
          href: url,
          classes: 'pc-link',
          attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
          [.text('View →')],
        ),
      ]),
    ]);
  }
}
