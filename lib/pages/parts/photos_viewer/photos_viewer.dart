import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kerwenli_yol/pages/parts/photos_viewer/parts/photos_view_arrow_button.dart';
import 'package:kerwenli_yol/pages/parts/photos_viewer/parts/photos_viewer_close_button.dart';

class PhotosViewer extends StatefulWidget {
  const PhotosViewer({super.key, required this.images, this.initialIndex = 0});

  final List<String> images;
  final int initialIndex;

  @override
  State<PhotosViewer> createState() => _PhotosViewerState();
}

class _PhotosViewerState extends State<PhotosViewer> {
  late final PageController _pageController;
  late int _index;

  // Zoom state'ini sayfa değişince resetlemek için:
  final TransformationController _transformController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex.clamp(0, widget.images.length - 1);
    _pageController = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _transformController.dispose();
    super.dispose();
  }

  ImageProvider _provider(String src) {
    final s = src.trim();
    if (s.startsWith('http://') || s.startsWith('https://')) {
      return NetworkImage(s);
    }
    return AssetImage(s);
  }

  void _goTo(int i) {
    if (i < 0 || i >= widget.images.length) return;
    _pageController.animateToPage(
      i,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text("No images", style: TextStyle(color: Colors.white)),
        ),
      );
    }

    final currentProvider = _provider(widget.images[_index]);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1) Arka plan: seçili resim + blur + karartma
          Positioned.fill(
            child: Image(image: currentProvider, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(color: Colors.black.withValues(alpha: 0.55)),
            ),
          ),

          // 2) İçerik
          SafeArea(
            child: Column(
              children: [
                // Üst bar: kapat + sayfa göstergesi
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [const Spacer(), PhotosViewerCloseButton()],
                  ),
                ),

                // Ana resim alanı (slider + zoom)
                Expanded(
                  child: Stack(
                    children: [
                      // PageView (tam genişlik)
                      Positioned.fill(
                        child: Container(
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: widget.images.length,
                            onPageChanged: (i) {
                              setState(() => _index = i);
                              _transformController.value = Matrix4.identity();
                            },
                            itemBuilder: (context, i) {
                              final p = _provider(widget.images[i]);

                              return InteractiveViewer(
                                transformationController: _transformController,
                                minScale: 1.0,
                                maxScale: 4.0,
                                panEnabled: true,
                                scaleEnabled: true,
                                clipBehavior: Clip.none,
                                child: Center(
                                  child: Image(
                                    width: double.infinity,
                                    image: p,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // Sol ok (üstte)
                      Positioned(
                        left: 12,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: PhotosViewArrowButton(
                            icon: Icons.chevron_left,
                            onTap: _index > 0 ? () => _goTo(_index - 1) : null,
                          ),
                        ),
                      ),

                      // Sağ ok (üstte)
                      Positioned(
                        right: 12,
                        top: 0,
                        bottom: 0,
                        child: Center(
                          child: PhotosViewArrowButton(
                            icon: Icons.chevron_right,
                            onTap: _index < widget.images.length - 1
                                ? () => _goTo(_index + 1)
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Thumbnail şeridi
                Padding(
                  padding: const EdgeInsets.only(top: 14, bottom: 14),
                  child: SizedBox(
                    height: 58,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.images.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 10),
                      itemBuilder: (context, i) {
                        final isActive = i == _index;

                        return GestureDetector(
                          onTap: () => _goTo(i),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: isActive ? Colors.white : Colors.white24,
                                width: isActive ? 2 : 1,
                              ),
                              boxShadow: [
                                if (isActive)
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.35),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image(
                                  image: _provider(widget.images[i]),
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.medium,
                                ),
                                if (!isActive)
                                  Container(
                                    color: Colors.black.withValues(alpha: 0.12),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
