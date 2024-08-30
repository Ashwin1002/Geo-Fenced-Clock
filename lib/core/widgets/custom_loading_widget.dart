import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum LoadingType { indicator, list, grid, custom }

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
    this.isSliver = false,
  })  : type = LoadingType.indicator,
        child = null,
        contentPadding = null;

  const CustomLoadingWidget.list({
    super.key,
    this.isSliver = false,
    required this.child,
    this.contentPadding,
  }) : type = LoadingType.list;

  final LoadingType type;
  final bool isSliver;
  final Widget? child;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      LoadingType.list => isSliver
          ? SliverToBoxAdapter(
              child: Skeletonizer(
                enabled: true,
                child: Padding(
                  padding: contentPadding ?? EdgeInsets.zero,
                  child: Column(
                    children: List.generate(
                      10,
                      (index) => child ?? const SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
            )
          : Skeletonizer(
              enabled: true,
              child: ListView.builder(
                padding: contentPadding,
                itemBuilder: (context, index) => child,
              ),
            ),
      _ => isSliver
          ? SliverToBoxAdapter(child: _buildLoadingIndicator())
          : _buildLoadingIndicator(),
    };
  }

  Widget _buildLoadingIndicator() {
    return RepaintBoundary(
      child: Center(
        child: Platform.isIOS
            ? const CupertinoActivityIndicator()
            : const CircularProgressIndicator(
                strokeCap: StrokeCap.round,
              ),
      ),
    );
  }
}
