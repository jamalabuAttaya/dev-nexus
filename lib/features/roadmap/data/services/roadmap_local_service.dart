import '../../domain/entities/roadmap_entity.dart';

class RoadmapLocalService {
  List<Map<String, dynamic>> getAllRoadmaps() {
  return [
    {'id': 'frontend', 'title': 'Frontend Developer', 'description': 'Modern frontend roadmap 2026', 'level': 'Beginner to Expert'},
    {'id': 'backend', 'title': 'Backend Developer', 'description': 'Server-side mastery 2026', 'level': 'Intermediate to Expert'},
    {'id': 'devops', 'title': 'DevOps Engineer', 'description': 'CI/CD & Cloud 2026', 'level': 'Intermediate to Expert'},
    {'id': 'flutter', 'title': 'Flutter Developer', 'description': 'Cross-platform apps 2026', 'level': 'Beginner to Expert'},
    {'id': 'android', 'title': 'Android Developer', 'description': 'Kotlin & Jetpack 2026', 'level': 'Beginner to Expert'},
    {'id': 'ios', 'title': 'iOS Developer', 'description': 'Swift & SwiftUI 2026', 'level': 'Beginner to Expert'},
    {'id': 'python', 'title': 'Python Developer', 'description': 'From basics to advanced 2026', 'level': 'Beginner to Expert'},
    {'id': 'java', 'title': 'Java Developer', 'description': 'Enterprise development 2026', 'level': 'Intermediate to Expert'},
    {'id': 'react', 'title': 'React Developer', 'description': 'Modern frontend with React 2026', 'level': 'Beginner to Expert'},
    {'id': 'nodejs', 'title': 'Node.js Developer', 'description': 'Backend JavaScript 2026', 'level': 'Intermediate to Expert'},
    {'id': 'ai-data-scientist', 'title': 'AI & Data Scientist', 'description': 'Machine learning & AI 2026', 'level': 'Advanced'},
    {'id': 'cybersecurity', 'title': 'Cyber Security Expert', 'description': 'Security specialist 2026', 'level': 'Advanced'},
    {'id': 'angular', 'title': 'Angular Developer', 'description': 'Enterprise frontend with Angular 2026', 'level': 'Intermediate to Expert'},
    {'id': 'vue', 'title': 'Vue.js Developer', 'description': 'Progressive frontend framework 2026', 'level': 'Beginner to Expert'},
    {'id': 'golang', 'title': 'Go Developer', 'description': 'Systems programming with Go 2026', 'level': 'Intermediate to Expert'},
    {'id': 'rust', 'title': 'Rust Developer', 'description': 'Safe systems programming 2026', 'level': 'Advanced'},
    {'id': 'kubernetes', 'title': 'Kubernetes Specialist', 'description': 'Container orchestration 2026', 'level': 'Advanced'},
    {'id': 'docker', 'title': 'Docker Expert', 'description': 'Containerization master 2026', 'level': 'Intermediate to Expert'},
    {'id': 'aws', 'title': 'AWS Cloud Engineer', 'description': 'Amazon Web Services 2026', 'level': 'Intermediate to Expert'},
    {'id': 'azure', 'title': 'Azure Cloud Engineer', 'description': 'Microsoft Azure 2026', 'level': 'Intermediate to Expert'},
    {'id': 'gcp', 'title': 'Google Cloud Engineer', 'description': 'Google Cloud Platform 2026', 'level': 'Intermediate to Expert'},
    {'id': 'qa', 'title': 'QA Engineer', 'description': 'Quality assurance & testing 2026', 'level': 'Beginner to Expert'},
    {'id': 'ux-design', 'title': 'UX Designer', 'description': 'User experience design 2026', 'level': 'Beginner to Expert'},
    {'id': 'game-developer', 'title': 'Game Developer', 'description': 'Game development path 2026', 'level': 'Intermediate to Expert'},
  ];
}

  RoadmapEntity getRoadmapDetail(String id) {
    
    switch (id) {
      case 'frontend':
        return RoadmapEntity(
          id: 'frontend',
          title: 'Frontend Developer Roadmap 2026',
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
      
      default:
        return RoadmapEntity(
          id: id,
          title: '${id[0].toUpperCase() + id.substring(1)} Developer Roadmap 2026',
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