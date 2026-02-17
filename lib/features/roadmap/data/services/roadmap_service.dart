import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/roadmap_model.dart';
import '../../domain/entities/roadmap_entity.dart';

class RoadmapService {
  static const String _githubRaw = 'https://raw.githubusercontent.com/kamranahmedse/developer-roadmap/master/src/data/roadmaps';

  
  Future<List<Map<String, dynamic>>> fetchAllRoadmaps() async {
    try {
      final response = await http.get(
        Uri.parse('https://raw.githubusercontent.com/kamranahmedse/developer-roadmap/master/src/data/roadmaps.json'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        return _getStaticRoadmapsList();
      }
    } catch (e) {
      return _getStaticRoadmapsList();
    }
  }

  List<Map<String, dynamic>> _getStaticRoadmapsList() {
    return [
      {'id': 'frontend', 'title': 'Frontend Developer', 'description': 'Step by step guide to becoming a frontend developer in 2024'},
      {'id': 'backend', 'title': 'Backend Developer', 'description': 'Step by step guide to becoming a backend developer in 2024'},
      {'id': 'devops', 'title': 'DevOps Engineer', 'description': 'Step by step guide to becoming a DevOps engineer in 2024'},
      {'id': 'android', 'title': 'Android Developer', 'description': 'Step by step guide to becoming an Android developer in 2024'},
      {'id': 'ios', 'title': 'iOS Developer', 'description': 'Step by step guide to becoming an iOS developer in 2024'},
      {'id': 'flutter', 'title': 'Flutter Developer', 'description': 'Step by step guide to becoming a Flutter developer in 2024'},
      {'id': 'python', 'title': 'Python Developer', 'description': 'Step by step guide to becoming a Python developer in 2024'},
      {'id': 'java', 'title': 'Java Developer', 'description': 'Step by step guide to becoming a Java developer in 2024'},
      {'id': 'react', 'title': 'React Developer', 'description': 'Step by step guide to becoming a React developer in 2024'},
      {'id': 'nodejs', 'title': 'Node.js Developer', 'description': 'Step by step guide to becoming a Node.js developer in 2024'},
      {'id': 'ai-data-scientist', 'title': 'AI and Data Scientist', 'description': 'Step by step guide to becoming an AI and Data Scientist in 2024'},
      {'id': 'cybersecurity', 'title': 'Cyber Security Expert', 'description': 'Step by step guide to becoming a cyber security expert in 2024'},
    ];
  }

  
  Future<RoadmapEntity> fetchRoadmapDetail(String roadmapId) async {
    try {
      final response = await http.get(
        Uri.parse('$_githubRaw/$roadmapId/$roadmapId.json'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final model = RoadmapModel.fromJson(jsonData);
        return model.toEntity();
      } else {
        return _getDetailedRoadmap(roadmapId);
      }
    } catch (e) {
      return _getDetailedRoadmap(roadmapId);
    }
  }

  
  RoadmapEntity _getDetailedRoadmap(String id) {
    switch (id) {
      case 'frontend':
        return RoadmapEntity(
          id: 'frontend',
          title: 'Frontend Developer Roadmap 2024',
          description: 'Complete guide to modern frontend development',
          icon: 'web_rounded',
          level: 'Beginner to Expert',
          duration: '8-10 months',
          nodes: [
            RoadmapNode(
              id: 'html-css',
              label: '📄 HTML & CSS Fundamentals',
              description: 'Learn the building blocks of web pages',
              children: ['javascript'],
              resource: 'https://developer.mozilla.org/en-US/docs/Learn',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'javascript',
              label: '⚡ JavaScript (ES6+)',
              description: 'Master modern JavaScript: variables, functions, promises, async/await',
              children: ['framework'],
              resource: 'https://javascript.info/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'framework',
              label: '⚛️ Frontend Framework',
              description: 'Choose and master React, Vue, or Angular',
              children: ['state-management'],
              resource: 'https://react.dev/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'state-management',
              label: '📊 State Management',
              description: 'Redux, Zustand, Context API, or Vuex',
              children: ['testing'],
              resource: 'https://redux.js.org/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'testing',
              label: '🧪 Testing & Deployment',
              description: 'Unit tests, E2E tests, build tools, and deployment',
              children: [],
              resource: 'https://jestjs.io/',
              isCompleted: false,
            ),
          ],
          resources: [
            'MDN Web Docs',
            'Frontend Masters',
            'CSS Tricks',
            'JavaScript.info',
            'React Documentation',
          ],
        );

      case 'backend':
        return RoadmapEntity(
          id: 'backend',
          title: 'Backend Developer Roadmap 2024',
          description: 'Master server-side development',
          icon: 'storage_rounded',
          level: 'Intermediate to Expert',
          duration: '10-12 months',
          nodes: [
            RoadmapNode(
              id: 'language',
              label: '🔧 Programming Language',
              description: 'Choose: Node.js, Python, Java, Go, or Rust',
              children: ['databases'],
              resource: 'https://nodejs.org/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'databases',
              label: '🗄️ Databases',
              description: 'SQL (PostgreSQL, MySQL) and NoSQL (MongoDB)',
              children: ['apis'],
              resource: 'https://www.postgresql.org/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'apis',
              label: '🌐 API Design',
              description: 'RESTful APIs, GraphQL, gRPC',
              children: ['auth'],
              resource: 'https://graphql.org/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'auth',
              label: '🔐 Authentication & Security',
              description: 'JWT, OAuth, HTTPS, security best practices',
              children: ['devops'],
              resource: 'https://jwt.io/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'devops',
              label: '🚀 DevOps Basics',
              description: 'Docker, CI/CD, cloud services',
              children: [],
              resource: 'https://docker.com/',
              isCompleted: false,
            ),
          ],
          resources: [
            'Node.js Documentation',
            'PostgreSQL Docs',
            'GraphQL Official Site',
            'Docker Documentation',
            'AWS Training',
          ],
        );

      case 'devops':
        return RoadmapEntity(
          id: 'devops',
          title: 'DevOps Engineer Roadmap 2024',
          description: 'Complete DevOps learning path',
          icon: 'cloud_rounded',
          level: 'Intermediate to Expert',
          duration: '12-14 months',
          nodes: [
            RoadmapNode(
              id: 'linux',
              label: '🐧 Linux Fundamentals',
              description: 'Command line, shell scripting, system administration',
              children: ['networking'],
              resource: 'https://linuxjourney.com/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'networking',
              label: '🌐 Networking Basics',
              description: 'TCP/IP, DNS, HTTP/HTTPS, load balancing',
              children: ['cicd'],
              resource: 'https://www.cloudflare.com/learning/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'cicd',
              label: '🔄 CI/CD Pipelines',
              description: 'Jenkins, GitHub Actions, GitLab CI',
              children: ['containers'],
              resource: 'https://www.jenkins.io/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'containers',
              label: '🐳 Containers & Orchestration',
              description: 'Docker, Kubernetes, container orchestration',
              children: ['cloud'],
              resource: 'https://kubernetes.io/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'cloud',
              label: '☁️ Cloud Platforms',
              description: 'AWS, Azure, or GCP',
              children: [],
              resource: 'https://aws.amazon.com/',
              isCompleted: false,
            ),
          ],
          resources: [
            'Linux Academy',
            'Docker Curriculum',
            'Kubernetes Documentation',
            'AWS Training',
            'Terraform Docs',
          ],
        );

      case 'android':
        return RoadmapEntity(
          id: 'android',
          title: 'Android Developer Roadmap 2024',
          description: 'Modern Android development with Kotlin',
          icon: 'android_rounded',
          level: 'Beginner to Expert',
          duration: '7-9 months',
          nodes: [
            RoadmapNode(
              id: 'kotlin',
              label: '💜 Kotlin Programming',
              description: 'Kotlin basics, OOP, coroutines, flows',
              children: ['compose'],
              resource: 'https://kotlinlang.org/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'compose',
              label: '🎨 Jetpack Compose',
              description: 'UI development, state hoisting, theming',
              children: ['architecture'],
              resource: 'https://developer.android.com/compose',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'architecture',
              label: '🏗️ Android Architecture',
              description: 'MVVM, Clean Architecture, repository pattern',
              children: ['jetpack'],
              resource: 'https://developer.android.com/topic/architecture',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'jetpack',
              label: '📦 Jetpack Libraries',
              description: 'Room, ViewModel, Navigation, WorkManager',
              children: ['testing'],
              resource: 'https://developer.android.com/jetpack',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'testing',
              label: '🧪 Testing & Publishing',
              description: 'Unit tests, UI tests, Play Store deployment',
              children: [],
              resource: 'https://developer.android.com/training/testing',
              isCompleted: false,
            ),
          ],
          resources: [
            'Android Developers Docs',
            'Kotlin Documentation',
            'Jetpack Compose Tutorials',
            'Material Design Guidelines',
            'Google Codelabs',
          ],
        );

      case 'flutter':
        return RoadmapEntity(
          id: 'flutter',
          title: 'Flutter Developer Roadmap 2024',
          description: 'Cross-platform mobile development with Flutter',
          icon: 'flutter_dash',
          level: 'Beginner to Expert',
          duration: '6-8 months',
          nodes: [
            RoadmapNode(
              id: 'dart',
              label: '🎯 Dart Programming',
              description: 'Dart syntax, OOP, async programming, futures',
              children: ['flutter-basics'],
              resource: 'https://dart.dev/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'flutter-basics',
              label: '📱 Flutter Fundamentals',
              description: 'Widgets, layouts, navigation, theming',
              children: ['state'],
              resource: 'https://flutter.dev/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'state',
              label: '🔄 State Management',
              description: 'Provider, Bloc, Riverpod, GetX',
              children: ['apis'],
              resource: 'https://docs.flutter.dev/data-and-backend/state-mgmt',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'apis',
              label: '🔌 APIs & Firebase',
              description: 'REST APIs, Firebase, local storage',
              children: ['advanced'],
              resource: 'https://firebase.flutter.dev/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'advanced',
              label: '🚀 Advanced Flutter',
              description: 'Animations, custom paint, performance',
              children: [],
              resource: 'https://flutter.dev/docs/development/ui/animations',
              isCompleted: false,
            ),
          ],
          resources: [
            'Flutter Documentation',
            'Dart Language Tour',
            'Flutter Widget Catalog',
            'Firebase for Flutter',
            'Awesome Flutter',
          ],
        );

      case 'ios':
        return RoadmapEntity(
          id: 'ios',
          title: 'iOS Developer Roadmap 2024',
          description: 'Native iOS development with Swift',
          icon: 'apple_rounded',
          level: 'Beginner to Expert',
          duration: '8-10 months',
          nodes: [
            RoadmapNode(
              id: 'swift',
              label: '🦅 Swift Programming',
              description: 'Swift syntax, optionals, closures, protocols',
              children: ['swiftui'],
              resource: 'https://swift.org/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'swiftui',
              label: '🎨 SwiftUI',
              description: 'Declarative UI, state management, animations',
              children: ['architecture'],
              resource: 'https://developer.apple.com/swiftui/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'architecture',
              label: '🏛️ iOS Architecture',
              description: 'MVVM, Coordinator pattern, Clean Architecture',
              children: ['frameworks'],
              resource: 'https://developer.apple.com/documentation/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'frameworks',
              label: '📱 iOS Frameworks',
              description: 'UIKit, Core Data, Combine, Swift Package Manager',
              children: ['testing'],
              resource: 'https://developer.apple.com/documentation/uikit',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'testing',
              label: '🧪 Testing & App Store',
              description: 'Unit tests, UI tests, App Store Connect',
              children: [],
              resource: 'https://developer.apple.com/app-store-connect/',
              isCompleted: false,
            ),
          ],
          resources: [
            'Apple Developer Documentation',
            'Swift.org',
            'SwiftUI Tutorials',
            'iOS Dev Weekly',
            'Hacking with Swift',
          ],
        );

      case 'python':
        return RoadmapEntity(
          id: 'python',
          title: 'Python Developer Roadmap 2024',
          description: 'Complete Python development path',
          icon: 'code_rounded',
          level: 'Beginner to Expert',
          duration: '6-9 months',
          nodes: [
            RoadmapNode(
              id: 'python-basics',
              label: '🐍 Python Basics',
              description: 'Syntax, data types, functions, OOP',
              children: ['advanced-python'],
              resource: 'https://docs.python.org/3/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'advanced-python',
              label: '⚡ Advanced Python',
              description: 'Decorators, generators, context managers, async',
              children: ['web-framework'],
              resource: 'https://realpython.com/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'web-framework',
              label: '🌐 Web Frameworks',
              description: 'Django, Flask, or FastAPI',
              children: ['databases'],
              resource: 'https://www.djangoproject.com/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'databases',
              label: '🗄️ Databases & ORMs',
              description: 'SQLAlchemy, Django ORM, PostgreSQL',
              children: ['testing'],
              resource: 'https://www.sqlalchemy.org/',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'testing',
              label: '🧪 Testing & Deployment',
              description: 'pytest, unittest, Docker, deployment',
              children: [],
              resource: 'https://docs.pytest.org/',
              isCompleted: false,
            ),
          ],
          resources: [
            'Python.org',
            'Real Python',
            'Django Documentation',
            'Flask Documentation',
            'Python Packaging',
          ],
        );

      default:
        return RoadmapEntity(
          id: id,
          title: '${id[0].toUpperCase() + id.substring(1)} Developer Roadmap 2024',
          description: 'Complete learning path for $id development',
          icon: 'map_rounded',
          level: 'All Levels',
          duration: '6-12 months',
          nodes: [
            RoadmapNode(
              id: 'basics',
              label: '📚 Fundamentals',
              description: 'Learn the core concepts and basics',
              children: ['intermediate'],
              resource: 'https://roadmap.sh',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'intermediate',
              label: '🔧 Intermediate Topics',
              description: 'Dive deeper into advanced concepts',
              children: ['advanced'],
              resource: 'https://roadmap.sh',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'advanced',
              label: '🚀 Advanced Concepts',
              description: 'Master expert-level topics',
              children: ['projects'],
              resource: 'https://roadmap.sh',
              isCompleted: false,
            ),
            RoadmapNode(
              id: 'projects',
              label: '💼 Real-world Projects',
              description: 'Build practical projects to solidify knowledge',
              children: [],
              resource: 'https://roadmap.sh',
              isCompleted: false,
            ),
          ],
          resources: [
            'Official Documentation',
            'Online Courses',
            'Practice Projects',
            'Community Forums',
          ],
        );
    }
  }
}