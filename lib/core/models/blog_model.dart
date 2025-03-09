import 'package:cloud_firestore/cloud_firestore.dart';

class ApiKeys {
  static const blogsCollection = 'blogs';
  static const id = 'id';
  static const title = 'title';
  static const contentJson = 'content_json';
  static const htmlContent = 'html_content';
  static const imageUrls = 'image_urls';
  static const slug = 'slug';
  static const createdAt = 'created_at';
  static const metaTitle = 'meta_title';
  static const metaDescription = 'meta_description';
  static const tags = 'tags';
  static const thumbnailImageUrl = 'thumbnail_image_url';
}

class Blog {
  final String id; // Firestore document ID
  final String title;
  final String contentJson; // Quill Delta JSON for editing
  final String htmlContent; // HTML version for SEO
  final String slug; // SEO-friendly URL (e.g., "how-to-bake-cake")
  final DateTime createdAt;
  final List<String>? imageUrls; // Links to Supabase images
  final String? metaTitle;
  final String? metaDescription; // SEO meta description
  final List<String>? tags; // For categorization
  final String? thumbnailImageUrl; // Main thumbnail image

  Blog({
    required this.id,
    required this.title,
    required this.contentJson,
    required this.htmlContent,
    required this.imageUrls,
    required this.slug,
    required this.createdAt,
    this.metaTitle,
    this.metaDescription,
    this.tags,
    this.thumbnailImageUrl,
  });

  // Convert Firestore Document to Blog
  factory Blog.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Blog(
      id: doc.id,
      title: data[ApiKeys.title],
      contentJson: data[ApiKeys.contentJson],
      htmlContent: data[ApiKeys.htmlContent],
      imageUrls: data[ApiKeys.imageUrls] != null
          ? List<String>.from(data[ApiKeys.imageUrls])
          : null,
      slug: data[ApiKeys.slug],
      createdAt: (data[ApiKeys.createdAt] as Timestamp).toDate(),
      metaTitle: data[ApiKeys.metaTitle],
      metaDescription: data[ApiKeys.metaDescription],
      tags: data[ApiKeys.tags] != null
          ? List<String>.from(data[ApiKeys.tags])
          : null,
      thumbnailImageUrl: data[ApiKeys.thumbnailImageUrl],
    );
  }

  // Convert Blog to Firestore Map
  Map<String, dynamic> toFirestore() {
    return {
      ApiKeys.title: title,
      ApiKeys.contentJson: contentJson,
      ApiKeys.htmlContent: htmlContent,
      ApiKeys.imageUrls: imageUrls,
      ApiKeys.slug: slug,
      ApiKeys.createdAt: Timestamp.fromDate(createdAt),
      ApiKeys.metaTitle: metaTitle,
      ApiKeys.metaDescription: metaDescription,
      ApiKeys.tags: tags,
      ApiKeys.thumbnailImageUrl: thumbnailImageUrl,
    };
  }

  // Convert Blog to JSON (for Supabase or other APIs)
  Map<String, dynamic> toJson() {
    return {
      ApiKeys.id: id,
      ApiKeys.title: title,
      ApiKeys.contentJson: contentJson,
      ApiKeys.htmlContent: htmlContent,
      ApiKeys.imageUrls: imageUrls,
      ApiKeys.slug: slug,
      ApiKeys.createdAt: createdAt.toIso8601String(),
      ApiKeys.metaTitle: metaTitle,
      ApiKeys.metaDescription: metaDescription,
      ApiKeys.tags: tags,
      ApiKeys.thumbnailImageUrl: thumbnailImageUrl,
    };
  }

  // Convert JSON to Blog (for Supabase or other APIs)
  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json[ApiKeys.id],
      title: json[ApiKeys.title],
      contentJson: json[ApiKeys.contentJson],
      htmlContent: json[ApiKeys.htmlContent],
      imageUrls: List<String>.from(json[ApiKeys.imageUrls]),
      slug: json[ApiKeys.slug],
      createdAt: DateTime.parse(json[ApiKeys.createdAt]),
      metaTitle: json[ApiKeys.metaTitle],
      metaDescription: json[ApiKeys.metaDescription],
      tags: json[ApiKeys.tags] != null
          ? List<String>.from(json[ApiKeys.tags])
          : null,
      thumbnailImageUrl: json[ApiKeys.thumbnailImageUrl],
    );
  }
}
