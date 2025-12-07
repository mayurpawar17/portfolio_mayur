import 'package:flutter/material.dart';

class VBenchCard extends StatelessWidget {
  const VBenchCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive sizing
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1200;

    final double cardWidth =
        isMobile
            ? screenWidth * 0.9
            : isTablet
            ? screenWidth * 0.8
            : 800;

    final double titleSize =
        isMobile
            ? 24
            : isTablet
            ? 28
            : 32;
    final double subtitleSize =
        isMobile
            ? 16
            : isTablet
            ? 18
            : 20;
    final double bodySize =
        isMobile
            ? 14
            : isTablet
            ? 16
            : 18;
    final double smallSize =
        isMobile
            ? 12
            : isTablet
            ? 14
            : 16;

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Section
          _buildTitleSection(titleSize, subtitleSize),

          const SizedBox(height: 24),

          // GPU Hours Section
          _buildGpuHoursSection(bodySize, smallSize),

          const SizedBox(height: 24),

          // Divider
          Container(height: 1, color: Colors.grey.shade300),

          const SizedBox(height: 24),

          // Model Names Section
          _buildModelNamesSection(bodySize),

          const SizedBox(height: 24),

          // Open-Sora Timeline Section
          _buildTimelineSection(bodySize, smallSize, isMobile),
        ],
      ),
    );
  }

  Widget _buildTitleSection(double titleSize, double subtitleSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "VBench Total Score",
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "GPU hours (in H100) \"estimated from public information\"",
          style: TextStyle(
            fontSize: subtitleSize,
            color: Colors.grey.shade700,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildGpuHoursSection(double bodySize, double smallSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                "100k",
                style: TextStyle(
                  fontSize: bodySize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "GPU hours",
                style: TextStyle(
                  fontSize: smallSize,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "500k",
                style: TextStyle(
                  fontSize: bodySize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "GPU hours",
                style: TextStyle(
                  fontSize: smallSize,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildModelNamesSection(double bodySize) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: [
        _buildModelChip("Open-Sora 2.0", bodySize),
        _buildModelChip("Step-Video-TSV", bodySize),
        _buildModelChip("Movie Gen", bodySize),
      ],
    );
  }

  Widget _buildModelChip(String text, double fontSize) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.blue.shade800,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTimelineSection(
    double bodySize,
    double smallSize,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Open-Sora Title
        Text(
          "Open-Sora 28k",
          style: TextStyle(
            fontSize: bodySize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 8),

        // Timeline
        Text(
          "Mar. 2024 - Mar. 2025",
          style: TextStyle(
            fontSize: smallSize,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 12),

        // Description
        Text(
          "The world's first open-source Sora-like video generation model — bringing efficient, high-quality video production to everyone.",
          style: TextStyle(
            fontSize: smallSize,
            color: Colors.grey.shade700,
            height: 1.4,
          ),
        ),

        const SizedBox(height: 16),

        // Links Section
        _buildLinksSection(bodySize, isMobile),
      ],
    );
  }

  Widget _buildLinksSection(double bodySize, bool isMobile) {
    return isMobile
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLinkItem("Github", bodySize),
            const SizedBox(height: 8),
            _buildLinkItem("Open-Sora 1.2", bodySize),
            const SizedBox(height: 8),
            _buildLinkItem("Open-Sora 2.0", bodySize),
          ],
        )
        : Row(
          children: [
            _buildLinkItem("Github", bodySize),
            const SizedBox(width: 16),
            _buildLinkItem("Open-Sora 1.2", bodySize),
            const SizedBox(width: 16),
            _buildLinkItem("Open-Sora 2.0", bodySize),
          ],
        );
  }

  Widget _buildLinkItem(String text, double fontSize) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Handle link tap
          print('$text tapped');
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
