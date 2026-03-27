import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/helpers/methods/static_data.dart';
import 'package:kerwenli_yol/helpers/methods/static_methods.dart';
import 'package:video_player/video_player.dart';

class ShowVideo extends StatefulWidget {
  const ShowVideo({super.key, required this.videoUrl, this.autoPlay});

  final String videoUrl;
  final bool? autoPlay;

  @override
  State<ShowVideo> createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  late VideoPlayerController _playerController;
  ChewieController? _chewieController; // Nullable yapıldı
  late Future<void> _initializeVideoPlayer;

  @override
  void initState() {
    super.initState();

    _playerController =
        VideoPlayerController.networkUrl(
          Uri.parse('$pathUrl${widget.videoUrl}'),
        )..addListener(() {
          if (_playerController.value.hasError) {
            setState(() {});
          }
        });

    _initializeVideoPlayer = _playerController
        .initialize()
        .then((_) {
          setState(() {
            _chewieController = ChewieController(
              videoPlayerController: _playerController,
              autoPlay: widget.autoPlay ?? true,
              looping: false,
            );
          });
        })
        .catchError((error) {
          setState(() {});
        });
  }

  @override
  void dispose() {
    _playerController.dispose();
    _chewieController?.dispose(); // Null kontrolü eklendi
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('===================== $pathUrl${widget.videoUrl}');
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: FutureBuilder(
        future: _initializeVideoPlayer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (_playerController.value.hasError || _chewieController == null) {
              return Container(
                color: Colors.grey[200],
                child: Center(
                  child: Text(
                    'Yalnyslyk yuze cykdy',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              );
            }
            return AspectRatio(
              aspectRatio: _playerController.value.aspectRatio,
              child: Chewie(controller: _chewieController!),
            );
          } else if (snapshot.hasError) {
            return Container(
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  'Yalnyslyk yuze cykdy',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            );
          }

          return loadWidget;
        },
      ),
    );
  }
}
