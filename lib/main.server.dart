library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(
    Document(
      title: 'Ali Hassan — Senior Flutter Developer & Team Lead',
      head: [
        meta(
          name: 'description',
          content:
              'Ali Hassan is a Senior Flutter Developer and Team Lead at Enzipe, '
              'Faisalabad. Building cross-platform apps for iOS, Android, macOS, '
              'Windows, Linux and Web. Open-source contributor on pub.dev.',
        ),
        meta(
          name: 'keywords',
          content:
              'Flutter Developer, Dart, Mobile Developer, Cross-platform, '
              'iOS, Android, macOS, Pakistan, Ali Hassan, pub.dev',
        ),
        meta(
          content: 'Ali Hassan — Senior Flutter Developer',
          attributes: const {'property': 'og:title'},
        ),
        meta(
          content:
              'Senior Flutter Developer & Team Lead building beautiful '
              'cross-platform apps with Flutter and Dart.',
          attributes: const {'property': 'og:description'},
        ),
        meta(
          content: 'website',
          attributes: const {'property': 'og:type'},
        ),
        meta(
          name: 'twitter:card',
          content: 'summary',
        ),
        meta(
          name: 'twitter:site',
          content: '@alihassan143co1',
        ),
        link(
          href: 'https://fonts.googleapis.com',
          rel: 'preconnect',
        ),
        link(
          href: 'https://fonts.gstatic.com',
          rel: 'preconnect',
          attributes: const {'crossorigin': ''},
        ),
        link(
          href:
              'https://fonts.googleapis.com/css2?family=Inter:'
              'ital,opsz,wght@0,14..32,300;0,14..32,400;0,14..32,500;'
              '0,14..32,600;0,14..32,700;0,14..32,800;0,14..32,900;'
              '1,14..32,400&display=swap',
          rel: 'stylesheet',
        ),
        link(href: 'styles.css', rel: 'stylesheet'),
      ],
      styles: [],
      body: const App(),
    ),
  );
}
