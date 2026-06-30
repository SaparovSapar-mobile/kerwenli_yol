import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ExpandableHtmlText extends StatefulWidget {
  final String desc;
  const ExpandableHtmlText({super.key, required this.desc});

  @override
  State<ExpandableHtmlText> createState() => _ExpandableHtmlTextState();
}

class _ExpandableHtmlTextState extends State<ExpandableHtmlText> {
  bool _expanded = false;

  static final _style = {
    "*": Style(
      fontWeight: FontWeight.w400,
      fontSize:  FontSize(12),
      lineHeight:  LineHeight.number(1.20),
      fontFamily: "Rubik",
      margin: Margins.zero,
      padding: HtmlPaddings.zero,
    ),
  };

  // Убираем HTML теги и получаем чистый текст
  String _stripHtml(String html) {
    return html.replaceAll(RegExp(r'<[^>]*>'), '').trim();
  }

  @override
  Widget build(BuildContext context) {
    final plainText = _stripHtml(widget.desc);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Замеряем сколько строк займёт текст
        final painter = TextPainter(
          text: TextSpan(
            text: plainText,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: "Rubik",
              fontWeight: FontWeight.w400,
              height: 1.20,
            ),
          ),
          maxLines: 4,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final isOverflow = painter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Обёртка с ограничением высоты если не expanded
            if (!_expanded && isOverflow)
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  heightFactor: 1.0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 12 * 1.20 * 4 + 8, // fontSize * lineHeight * lines + padding
                    ),
                    child: OverflowBox(
                      alignment: Alignment.topLeft,
                      maxHeight: double.infinity,
                      child: Html(
                        data: widget.desc,
                        style: _style,
                      ),
                    ),
                  ),
                ),
              )
            else
              Html(
                data: widget.desc,
                style: _style,
              ),
            if (isOverflow)
              GestureDetector(
                onTap: () => setState(() => _expanded = !_expanded),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    _expanded ? 'Gysgalt' : 'Doly oka...',
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF007AFF),
                    ),
                  ), 
                ),
              ),
          ],
        );
      },
    );
  }
}