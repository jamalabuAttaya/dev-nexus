import 'dart:convert';
import 'package:flutter/foundation.dart'; 
import 'package:http/http.dart' as http;
import '../models/roadmap_model.dart';

class RoadmapApiService {
  static const String _baseUrl =
      'https://raw.githubusercontent.com/kamranahmedse/developer-roadmap/refs/heads/master/content/roadmaps';

  static const List<Map<String, String>> _roadmaps = [
    //        Role Based Roadmaps       
    {'id': 'frontend', 'title': 'Frontend Developer', 'description': 'Modern frontend development with React, Vue, or Angular', 'difficulty': 'Beginner to Expert'},
    {'id': 'backend', 'title': 'Backend Developer', 'description': 'Server-side development with Node.js, Python, Java, or Go', 'difficulty': 'Intermediate to Expert'},
    {'id': 'full-stack', 'title': 'Full Stack Developer', 'description': 'Frontend + Backend development', 'difficulty': 'Intermediate to Expert'},
    {'id': 'devops', 'title': 'DevOps Engineer', 'description': 'CI/CD, Cloud, Docker, Kubernetes', 'difficulty': 'Intermediate to Expert'},
    {'id': 'devsecops', 'title': 'DevSecOps Engineer', 'description': 'Security in DevOps practices', 'difficulty': 'Advanced'},
    {'id': 'data-analyst', 'title': 'Data Analyst', 'description': 'Data analysis and visualization', 'difficulty': 'Beginner to Expert'},
    {'id': 'ai-engineer', 'title': 'AI Engineer', 'description': 'Artificial intelligence engineering', 'difficulty': 'Advanced'},
    {'id': 'ai-data-scientist', 'title': 'AI and Data Scientist', 'description': 'Machine learning and AI', 'difficulty': 'Advanced'},
    {'id': 'data-engineer', 'title': 'Data Engineer', 'description': 'Data pipelines and infrastructure', 'difficulty': 'Intermediate to Expert'},
    {'id': 'android', 'title': 'Android Developer', 'description': 'Native Android development with Kotlin', 'difficulty': 'Beginner to Expert'},
    {'id': 'machine-learning', 'title': 'Machine Learning Engineer', 'description': 'ML models and algorithms', 'difficulty': 'Advanced'},
    {'id': 'postgresql-dba', 'title': 'PostgreSQL DBA', 'description': 'PostgreSQL database administration', 'difficulty': 'Intermediate to Expert'},
    {'id': 'ios', 'title': 'iOS Developer', 'description': 'Native iOS development with Swift', 'difficulty': 'Beginner to Expert'},
    {'id': 'blockchain', 'title': 'Blockchain Developer', 'description': 'Blockchain technology', 'difficulty': 'Advanced'},
    {'id': 'qa', 'title': 'QA Engineer', 'description': 'Quality assurance and testing', 'difficulty': 'Beginner to Expert'},
    {'id': 'software-architect', 'title': 'Software Architect', 'description': 'System design and architecture', 'difficulty': 'Expert'},
    {'id': 'cyber-security', 'title': 'Cyber Security Expert', 'description': 'Network security and ethical hacking', 'difficulty': 'Advanced'},
    {'id': 'ux-design', 'title': 'UX Designer', 'description': 'User experience design', 'difficulty': 'Beginner to Expert'},
    {'id': 'technical-writer', 'title': 'Technical Writer', 'description': 'Technical documentation', 'difficulty': 'Beginner to Expert'},
    {'id': 'game-developer', 'title': 'Game Developer', 'description': 'Game development with Unity or Unreal', 'difficulty': 'Intermediate to Expert'},
    {'id': 'server-side-game-developer', 'title': 'Server Side Game Developer', 'description': 'Game server development', 'difficulty': 'Intermediate to Expert'},
    {'id': 'mlops', 'title': 'MLOps Engineer', 'description': 'ML operations and deployment', 'difficulty': 'Advanced'},
    {'id': 'product-manager', 'title': 'Product Manager', 'description': 'Product management', 'difficulty': 'Intermediate'},
    {'id': 'engineering-manager', 'title': 'Engineering Manager', 'description': 'Engineering leadership', 'difficulty': 'Expert'},
    {'id': 'developer-relations', 'title': 'Developer Relations', 'description': 'DevRel and community', 'difficulty': 'Intermediate'},
    {'id': 'bi-analyst', 'title': 'BI Analyst', 'description': 'Business intelligence', 'difficulty': 'Intermediate'},
    {'id': 'api-design', 'title': 'API Design', 'description': 'RESTful API design', 'difficulty': 'Intermediate to Expert'},
    {'id': 'ai-red-teaming', 'title': 'AI Red Teaming', 'description': 'AI security testing', 'difficulty': 'Advanced'},

    //        Skill Based Roadmaps       
    {'id': 'sql', 'title': 'SQL Developer', 'description': 'Structured Query Language', 'difficulty': 'Beginner to Expert'},
    {'id': 'computer-science', 'title': 'Computer Science', 'description': 'CS fundamentals', 'difficulty': 'Beginner to Expert'},
    {'id': 'react', 'title': 'React Developer', 'description': 'Modern frontend with React', 'difficulty': 'Beginner to Expert'},
    {'id': 'vue', 'title': 'Vue.js Developer', 'description': 'Vue.js framework', 'difficulty': 'Beginner to Expert'},
    {'id': 'angular', 'title': 'Angular Developer', 'description': 'Angular framework', 'difficulty': 'Intermediate to Expert'},
    {'id': 'javascript', 'title': 'JavaScript Developer', 'description': 'JavaScript programming', 'difficulty': 'Beginner to Expert'},
    {'id': 'typescript', 'title': 'TypeScript Developer', 'description': 'TypeScript programming', 'difficulty': 'Intermediate to Expert'},
    {'id': 'nodejs', 'title': 'Node.js Developer', 'description': 'Backend JavaScript', 'difficulty': 'Intermediate to Expert'},
    {'id': 'python', 'title': 'Python Developer', 'description': 'Python programming', 'difficulty': 'Beginner to Expert'},
    {'id': 'system-design', 'title': 'System Design', 'description': 'System architecture', 'difficulty': 'Advanced'},
    {'id': 'java', 'title': 'Java Developer', 'description': 'Enterprise Java development', 'difficulty': 'Intermediate to Expert'},
    {'id': 'asp.net-core', 'title': 'ASP.NET Core Developer', 'description': '.NET web development', 'difficulty': 'Intermediate to Expert'},
    {'id': 'spring-boot', 'title': 'Spring Boot Developer', 'description': 'Java Spring framework', 'difficulty': 'Intermediate to Expert'},
    {'id': 'flutter', 'title': 'Flutter Developer', 'description': 'Cross-platform mobile development', 'difficulty': 'Beginner to Expert'},
    {'id': 'c++', 'title': 'C++ Developer', 'description': 'C++ programming', 'difficulty': 'Intermediate to Expert'},
    {'id': 'rust', 'title': 'Rust Developer', 'description': 'Rust programming', 'difficulty': 'Advanced'},
    {'id': 'go', 'title': 'Go Developer', 'description': 'Go programming', 'difficulty': 'Intermediate to Expert'},
    {'id': 'design-architecture', 'title': 'Design Architecture', 'description': 'Software design patterns', 'difficulty': 'Advanced'},
    {'id': 'graphql', 'title': 'GraphQL Developer', 'description': 'GraphQL APIs', 'difficulty': 'Intermediate to Expert'},
    {'id': 'react-native', 'title': 'React Native Developer', 'description': 'Mobile with React', 'difficulty': 'Intermediate to Expert'},
    {'id': 'design-system', 'title': 'Design System', 'description': 'UI/UX design systems', 'difficulty': 'Intermediate'},
    {'id': 'prompt-engineering', 'title': 'Prompt Engineering', 'description': 'AI prompt design', 'difficulty': 'Beginner to Expert'},
    {'id': 'mongodb', 'title': 'MongoDB Developer', 'description': 'NoSQL database', 'difficulty': 'Intermediate to Expert'},
    {'id': 'linux', 'title': 'Linux Administrator', 'description': 'Linux system administration', 'difficulty': 'Intermediate to Expert'},
    {'id': 'kubernetes', 'title': 'Kubernetes Specialist', 'description': 'Container orchestration', 'difficulty': 'Advanced'},
    {'id': 'docker', 'title': 'Docker Expert', 'description': 'Containerization', 'difficulty': 'Intermediate to Expert'},
    {'id': 'aws', 'title': 'AWS Cloud Engineer', 'description': 'Amazon Web Services', 'difficulty': 'Intermediate to Expert'},
    {'id': 'terraform', 'title': 'Terraform Engineer', 'description': 'Infrastructure as Code', 'difficulty': 'Intermediate to Expert'},
    {'id': 'data-structures-algorithms', 'title': 'Data Structures & Algorithms', 'description': 'DSA fundamentals', 'difficulty': 'Beginner to Expert'},
    {'id': 'redis', 'title': 'Redis Developer', 'description': 'In-memory database', 'difficulty': 'Intermediate to Expert'},
    {'id': 'git-github', 'title': 'Git & GitHub', 'description': 'Version control', 'difficulty': 'Beginner to Expert'},
    {'id': 'php', 'title': 'PHP Developer', 'description': 'PHP programming', 'difficulty': 'Beginner to Expert'},
    {'id': 'cloudflare', 'title': 'Cloudflare Engineer', 'description': 'Cloudflare services', 'difficulty': 'Intermediate to Expert'},
    {'id': 'ai-agents', 'title': 'AI Agents Developer', 'description': 'AI agent development', 'difficulty': 'Advanced'},
    {'id': 'next.js', 'title': 'Next.js Developer', 'description': 'React framework', 'difficulty': 'Intermediate to Expert'},
    {'id': 'kotlin', 'title': 'Kotlin Developer', 'description': 'Kotlin programming', 'difficulty': 'Beginner to Expert'},
    {'id': 'html', 'title': 'HTML Developer', 'description': 'HTML markup', 'difficulty': 'Beginner'},
    {'id': 'css', 'title': 'CSS Developer', 'description': 'CSS styling', 'difficulty': 'Beginner to Expert'},
    {'id': 'swift', 'title': 'Swift Developer', 'description': 'Swift programming', 'difficulty': 'Beginner to Expert'},
    {'id': 'shell-bash', 'title': 'Shell/Bash Scripting', 'description': 'Command line scripting', 'difficulty': 'Intermediate'},
    {'id': 'laravel', 'title': 'Laravel Developer', 'description': 'PHP framework', 'difficulty': 'Intermediate to Expert'},
    {'id': 'elasticsearch', 'title': 'Elasticsearch Engineer', 'description': 'Search and analytics', 'difficulty': 'Advanced'},
    {'id': 'wordpress', 'title': 'WordPress Developer', 'description': 'WordPress CMS', 'difficulty': 'Beginner to Expert'},
    {'id': 'django', 'title': 'Django Developer', 'description': 'Python web framework', 'difficulty': 'Intermediate to Expert'},
    {'id': 'ruby', 'title': 'Ruby Developer', 'description': 'Ruby programming', 'difficulty': 'Beginner to Expert'},
    {'id': 'ruby-on-rails', 'title': 'Ruby on Rails Developer', 'description': 'Rails framework', 'difficulty': 'Intermediate to Expert'},
    {'id': 'claude-code', 'title': 'Claude Code', 'description': 'Claude AI coding', 'difficulty': 'Beginner'},
    {'id': 'vibe-coding', 'title': 'Vibe Coding', 'description': 'Creative coding', 'difficulty': 'Beginner'},
    {'id': 'postgresql', 'title': 'PostgreSQL Developer', 'description': 'PostgreSQL database', 'difficulty': 'Intermediate to Expert'},

    //        Absolute Beginners       
    {'id': 'frontend-beginner', 'title': 'Frontend Beginner', 'description': 'Start frontend development', 'difficulty': 'Beginner'},
    {'id': 'backend-beginner', 'title': 'Backend Beginner', 'description': 'Start backend development', 'difficulty': 'Beginner'},
    {'id': 'devops-beginner', 'title': 'DevOps Beginner', 'description': 'Start DevOps journey', 'difficulty': 'Beginner'},
    {'id': 'git-github-beginner', 'title': 'Git & GitHub Beginner', 'description': 'Start with version control', 'difficulty': 'Beginner'},

    //        Best Practices       
    {'id': 'aws-best-practices', 'title': 'AWS Best Practices', 'description': 'AWS cloud best practices', 'difficulty': 'Intermediate'},
    {'id': 'api-security', 'title': 'API Security', 'description': 'Secure API design', 'difficulty': 'Intermediate to Expert'},
    {'id': 'backend-performance', 'title': 'Backend Performance', 'description': 'Optimize backend', 'difficulty': 'Advanced'},
    {'id': 'frontend-performance', 'title': 'Frontend Performance', 'description': 'Optimize frontend', 'difficulty': 'Advanced'},
    {'id': 'code-review', 'title': 'Code Review', 'description': 'Code review best practices', 'difficulty': 'Intermediate'},

    //        Project Ideas       
    {'id': 'project-ideas-frontend', 'title': 'Frontend Projects', 'description': 'Frontend project ideas', 'difficulty': 'All Levels'},
    {'id': 'project-ideas-backend', 'title': 'Backend Projects', 'description': 'Backend project ideas', 'difficulty': 'All Levels'},
    {'id': 'project-ideas-devops', 'title': 'DevOps Projects', 'description': 'DevOps project ideas', 'difficulty': 'All Levels'},
  ];

  
  Future<List<Map<String, dynamic>>> fetchAllRoadmaps() async {
    return _roadmaps
        .map((e) => {
              'id': e['id'] ?? '',
              'title': e['title'] ?? 'Unknown',
              'description': e['description'] ?? '',
              'level': e['difficulty'] ?? 'All Levels',
            })
        .toList();
  }

  
  Future<RoadmapModel> fetchRoadmapDetail(String id) async {
    final url = '$_baseUrl/$id/content.json';
    debugPrint(' Fetching roadmap from GitHub: $url');

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) {
        debugPrint(' Failed to load roadmap "$id": ${response.statusCode}');
        throw Exception('Failed to load roadmap "$id" (${response.statusCode})');
      }

      final dynamic decoded = json.decode(response.body);
      
      
      if (decoded is Map<String, dynamic>) {
        return RoadmapModel.fromJson(decoded);
      } else if (decoded is List && decoded.isNotEmpty) {
        debugPrint(' Received List instead of Map, taking first element');
        final firstItem = decoded.first;
        if (firstItem is Map<String, dynamic>) {
          return RoadmapModel.fromJson(firstItem);
        }
      }

      throw Exception('Unexpected format for roadmap "$id"');
    } catch (e) {
      debugPrint(' Network error for "$id": $e');
      rethrow;
    }
  }
}