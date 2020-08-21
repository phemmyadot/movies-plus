// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:moviesplus/services/movies_service.dart';
// import 'package:moviesplus/utils/essentials.dart';
// import 'package:video_player/video_player.dart';
// import 'package:youtube_extractor/youtube_extractor.dart';
// // import 'package:video_player/video_player.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   final int id;

//   VideoPlayerScreen({Key key, this.id}) : super(key: key);
//   var extractor = YouTubeExtractor();

// // main() async {
// //   // Get the stream info for the passed video
// //   var streamInfo = await extractor.getMediaStreamsAsync('7IG5kRFIMZw');
  
// //   // Print the audio stream url
// //   print('Audio URL:=============================================================== ${streamInfo.audio.first.url}');
// // }
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   VideoPlayerController _controller;
//   Future<void> _initializeVideoPlayerFuture;
//   var extractor = YouTubeExtractor();

//   @override
//   void initState() {
//     var streamInfo = extractor.getMediaStreamsAsync('7IG5kRFIMZw');
//     // var streamInfo = await extractor.getMediaStreamsAsync('a1ExYqrBJio');
  
//   // Print the audio stream url
//   streamInfo.then((value) => print('Audio URL=======================================================: ${value.video.first.url}'));
  
//     // Create and store the VideoPlayerController. The VideoPlayerController
//     // offers several different constructors to play videos from assets, files,
//     // or the internet.
//     fetchMovieVideo(widget.id).then((value) => {
//           print('----------_++++++++++++++++++++++++++++++$value'),
//           _controller = VideoPlayerController.network(
//             'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//           ),

//           // Initialize the controller and store the Future for later use.
//           _initializeVideoPlayerFuture = _controller.initialize(),

//           // Use the controller to loop the video.
//           _controller.setLooping(true),
//         });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     // Ensure disposing of the VideoPlayerController to free up resources.
//     _controller.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the VideoPlayerController has finished initialization, use
//             // the data it provides to limit the aspect ratio of the video.
//             return AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               // Use the VideoPlayer widget to display the video.
//               child: Stack(
//                 children: [
//                   VideoPlayer(_controller),
//                   Center(
//                     child: IconButton(
//                       icon: Icon(
//                         _controller.value.isPlaying
//                             ? Icons.pause_circle_outline
//                             : Icons.play_circle_outline,
//                         size: 45,
//                         color: AppColors.offWhite,
//                       ),
//                       onPressed: () => setState(() {
//                         // If the video is playing, pause it.
//                         if (_controller.value.isPlaying) {
//                           _controller.pause();
//                         } else {
//                           // If the video is paused, play it.
//                           _controller.play();
//                         }
//                       }),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           } else {
//             // If the VideoPlayerController is still initializing, show a
//             // loading spinner.
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
