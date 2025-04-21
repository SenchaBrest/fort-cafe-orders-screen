import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'status_screen_model.dart';
export 'status_screen_model.dart';

class StatusScreenWidget extends StatefulWidget {
  const StatusScreenWidget({super.key});

  static String routeName = 'statusScreen';
  static String routePath = '/statusScreen';

  @override
  State<StatusScreenWidget> createState() => _StatusScreenWidgetState();
}

class _StatusScreenWidgetState extends State<StatusScreenWidget> {
  late StatusScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.unsubscribe(
        'orders',
      );
      await actions.subscribe(
        'orders',
        () async {
          safeSetState(() => _model.apiRequestCompleter1 = null);
          await _model.waitForApiRequestCompleted1();
          safeSetState(() => _model.apiRequestCompleter2 = null);
          await _model.waitForApiRequestCompleted2();
        },
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).tertiary,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'ГОТОВЯТСЯ',
                            style: GoogleFonts.getFont(
                              'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  MediaQuery.sizeOf(context).height * 0.08,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        child: FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter1 ??=
                                  Completer<ApiCallResponse>()
                                    ..complete(GetCompletedOrdersCall.call()))
                              .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 15.0,
                                  height: 15.0,
                                  child: SpinKitThreeBounce(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 15.0,
                                  ),
                                ),
                              );
                            }
                            final wrapGetCompletedOrdersResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final orders = getJsonField(
                                  wrapGetCompletedOrdersResponse.jsonBody,
                                  r'''$''',
                                ).toList();

                                return Wrap(
                                  spacing: 0.0,
                                  runSpacing:
                                      MediaQuery.sizeOf(context).width * 0.08,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.vertical,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(orders.length,
                                      (ordersIndex) {
                                    final ordersItem = orders[ordersIndex];
                                    return AutoSizeText(
                                      getJsonField(
                                        ordersItem,
                                        r'''$.number''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.07,
                                            letterSpacing: 0.0,
                                          ),
                                    );
                                  }),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'ГОТОВЫ',
                            style: GoogleFonts.getFont(
                              'Inter',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.normal,
                              fontSize:
                                  MediaQuery.sizeOf(context).height * 0.08,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        child: FutureBuilder<ApiCallResponse>(
                          future: (_model.apiRequestCompleter2 ??=
                                  Completer<ApiCallResponse>()
                                    ..complete(GetCompletedOrdersCall.call()))
                              .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 15.0,
                                  height: 15.0,
                                  child: SpinKitThreeBounce(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 15.0,
                                  ),
                                ),
                              );
                            }
                            final columnGetCompletedOrdersResponse =
                                snapshot.data!;

                            return Builder(
                              builder: (context) {
                                final orders = getJsonField(
                                  columnGetCompletedOrdersResponse.jsonBody,
                                  r'''$''',
                                ).toList();

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(orders.length,
                                      (ordersIndex) {
                                    final ordersItem = orders[ordersIndex];
                                    return Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: AutoSizeText(
                                        '${getJsonField(
                                          ordersItem,
                                          r'''$.number''',
                                        ).toString()} - ${getJsonField(
                                          ordersItem,
                                          r'''$.name''',
                                        ).toString()} ${getJsonField(
                                          ordersItem,
                                          r'''$.surname''',
                                        ).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.07,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    );
                                  }),
                                );
                              },
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
        ),
      ),
    );
  }
}
