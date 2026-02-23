import '../../domain/entities/roadmap_entity.dart';

class RoadmapModel {
  final String id;
  final String title;
  final String description;
  final String seo;
  final String? pdfUrl;
  final Map<String, dynamic> nodes;

  RoadmapModel({
    required this.id,
    required this.title,
    required this.description,
    required this.seo,
    this.pdfUrl,
    required this.nodes,
  });

  factory RoadmapModel.fromJson(Map<String, dynamic> json) {
    
    Map<String, dynamic> processedNodes = {};
    
    if (json['nodes'] != null) {
      if (json['nodes'] is Map) {
        processedNodes = Map<String, dynamic>.from(json['nodes']);
      } else if (json['nodes'] is List) {
        final List nodesList = json['nodes'] as List;
        for (int i = 0; i < nodesList.length; i++) {
          final node = nodesList[i];
          if (node is Map<String, dynamic>) {
            final nodeId = node['id'] ?? node['_id'] ?? 'node_$i';
            processedNodes[nodeId] = node;
          }
        }
      }
    }

    return RoadmapModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      seo: json['seo'] ?? '',
      pdfUrl: json['pdfUrl'],
      nodes: processedNodes,
    );
  }

  RoadmapEntity toEntity() {
    final nodeList = <RoadmapNode>[];
    
    nodes.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        
        String label = value['title'] ?? 
                      value['label'] ?? 
                      value['name'] ?? 
                      value['text'] ?? 
                      'Untitled'; 
        
        
        label = label.replaceAll('_', ' ').replaceAll('-', ' ');
        
       
        if (label.isNotEmpty) {
          label = label[0].toUpperCase() + label.substring(1);
        }

        nodeList.add(RoadmapNode(
          id: key,
          label: label, 
          description: value['description'] ?? 
                      value['blurb'] ?? 
                      value['excerpt'] ?? 
                      '',
          children: _extractChildren(value),
          resource: value['url'] ?? 
                    value['link'] ?? 
                    value['resource'] ?? 
                    value['docUrl'],
          isCompleted: false,
        ));
      }
    });

    
    nodeList.sort((a, b) => a.id.compareTo(b.id));

    return RoadmapEntity(
      id: id,
      title: title,
      description: description,
      icon: _getIconForRoadmap(id),
      level: _determineLevel(nodeList.length),
      duration: _determineDuration(nodeList.length),
      nodes: nodeList,
      resources: _extractResources(nodeList),
    );
  }

  List<String> _extractChildren(Map<String, dynamic> nodeData) {
    final children = <String>[];
    
    if (nodeData.containsKey('children') && nodeData['children'] is List) {
      final List childrenList = nodeData['children'] as List;
      for (var child in childrenList) {
        if (child is String) {
          children.add(child);
        } else if (child is Map && child.containsKey('id')) {
          children.add(child['id'].toString());
        } else if (child is Map && child.containsKey('_id')) {
          children.add(child['_id'].toString());
        }
      }
    }
    
    return children;
  }

  String _determineLevel(int nodeCount) {
    if (nodeCount < 10) return 'Beginner';
    if (nodeCount < 20) return 'Intermediate';
    if (nodeCount < 30) return 'Advanced';
    return 'Expert';
  }

  String _determineDuration(int nodeCount) {
    final weeks = (nodeCount * 1.2).round();
    if (weeks < 4) return '$weeks weeks';
    if (weeks < 8) return '${(weeks / 4).round()} months';
    if (weeks < 52) return '${(weeks / 4).round()}+ months';
    return '52+ months';
  }

  String _getIconForRoadmap(String id) {
    const icons = {
      'frontend': 'web_rounded',
      'backend': 'storage_rounded',
      'devops': 'cloud_rounded',
      'android': 'android_rounded',
      'ios': 'apple_rounded',
      'flutter': 'flutter_dash',
      'python': 'code_rounded',
      'java': 'code_rounded',
      'react': 'javascript_rounded',
      'nodejs': 'storage_rounded',
      'ai-data-scientist': 'psychology_rounded',
      'cybersecurity': 'security_rounded',
      'angular': 'code_rounded',
      'vue': 'code_rounded',
      'golang': 'code_rounded',
      'rust': 'code_rounded',
      'kubernetes': 'cloud_rounded',
      'docker': 'cloud_rounded',
      'aws': 'cloud_rounded',
      'azure': 'cloud_rounded',
      'gcp': 'cloud_rounded',
      'qa': 'bug_report_rounded',
      'ux-design': 'design_services_rounded',
      'game-developer': 'sports_esports_rounded',
    };
    return icons[id] ?? 'map_rounded';
  }

  List<String> _extractResources(List<RoadmapNode> nodes) {
    final resources = <String>[];
    for (var node in nodes) {
      if (node.resource != null && node.resource!.isNotEmpty) {
        resources.add(node.resource!);
      }
    }
    return resources;
  }
}