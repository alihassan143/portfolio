import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ProjectsSection extends StatelessComponent {
  const ProjectsSection({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'projects-bg', [
      div(id: 'projects', classes: 'sec-wrap', [
        div(classes: 'sec-header', [
          span(classes: 'sec-tag', [text('Open Source')]),
          h2(classes: 'sec-title', [text('Featured Projects')]),
          p(classes: 'sec-sub', [
            text(
              'Original packages and apps I\'ve authored and maintain '
              'on GitHub and pub.dev.',
            ),
          ]),
        ]),
        div(classes: 'projects-grid', [
          _project(
            icon: '📄',
            name: 'flutter-packages',
            featured: true,
            desc:
                'Html-to-PDF converter for Flutter — render any HTML/CSS '
                'content to a PDF file on all platforms. The most starred '
                'package in my portfolio.',
            stars: '27',
            forks: '43',
            lang: 'Dart',
            langClass: 'l-dart',
            url: 'https://github.com/alihassan143/flutter-packages',
          ),
          _project(
            icon: '🖼️',
            name: 'backgroundremover',
            desc:
                'A Flutter plugin to remove image backgrounds on-device, '
                'supporting Android, iOS, macOS and more. Pure Dart/Flutter '
                'implementation.',
            stars: '6',
            forks: '6',
            lang: 'Dart',
            langClass: 'l-dart',
            url: 'https://github.com/alihassan143/backgroundremover',
          ),
          _project(
            icon: '📝',
            name: 'docx_viewer',
            desc:
                'A Flutter package for rendering DOCX files directly inside '
                'your app — no server required. Available on pub.dev with '
                'dedicated API and example.',
            stars: '5',
            forks: '5',
            lang: 'Dart',
            langClass: 'l-dart',
            url: 'https://github.com/alihassan143/docx_viewer',
          ),
          _project(
            icon: '🖥️',
            name: 'Screenstate',
            desc:
                'A Flutter desktop plugin that detects and monitors the '
                'screen power state (on/off/sleep/wake) on macOS and '
                'Windows using native C++ APIs.',
            stars: '0',
            forks: '2',
            lang: 'C++',
            langClass: 'l-cpp',
            url: 'https://github.com/alihassan143/Screenstate',
          ),
          _project(
            icon: '🎨',
            name: 'canvas_app',
            desc:
                'A high-performance Flutter desktop drawing application '
                'built with a custom canvas engine. Supports freehand '
                'drawing, shapes, and export.',
            stars: '1',
            forks: '0',
            lang: 'C++',
            langClass: 'l-cpp',
            url: 'https://github.com/alihassan143/canvas_app',
          ),
          _project(
            icon: '🗄️',
            name: 'dart_alfred_postgress',
            desc:
                'A full-stack Dart backend template combining the Alfred '
                'HTTP server framework with a PostgreSQL database — '
                'demonstrating Dart on the server side.',
            stars: '0',
            forks: '0',
            lang: 'Dart',
            langClass: 'l-dart',
            url: 'https://github.com/alihassan143/dart_alfred_postgress',
          ),
          _project(
            icon: '🔐',
            name: 'gorouter_riverpod_auth',
            desc:
                'Production-ready Flutter authentication boilerplate using '
                'GoRouter for navigation and Riverpod for state management. '
                'A reference architecture.',
            stars: '0',
            forks: '0',
            lang: 'Dart',
            langClass: 'l-dart',
            url: 'https://github.com/alihassan143/gorouter_riverpod_auth',
          ),
          _project(
            icon: '✂️',
            name: 'imagecropper',
            desc:
                'A Flutter image-cropping widget with intuitive gesture '
                'controls — crop, rotate, and flip images natively across '
                'Android, iOS, and desktop.',
            stars: '0',
            forks: '0',
            lang: 'Dart',
            langClass: 'l-dart',
            url: 'https://github.com/alihassan143/imagecropper',
          ),
          _project(
            icon: '💤',
            name: 'window_sleep_detector',
            desc:
                'Flutter desktop plugin that detects system sleep and wake '
                'events on Windows and macOS. Useful for apps that need to '
                'pause/resume on idle.',
            stars: '0',
            forks: '0',
            lang: 'C++',
            langClass: 'l-cpp',
            url: 'https://github.com/alihassan143/window_sleep_detector',
          ),
        ]),

        // View all link
        div(classes: 'view-all-wrap', [
          a(
            href: 'https://github.com/alihassan143?tab=repositories',
            classes: 'btn btn-outline',
            attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
            [text('View All 110+ Repositories →')],
          ),
        ]),
      ]),
    ]);
  }

  Component _project({
    required String icon,
    required String name,
    bool featured = false,
    required String desc,
    required String stars,
    required String forks,
    required String lang,
    required String langClass,
    required String url,
  }) {
    return div(classes: 'pcard', [
      // Top row
      div(classes: 'pc-top', [
        div(classes: 'pc-icon', [text(icon)]),
        if (featured) span(classes: 'pc-badge', [text('⭐ Most Starred')]),
      ]),
      // Name
      a(
        href: url,
        classes: 'pc-name',
        attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
        [text(name)],
      ),
      // Description
      p(classes: 'pc-desc', [text(desc)]),
      // Footer
      div(classes: 'pc-foot', [
        div(classes: 'pc-meta', [
          span(classes: 'pc-stat', [text('★ $stars')]),
          span(classes: 'pc-stat', [text('⑂ $forks')]),
          span(classes: 'pc-lang', [
            span(classes: 'ldot $langClass', []),
            text(lang),
          ]),
        ]),
        a(
          href: url,
          classes: 'pc-link',
          attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
          [text('View →')],
        ),
      ]),
    ]);
  }
}
