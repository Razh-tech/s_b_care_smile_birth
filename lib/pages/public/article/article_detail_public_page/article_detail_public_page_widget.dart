import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'article_detail_public_page_model.dart';
export 'article_detail_public_page_model.dart';

class ArticleDetailPublicPageWidget extends StatefulWidget {
  const ArticleDetailPublicPageWidget({
    super.key,
    required this.slug,
  });

  final String? slug;

  static String routeName = 'ArticleDetailPublicPage';
  static String routePath = 'article/:slug';

  @override
  State<ArticleDetailPublicPageWidget> createState() =>
      _ArticleDetailPublicPageWidgetState();
}

class _ArticleDetailPublicPageWidgetState
    extends State<ArticleDetailPublicPageWidget> {
  late ArticleDetailPublicPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ArticleDetailPublicPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Article Details | SBCare - SmileBirth',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).sbcarePrimaryColor,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'fomgahpw' /* Article Details */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyLargeFamily,
                          color: FlutterFlowTheme.of(context).accent4,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                        ),
                  ),
                  Builder(
                    builder: (context) => FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 8.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).sbCareLightColor,
                      icon: Icon(
                        Icons.share_outlined,
                        color: FlutterFlowTheme.of(context).sbcarePrimaryColor,
                        size: 20.0,
                      ),
                      showLoadingIndicator: true,
                      onPressed: () async {
                        if (isAndroid) {
                          await Share.share(
                            '${FFDevEnvironmentValues().androidLinkDomain}article/${widget.slug}',
                            sharePositionOrigin: getWidgetBoundingBox(context),
                          );
                        } else {
                          await Clipboard.setData(ClipboardData(
                              text:
                                  '${FFDevEnvironmentValues().sbcareLinkDomain}article/${widget.slug}'));
                        }
                      },
                    ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: SafeArea(
              top: true,
              child: FlutterFlowWebView(
                content:
                    'https://sbcarelegacy.sleepydev.net/articles/${widget.slug}',
                bypass: false,
                height: MediaQuery.sizeOf(context).height * 0.9,
                verticalScroll: true,
                horizontalScroll: false,
              ),
            ),
          ),
        ));
  }
}
