import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/youtube_data_api.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository();
});

class CategoryRepository {
  final YoutubeDataApi youtubeDataApi = YoutubeDataApi();
  Future<List<Video>?> getTrendingVideos() async {
    try {
      final videos = await youtubeDataApi.fetchTrendingVideo();
      print("The trending videos are $videos");
      return videos;
    } catch (e) {
      print("Error is $e");
    }
    return null;
  }

  Future<List<Video>?> getTrendingMovies() async {
    try {
      final videos = await youtubeDataApi.fetchTrendingMovies();
      return videos;
    } catch (e) {
      return null;
    }
  }

  Future<List<Video>?> getTrendingMusic() async {
    try {
      final videos = await youtubeDataApi.fetchTrendingMusic();
      return videos;
    } catch (e) {
      return null;
    }
  }

  Future<List<Video>?> getTrendingGames() async {
    try {
      final videos = await youtubeDataApi.fetchTrendingGaming();
      return videos;
    } catch (e) {
      return null;
    }
  }
}
