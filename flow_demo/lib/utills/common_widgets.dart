import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_theme.dart';



/// Custom widgets for Text
class GetCommonText extends StatefulWidget {
  final String title;
  final double size;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final Color color;
  final String fontFamily;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final double letterSpacing;
  final double lineHeight;
  final int maxLines;

  const GetCommonText({
    super.key,
    required this.title,
    required this.size,
    this.fontFamily = AppTheme.fontFamilyNamePrimary,
    this.fontStyle = FontStyle.normal,
    required this.color,
    required this.fontWeight,
    this.textAlign = TextAlign.start,
    this.letterSpacing = 0,
    this.lineHeight = 0,
    this.maxLines = 2,
    this.textOverflow = TextOverflow.ellipsis,

  });

  @override
  State<GetCommonText> createState() => _GetTextState();
}
class _GetTextState extends State<GetCommonText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title,
        textAlign: widget.textAlign,
        maxLines: widget.maxLines,
        style: TextStyle(
          height: widget.lineHeight,
          color: widget.color,
          fontFamily: widget.fontFamily,
          fontSize: widget.size,
          fontStyle: widget.fontStyle,
          fontWeight: widget.fontWeight,
          overflow: widget.textOverflow,
          letterSpacing: widget.letterSpacing,
        ));
  }
}

/// Custom App Bar View
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleValue;
  final String subTitleValue;
  final AppBar appBar;
  final VoidCallback drawerCallback;
  final VoidCallback notifyCallback;
  final VoidCallback profileCallback;
  final VoidCallback themeCallback;
  final String profileImage;
  final bool isNotificationRead;

  const CustomAppBar({
    super.key,
    required this.titleValue,
    required this.subTitleValue,
    required this.appBar,
    required this.drawerCallback,
    required this.notifyCallback,
    required this.profileCallback,
    required this.themeCallback,
    required this.profileImage,
    required this.isNotificationRead,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(context.isTablet ? 100.0 : 60.0),
      child: Builder(builder: (BuildContext context) {
        return Container(
          color: AppTheme.appThemeColor,
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(Icons.menu_sharp,
                    size: context.isTablet ? 40 : 30,
                    color: DeviceUtil.getBackgroundColor(context)),
              ),
              const SizedBox(width: 15.0),
              subTitleValue.isEmpty
                  ? Expanded(
                      child: GetCommonText(
                          title: titleValue,
                          size: 22,
                          color: DeviceUtil.getBackgroundColor(context),
                          fontWeight: FontWeight.w700))
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GetCommonText(
                              title: titleValue,
                              size: 22,
                              color: DeviceUtil.getBackgroundColor(context),
                              fontWeight: FontWeight.w700),
                          const SizedBox(height: 4.0),
                          GetCommonText(
                              title: subTitleValue,
                              size: 13,
                              maxLines: 1,
                              color: DeviceUtil.getBackgroundColor(context),
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                    ),
            ],
          ),
        );
      }),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

/// Custom loader for api response
class GetCommonLoader extends StatefulWidget {

  final bool isVisible;

  const GetCommonLoader({
    super.key,
    required this.isVisible,
  });

  @override
  State<GetCommonLoader> createState() => _GetLoaderState();
}
class _GetLoaderState extends State<GetCommonLoader> {

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: widget.isVisible,
      child: Container(
        alignment: Alignment.center,
        color: Colors.white.withOpacity(0.5),
        height: double.infinity,
        width: double.infinity,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: const CircularProgressIndicator(
            color: AppTheme.appThemeButtonColor,
          ),
        ),
      ),
    );
  }
}