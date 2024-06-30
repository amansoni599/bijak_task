import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<Widget> children;
  final Duration scrollDuration;
  final bool infiniteScroll;
  final bool showIndicator;

  const Carousel({
    super.key,
    required this.children,
    this.scrollDuration = const Duration(seconds: 3),
    this.infiniteScroll = true,
    this.showIndicator = true,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _scheduleScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _scheduleScroll() async {
    await Future.delayed(widget.scrollDuration);
    if (mounted) {
      _pageController.nextPage(
        duration: widget.scrollDuration,
        curve: Curves.ease,
      );
      if (widget.infiniteScroll) {
        _currentPage++;
        if (_currentPage == widget.children.length) {
          _currentPage = 0;
        }
      }
      _scheduleScroll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          onPageChanged: (value) => setState(() => _currentPage = value),
          itemBuilder: (context, index) =>
              widget.children[index % widget.children.length],
          itemCount: widget.infiniteScroll ? null : widget.children.length,
        ),
        if (widget.showIndicator) _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      bottom: 10.0,
      right: 10.0,
      child: Row(
        children: List.generate(
          widget.children.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.blue : Colors.grey,
                shape: BoxShape.circle,
              ),
              width: 6.0,
              height: 6.0,
            ),
          ),
        ),
      ),
    );
  }
}
