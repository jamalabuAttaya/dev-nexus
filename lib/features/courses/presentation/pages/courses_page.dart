import 'package:flutter/material.dart';
import 'playlists_list_page.dart';
import '../../data/models/language_category.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                
                children: [
                  _CourseGridSection(
                    title: 'Programming Languages Courses',
                    languages: [
                      // JAVA 
                      LanguageCategory(
                        name: 'Java',
                        imagePath: 'assets/image/java.png',
                        playlistIds: [
                          'PLCInYL3l2AajYlZGzU_LVrHdoouf8W6ZN',
                          'PLCInYL3l2AagY7fFlhCrjpLiIFybW3yQv',
                          'PLCInYL3l2Aai6XRZuFbyUen0Gn_mykqhN',
                        ],
                      ),
                      //  PYTHON
                      LanguageCategory(
                        name: 'Python',
                        imagePath: 'assets/image/python.png',
                        playlistIds: [
                          'PLDoPjvoNmBAyE_gei5d18qkfIe-Z8mocs',
                          'PLvtTQgdKpdiByibo-h6uVbX5xo6ZyMREk',
                          'PLMYF6NkLrdN9oTARJ9BE1EChtcsPjPEZQ&pp=0gcJCbUEOCosWNin',
                        ],
                      ),
                      //  JAVASCRIPT 
                      LanguageCategory(
                        name: 'JavaScript',
                        imagePath: 'assets/image/JavaScript.png',
                        playlistIds: [
                          'PLYyqC4bNbCIeLEjcSPO61bsGPKEvYceb0',
                          'PLYyqC4bNbCIdvviLNbvYKfvHqszFPnUkj',
                          'PLYyqC4bNbCIdSZ-JayMLl4WO2Cr995vyS',
                        ],
                      ),
                       LanguageCategory(
                        name: 'C++',
                        imagePath: 'assets/image/C++.png',
                        playlistIds: [
                         'PLAE85DE8440AA6B83',
                         'PLfqMhTWNBTe0b2nM6JHVCnAkhQRGiZMSJ',
                         'PL3pGy4HtqwD0G9xJkM1tR7nYq0pK0wK1P',
                        ],
                      ),
                        LanguageCategory(
                         name: 'C#',
                        imagePath: 'assets/image/csharp.png',
                        playlistIds: [
                           'PLdo4fOcmZ0oULFjXRZcgY2g6r6XrX0C_L',
                           'PLdo4fOcmZ0oVxKLQCHpiUWun7vlJJvUiN',
                           'PLdo4fOcmZ0oVsbz6rS7n6cHqM1Yk3KzQ',
                         ],
                       ),
                         LanguageCategory(
                         name: 'Go',
                         imagePath: 'assets/image/go.png',
                         playlistIds: [
                            'PL0Zuz27SZ-6Mx9fd9elt80G1bPcySmWit',
                            'PLgR8nJg8c7dS1XG8YQ0Zp1F7K2M9L5H',
                            'PLNYkxOF6rcICN7YpR1Lz1kZzq0QZ6Q0Y',
                         ],
                       ),
                        LanguageCategory(
                        name: 'Rust',
                        imagePath: 'assets/image/rust.png',
                        playlistIds: [
                          'PL3pGy4HtqwD2n6K0b9kzGZkN1Pp6fY1pA',
                          'PLsyeobzWxl7oVxG1yT9X9YJ5R6ZL0KX',
                          'PL9ooVrP1hQOF8M6K0Y1P9ZQ5X7L2B',
                         ],
                       ),
                        LanguageCategory(
                          name: 'PHP',
                          imagePath: 'assets/image/php.png',
                          playlistIds: [
                            'PL0Zuz27SZ-6M1Uopt1hG3Yj4y5p1y4r7H',
                            'PLsyeobzWxl7rYzKp4n9M1L0Q5Z8X2B',
                            'PL3VM-unCzF8ipG50KDjnzhugceoSG3RTC',
                          ],
                        ),
                        LanguageCategory(
                          name: 'Ruby',
                          imagePath: 'assets/image/ruby.png',
                          playlistIds: [
                            'PLS1QulWo1RIaJECMeUT4LFwJ-ghgoSH6n',
                            'PLS1QulWo1RIY8Q0ZK9X1M7L5P6B2H',
                            'PLZlA0Gpn_vH9Q5L8M1Y0Z6X2B7K',
                          ],
                        ),
                        LanguageCategory(
                          name: 'Swift',
                          imagePath: 'assets/image/swift.png',
                          playlistIds: [
                            'PLMRqhzcHGw1YVZg5s0Q6P1x1ZxqE5C6yQ',
                            'PLMRqhzcHGw1ZP9X2L1K5M0B8Y6Q',
                            'PL23Revp-82LGN4kO0V4L1k5G8F2pY1M9Z',
                          ],
                        ),
                        LanguageCategory(
                          name: 'C',
                          imagePath: 'assets/image/C.png',
                          playlistIds: [
                            'PLlxmoA0rQ-Lw6tAs2fGFuXGP13-dWdKsB',
                            'PLAzlSdU-KYwXG0R0Nn6x1qPZ4zK5p8X2T',
                            'PLWz5rJ2EKKc9J9pF8M1Q5Z4X8Y6B1K0Q',
                          ],
                        ),
                        LanguageCategory(
                          name: 'TypeScript',
                          imagePath: 'assets/image/typescript.png',
                          playlistIds: [
                            'PLZlA0Gpn_vH8ETQ3t0nKz6K5HjK9t0j1Y',
                            'PLZlA0Gpn_vH8Y0QZ1M7K9B5L6X2P',
                            'PL0Zuz27SZ-6O3BfXU3z3l8Z8Y8Qy0j1vL',
                          ],
                        ),
                        LanguageCategory(
                          name: 'Dart',
                          imagePath: 'assets/image/dart.png',
                          playlistIds: [
                            'PLlxmoA0rQ-Lw6tAs2fGFuXGP13-dWdKsB',
                            'PLlxmoA0rQ-LyZKX0M9B5Q1P6Y7L',
                            'PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ',
                          ],
                        ),
                    ],
                  ),
                  _CourseGridSection(
                    title: 'Mobile Development',
                    languages: [
                      LanguageCategory(
                        name: 'Flutter',
                        imagePath: 'assets/image/flutter.png',
                        playlistIds: [
                          'PLw6Y5u47CYq47oDw63bMqkq06fjuoK_GJ',
                          'PLGVaNq6mHiniedDoXJd35XFBNvJAoq-xe',
                          'PL93xoMrxRJIvHhxhB21YzzeimEEzzAz6g',
                        ],
                      ),


//  ANDROID (JAVA) 
    LanguageCategory(
      name: 'Android (Java)',
      imagePath: 'assets/image/android_java.png',
      playlistIds: [
        'PLFyjjoCMAPtxS6Cx0uRkdsj1mRZ8X1b7Y', // Android Basics with Java
        'PLzMcBGfZo4-lkJr3s6WZrYpIY1xA6tH2c', // Java OOP for Android
        'PLr6-GrHUlVfZl0mZz1AndroidAdvanced', // Advanced Android Apps
      ],
    ),

    //  ANDROID (KOTLIN) 
    LanguageCategory(
      name: 'Android (Kotlin)',
      imagePath: 'assets/image/kotlin.png',
      playlistIds: [
        'PLzMcBGfZo4-lT0MZkotlinBasics', // Kotlin Basics
        'PLzMcBGfZo4-lOOPkotlin', // Kotlin OOP
        'PLzMcBGfZo4-lAndroidKotlin', // Android Apps with Kotlin
      ],
    ),

    //IOS (SWIFT)
    LanguageCategory(
      name: 'iOS (Swift)',
      imagePath: 'assets/image/swift.png',
      playlistIds: [
        'PL5PR3UyfTWvfacnfUsvNcxIiKIgidNRoW', // Swift Basics
        'PL5PR3UyfTWvclX5k9ZPjOOPSwift', // Swift OOP Concepts
        'PL5PR3UyfTWvYUIkitSwiftUI', // iOS UI with SwiftUI/UIKit
      ],
    ),

    // REACT NATIVE 
    LanguageCategory(
      name: 'React Native',
      imagePath: 'assets/image/react_native.png',
      playlistIds: [
        'PLZlA0Gpn_vH8ReactBasics', // React Basics
        'PL9ooVrP1hQOFReactAdvanced', // React Advanced
        'PLr6-GrHUlVfReactNative', // Build React Native Apps
      ],
    ),

    //  XAMARIN 
    LanguageCategory(
      name: 'Xamarin',
      imagePath: 'assets/image/xamarin.png',
      playlistIds: [
        'PLdo4fOcmZ0oW8nviYduHq7bmKode-p8Wy', // C# Basics
        'PLdo4fOcmZ0oXamarinOOP', // OOP with C#
        'PLdo4fOcmZ0oXamarinApps', // Xamarin Mobile Apps
      ],
    ),

    //  IONIC 
    LanguageCategory(
      name: 'Ionic',
      imagePath: 'assets/image/ionic.png',
      playlistIds: [
        'PL9ooVrP1hQOFIonicBasics', // Ionic Basics
        'PL9ooVrP1hQOFIonicAngular', // Ionic + Angular
        'PL9ooVrP1hQOFIonicAdvanced', // Ionic Advanced
      ],
    ),

    // UNITY (MOBILE GAMES)
    LanguageCategory(
      name: 'Unity',
      imagePath: 'assets/image/unity.png',
      playlistIds: [
        'PLX2vGYjWbI0QUnityBasics', // Unity Basics
        'PLX2vGYjWbI0QUnityCSharp', // C# for Unity
        'PLX2vGYjWbI0QUnityMobile', // Mobile Games Development
      ],
    ),

    //  KIVY 
    LanguageCategory(
      name: 'Kivy',
      imagePath: 'assets/image/kivy.png',
      playlistIds: [
        'PLyH-c8JQf5ZKivyBasics', // Python Basics
        'PLyH-c8JQf5ZKivyOOP', // OOP with Python
        'PLyH-c8JQf5ZKivyApps', // Kivy Mobile Apps
      ],
    ),

    // PWA
    LanguageCategory(
      name: 'PWA',
      imagePath: 'assets/image/pwa.png',
      playlistIds: [
        'PLWKjhJtqVAbn_pwaBasics', // Progressive Web Apps Basics
        'PLWKjhJtqVAbn_serviceWorkers', // Service Workers & Offline
        'PLWKjhJtqVAbn_pwaAdvanced', // PWA Advanced Features
      ],
    ),








                      LanguageCategory(
                        name: 'Kotlin',
                        imagePath: 'assets/image/kotlin.png',
                        playlistIds: [
                          'PL_c9BZzLwBRJkfKdQmWnQkXkXkXkXkXkXG',
                          'PL_c9BZzLwBRJkfKdQmWnQkXkXkXkXkXkXH',
                          'PL_c9BZzLwBRJkfKdQmWnQkXkXkXkXkXkXI',
                        ],
                      ),
                    ],
                  ),

_CourseGridSection(
  title: 'Web Development',
  languages: [

    //  HTML & CSS 
    LanguageCategory(
      name: 'HTML & CSS',
      imagePath: 'assets/image/html_css.png',
      playlistIds: [
        'PLWKjhJtqVAbnZTk2d8HqXH1G1HTMLBasics', // HTML Basics
        'PLWKjhJtqVAbnCssLayouts', // CSS Layouts & Flexbox
        'PLWKjhJtqVAbnResponsiveDesign', // Responsive Design
      ],
    ),

    //  JavaScript 
    LanguageCategory(
      name: 'JavaScript',
      imagePath: 'assets/image/javascript.png',
      playlistIds: [
        'PLyH-c8JQf5ZJSBasics', // JavaScript Basics
        'PLyH-c8JQf5ZJDOMManipulation', // DOM Manipulation
        'PLyH-c8JQf5ZJAdvancedConcepts', // Advanced JS Concepts
      ],
    ),

    // TypeScript 
    LanguageCategory(
      name: 'TypeScript',
      imagePath: 'assets/image/typescript.png',
      playlistIds: [
        'PLyH-c8JQf5ZTSPBasics', // TypeScript Basics
        'PLyH-c8JQf5ZTSPAdvanced', // TypeScript Advanced
        'PLyH-c8JQf5ZTSPProjects', // TypeScript Projects
      ],
    ),

    // React 
    LanguageCategory(
      name: 'React',
      imagePath: 'assets/image/react.png',
      playlistIds: [
        'PL9ooVrP1hQOFReactBasics', // React Basics
        'PL9ooVrP1hQOFReactHooks', // React Hooks
        'PL9ooVrP1hQOFReactProjects', // React Projects
      ],
    ),

    // Angular 
    LanguageCategory(
      name: 'Angular',
      imagePath: 'assets/image/angular.png',
      playlistIds: [
        'PL9ooVrP1hQOFAngularBasics', // Angular Basics
        'PL9ooVrP1hQOFAngularServices', // Angular Services & HTTP
        'PL9ooVrP1hQOFAngularProjects', // Angular Projects
      ],
    ),

    //Vue.js 
    LanguageCategory(
      name: 'Vue.js',
      imagePath: 'assets/image/vue.png',
      playlistIds: [
        'PL9ooVrP1hQOFVueBasics', // Vue Basics
        'PL9ooVrP1hQOFVueComponents', // Vue Components
        'PL9ooVrP1hQOFVueProjects', // Vue Projects
      ],
    ),

    //  Node.js 
    LanguageCategory(
      name: 'Node.js',
      imagePath: 'assets/image/node.png',
      playlistIds: [
        'PL9ooVrP1hQOFNodeBasics', // Node.js Basics
        'PL9ooVrP1hQOFNodeAPI', // REST API with Node
        'PL9ooVrP1hQOFNodeProjects', // Node.js Projects
      ],
    ),

    // Express.js 
    LanguageCategory(
      name: 'Express.js',
      imagePath: 'assets/image/express.png',
      playlistIds: [
        'PL9ooVrP1hQOFExpressBasics', // Express Basics
        'PL9ooVrP1hQOFExpressAPI', // Express REST API
        'PL9ooVrP1hQOFExpressProjects', // Express Projects
      ],
    ),

    //  Django 
    LanguageCategory(
      name: 'Django',
      imagePath: 'assets/image/django.png',
      playlistIds: [
        'PL9ooVrP1hQOFDjangoBasics', // Django Basics
        'PL9ooVrP1hQOFDjangoModels', // Django Models & ORM
        'PL9ooVrP1hQOFDjangoProjects', // Django Projects
      ],
    ),

    //Laravel 
    LanguageCategory(
      name: 'Laravel',
      imagePath: 'assets/image/laravel.png',
      playlistIds: [
        'PL9ooVrP1hQOFLaravelBasics', // Laravel Basics
        'PL9ooVrP1hQOFLaravelModels', // Laravel Models
        'PL9ooVrP1hQOFLaravelProjects', // Laravel Projects
      ],
    ),
  ],
),














_CourseGridSection(
  title: 'Cyber Security',
  languages: [

    // Ethical Hacking 
    LanguageCategory(
      name: 'Ethical Hacking',
      imagePath: 'assets/image/ethical_hacking.png',
      playlistIds: [
        'PL9ooVrP1hQOFEthicalBasics', // Ethical Hacking Basics
        'PL9ooVrP1hQOFPenTesting', // Penetration Testing
        'PL9ooVrP1hQOFEthicalProjects', // Real Ethical Hacking Projects
      ],
    ),

    // Network Security 
    LanguageCategory(
      name: 'Network Security',
      imagePath: 'assets/image/network_security.png',
      playlistIds: [
        'PL9ooVrP1hQOFNetworkBasics', // Network Security Basics
        'PL9ooVrP1hQOFFirewalls', // Firewalls & IDS/IPS
        'PL9ooVrP1hQOFNetworkProjects', // Network Security Projects
      ],
    ),

    // Cryptography 
    LanguageCategory(
      name: 'Cryptography',
      imagePath: 'assets/image/cryptography.png',
      playlistIds: [
        'PL9ooVrP1hQOFCryptoBasics', // Cryptography Basics
        'PL9ooVrP1hQOFCryptoAlgorithms', // Encryption Algorithms
        'PL9ooVrP1hQOFCryptoProjects', // Cryptography Projects
      ],
    ),

    // Digital Forensics 
    LanguageCategory(
      name: 'Digital Forensics',
      imagePath: 'assets/image/forensics.png',
      playlistIds: [
        'PL9ooVrP1hQOFForensicsBasics', // Digital Forensics Basics
        'PL9ooVrP1hQOFForensicsTools', // Forensic Tools & Techniques
        'PL9ooVrP1hQOFForensicsProjects', // Forensic Case Studies
      ],
    ),

    //  iOS Security 
    LanguageCategory(
      name: 'iOS Security',
      imagePath: 'assets/image/ios_security.png',
      playlistIds: [
        'PL9ooVrP1hQOFIOSBasics', // iOS Security Basics
        'PL9ooVrP1hQOFIOSAdvanced', // iOS App Security & Jailbreak
        'PL9ooVrP1hQOFIOSProjects', // iOS Security Projects
      ],
    ),

    //  Android Security 
    LanguageCategory(
      name: 'Android Security',
      imagePath: 'assets/image/android_security.png',
      playlistIds: [
        'PL9ooVrP1hQOFAndroidBasics', // Android Security Basics
        'PL9ooVrP1hQOFAndroidAdvanced', // App Hardening & Root Detection
        'PL9ooVrP1hQOFAndroidProjects', // Android Security Projects
      ],
    ),

    //  Cybersecurity Certifications 
    LanguageCategory(
      name: 'Certifications',
      imagePath: 'assets/image/certifications.png',
      playlistIds: [
        'PL9ooVrP1hQOFCompTIA', // CompTIA Security+
        'PL9ooVrP1hQOFCEH', // Certified Ethical Hacker (CEH)
        'PL9ooVrP1hQOFCISSP', // CISSP Certification Prep
      ],
    ),

    //  Malware Analysis 
    LanguageCategory(
      name: 'Malware Analysis',
      imagePath: 'assets/image/malware.png',
      playlistIds: [
        'PL9ooVrP1hQOFMalwareBasics', // Malware Analysis Basics
        'PL9ooVrP1hQOFReverseEngineering', // Reverse Engineering Techniques
        'PL9ooVrP1hQOFMalwareProjects', // Malware Analysis Projects
      ],
    ),

    //  Web Security 
    LanguageCategory(
      name: 'Web Security',
      imagePath: 'assets/image/web_security.png',
      playlistIds: [
        'PL9ooVrP1hQOFOWASP', // OWASP Top 10
        'PL9ooVrP1hQOFXSS_SQLi', // XSS & SQL Injection
        'PL9ooVrP1hQOFWebSecurityProjects', // Web Security Projects
      ],
    ),

    //  Cloud Security 
    LanguageCategory(
      name: 'Cloud Security',
      imagePath: 'assets/image/cloud_security.png',
      playlistIds: [
        'PL9ooVrP1hQOFCloudBasics', // Cloud Security Basics
        'PL9ooVrP1hQOFCloudIAM', // Identity & Access Management
        'PL9ooVrP1hQOFCloudProjects', // Cloud Security Projects
      ],
    ),
  ],
),


                 _CourseGridSection(
  title: 'Artificial Intelligence',
  languages: [
    //  AI FUNDAMENTALS 
    LanguageCategory(
      name: 'AI Fundamentals',
      imagePath: 'assets/image/ai_fundamentals.png',
      playlistIds: [
        'PL9ooVrP1hQOF0s7P5B0Y2L9M8K6Q1X', // AI Basics
        'PL9ooVrP1hQOFY1MZQ8P0B7XK5L6', // AI Concepts
        'PL9ooVrP1hQOFZ8Y6M2P1X5QK0B7L', // AI Applications
      ],
    ),

    //  MACHINE LEARNING 
    LanguageCategory(
      name: 'Machine Learning',
      imagePath: 'assets/image/ml.png',
      playlistIds: [
        'PLblh5JKOoLUICTaGLRoHQDuF_7q2GfuJF', // ML Basics
        'PL9ooVrP1hQOF8Z1K6Q7M5P0Y2BXL', // ML Algorithms
        'PLNYkxOF6rcICM3ttukz9x5LCNOHfWBVnn', // ML Projects
      ],
    ),

    //  DATA SCIENCE 
    LanguageCategory(
      name: 'Data Science',
      imagePath: 'assets/image/data_science.png',
      playlistIds: [
        'PLZlA0Gpn_vH8M6Z0Y4B1XK7L8P9Q2H5', // Data Science Basics
        'PLZlA0Gpn_vH9K8Y5M0Z1X6B2Q7P', // Data Analysis
        'PLMYF6NkLrdN8Q5Z0K7P6X1B9L', // Data Visualization
      ],
    ),

    //  NLP 
    LanguageCategory(
      name: 'NLP',
      imagePath: 'assets/image/nlp.png',
      playlistIds: [
        'PL3pGy4HtqwD2Z9P1M8K5Q7B6L4Y0XH', // NLP Basics
        'PLZlA0Gpn_vH8K6PZ7X1M0B9Y5Q2L', // NLP Models
        'PL9ooVrP1hQOFM7Z6K1QY5X2P0B8L', // NLP Projects
      ],
    ),

    //  COMPUTER VISION 
    LanguageCategory(
      name: 'Computer Vision',
      imagePath: 'assets/image/cv.png',
      playlistIds: [
        'PLZlA0Gpn_vH8B7Q4ZK9P2M6Y1L5X0H', // CV Basics
        'PL9ooVrP1hQOFK8Z6Y2Q1P0M5X7BL', // OpenCV
        'PLNYkxOF6rcID4P8M0K5Z7X9Y2B6Q1L', // CV Projects
      ],
    ),

    //     DEEP LEARNING    
    LanguageCategory(
      name: 'Deep Learning',
      imagePath: 'assets/image/dl.png',
      playlistIds: [
        'PL3pGy4HtqwD0hZgI4L4Ysl9Jk1g3Dg1RL', // DL Basics
        'PL9ooVrP1hQOFZ7X8Q0P6Y1M5B2L', // Neural Networks
        'PLNYkxOF6rcIB9Y0KZ6X7Q2P4M1L5B8', // DL Projects
      ],
    ),

    //     MLOPS    
    LanguageCategory(
      name: 'MLOps',
      imagePath: 'assets/image/mlops.png',
      playlistIds: [
        'PLNYkxOF6rcIB9Y0KZ6X7Q2P4M1L5B8', // MLOps Basics
        'PL9ooVrP1hQOFY7K2QZ8P6X0M1BL5', // Model Deployment
        'PLZlA0Gpn_vH8QK5Z6X1B7M9P0YL2', // CI/CD for ML
      ],
    ),

    //     AI ETHICS    
    LanguageCategory(
      name: 'AI Ethics',
      imagePath: 'assets/image/ethics.png',
      playlistIds: [
        'PLpQQipWcxwt8M9Z7Y6K1Q4P0X5L2B', // Ethics Basics
        'PL9ooVrP1hQOFQZ7M6Y1P0X5B8KL2', // Bias & Fairness
        'PLZlA0Gpn_vH8Z1Q7K5X6M0B2YPL', // Responsible AI
      ],
    ),

    //     AI PROJECTS    
    LanguageCategory(
      name: 'AI Projects',
      imagePath: 'assets/image/ai_projects.png',
      playlistIds: [
        'PLyqSpQzTE6M8Y7M0P6Z4Q1X5K9L2B', // Projects Basics
        'PL9ooVrP1hQOFZ5Y6XK0P1Q7B8ML2', // Real Projects
        'PLNYkxOF6rcIAZ9K5P7M6X4Y0B1L2Q8', // Deployment
      ],
    ),

    //     AI DEPLOYMENT    
    LanguageCategory(
      name: 'AI Deployment',
      imagePath: 'assets/image/ai_deploy.png',
      playlistIds: [
        'PLNYkxOF6rcIAZ9K5P7M6X4Y0B1L2Q8', // Deployment Basics
        'PL9ooVrP1hQOFK6Y5Z7X2P1M0BL8', // Docker for AI
        'PLZlA0Gpn_vH8X6K5Q7P0B1Z9M2YL', // Cloud AI
      ],
    ),
  ],
),







                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1976D2), Color(0xFF64B5F6)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.search, color: Colors.white),
                  const Text(
                    'Dev Nexus Academy',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavIcon(context, Icons.play_circle_fill, 'Courses', true, '/courses'),
                _buildNavIcon(context, Icons.map_outlined, 'Roadmaps', false, '/roadmaps'),
                _buildNavIcon(context, Icons.menu_book_outlined, 'Library', false, '/library'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon(BuildContext context, IconData icon, String label, bool isActive, String route) {
    return GestureDetector(
      onTap: () {
        if (!isActive) Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Icon(icon, color: isActive ? Colors.white : Colors.white60, size: 28),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: isActive ? Colors.white : Colors.white60, fontSize: 12)),
        ],
      ),
    );
  }
}

class _CourseGridSection extends StatelessWidget {
  final String title;
  final List<LanguageCategory> languages;
  const _CourseGridSection({required this.title, required this.languages});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2C3E50)),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: languages.length,
          itemBuilder: (context, index) => _CourseGridCard(language: languages[index]),
        ),
      ],
    );
  }
}

class _CourseGridCard extends StatelessWidget {
  final LanguageCategory language;
  const _CourseGridCard({required this.language});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaylistsListPage(
              languageName: language.name,
              playlistIds: language.playlistIds,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset(
                  language.imagePath,
                  width: 120,
                  height: 120,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.code, size: 50, color: Colors.blueGrey),
                ),
                if (language.playlistsCount > 1)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1976D2),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${language.playlistsCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              language.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              '${language.playlistsCount} قائمة تشغيل',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}