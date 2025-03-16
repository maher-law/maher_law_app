import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../api_keys.dart';

class Blog extends Equatable {
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

  const Blog({
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
  factory Blog.fromFirestore(String id, {required Map data}) {
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

  @override
  List<Object?> get props => [
        id,
        title,
        contentJson,
        htmlContent,
        slug,
        createdAt,
        imageUrls,
        metaTitle,
        metaDescription,
        tags,
        thumbnailImageUrl,
      ];
}
