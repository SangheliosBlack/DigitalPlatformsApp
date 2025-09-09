import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final double? height;
  final double? width;
  final double? maxHeight;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
    this.height,
    this.width,
    this.maxHeight = 400.0,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _hasError = false;
  bool _showControls = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() async {
    try {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      
      await _controller.initialize();
      
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  void _enterFullscreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FullscreenVideoPlayer(
          controller: _controller,
          videoUrl: widget.videoUrl,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        height: widget.height ?? 200,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.white,
                size: 48,
              ),
              SizedBox(height: 16),
              Text(
                'Error loading video',
                style: GoogleFonts.quicksand(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                _errorMessage ?? 'Unknown error',
                style: GoogleFonts.quicksand(
                  color: Colors.white70,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
    }

    if (!_isInitialized) {
      return Container(
        height: widget.height ?? 200,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: AppTheme.primary,
            strokeWidth: 3,
          ),
        ),
      );
    }

    final videoAspectRatio = _controller.value.aspectRatio;
    final maxHeight = widget.maxHeight ?? 400.0;

    Widget videoOnly = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: videoAspectRatio,
        child: VideoPlayer(_controller),
      ),
    );

    return SizedBox(
      width: widget.width,
      height: maxHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // Video scrolleable
            GestureDetector(
              onTap: _toggleControls,
              child: SingleChildScrollView(
                child: videoOnly,
              ),
            ),
            
            // Controls Overlay (fuera del scroll)
            if (_showControls)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            
            // Play/Pause Button (centrado en el contenedor)
            if (_showControls)
              Center(
                child: GestureDetector(
                  onTap: _togglePlayPause,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ),
            
            // Progress Bar and Duration (siempre en la parte inferior del contenedor)
            if (_showControls)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Progress Bar
                      VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: VideoProgressColors(
                          playedColor: AppTheme.primary,
                          bufferedColor: Colors.white.withOpacity(0.3),
                          backgroundColor: Colors.white.withOpacity(0.1),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Duration Text and Fullscreen Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(_controller.value.position),
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Fullscreen Button
                          GestureDetector(
                            onTap: _enterFullscreen,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.fullscreen,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          Text(
                            _formatDuration(_controller.value.duration),
                            style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FullscreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;
  final String videoUrl;

  const FullscreenVideoPlayer({
    super.key,
    required this.controller,
    required this.videoUrl,
  });

  @override
  State<FullscreenVideoPlayer> createState() => _FullscreenVideoPlayerState();
}

class _FullscreenVideoPlayerState extends State<FullscreenVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _initializeIfNeeded();
  }

  Future<void> _initializeIfNeeded() async {
    if (!_controller.value.isInitialized) {
      await _controller.initialize();
    }
    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
    _controller.play();
  }

  @override
  void dispose() {
    // No dispose of shared controller here; parent owns it
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Video en pantalla completa
            Center(
              child: _isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(_controller),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                VideoProgressIndicator(
                                  _controller,
                                  allowScrubbing: true,
                                  colors: VideoProgressColors(
                                    playedColor: AppTheme.primary,
                                    bufferedColor: Colors.white54,
                                    backgroundColor: Colors.white24,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (_controller.value.isPlaying) {
                                            _controller.pause();
                                          } else {
                                            _controller.play();
                                          }
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator(color: AppTheme.primary),
            ),
            
            // Botón de cerrar en la esquina superior derecha
            Positioned(
              top: 0,
              right: 20,
              child: SafeArea(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
