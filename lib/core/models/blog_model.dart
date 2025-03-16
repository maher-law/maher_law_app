import 'package:cloud_firestore/cloud_firestore.dart';

class ApiKeys {
  static const blog = 'blog';
  static const message = 'message';
  static const subject = 'subject';
  static const email = 'email';
  static const name = 'name';
  static const link = 'link';

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
  final Timestamp createdAt;
  final List<String>? imageUrls; // Links to Supabase images
  final String? metaTitle;
  final String? metaDescription; // SEO meta description
  final List<String>? tags; // For categorization
  final String thumbnailImageUrl; // Main thumbnail image

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
    required this.thumbnailImageUrl,
  });

  // Convert Firestore Document to Blog
  factory Blog.fromFirestore(String id ,{required Map data}) {
    
    return Blog(
      id: id,
      title: data[ApiKeys.title],
      contentJson: data[ApiKeys.contentJson],
      htmlContent: data[ApiKeys.htmlContent],
      imageUrls: data[ApiKeys.imageUrls] != null
          ? List<String>.from(data[ApiKeys.imageUrls])
          : null,
      slug: data[ApiKeys.slug],
      createdAt: data[ApiKeys.createdAt] as Timestamp,
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
      ApiKeys.createdAt: createdAt,
      ApiKeys.metaTitle: metaTitle,
      ApiKeys.metaDescription: metaDescription,
      ApiKeys.tags: tags,
      ApiKeys.thumbnailImageUrl: thumbnailImageUrl,
    };
  }
}
