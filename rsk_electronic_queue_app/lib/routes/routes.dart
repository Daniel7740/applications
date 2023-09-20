import 'package:auto_route/auto_route.dart';

import 'package:rsk_electronic_queue/feature/presentation/pages/filiation_page/filiation_page.dart';

import 'package:flutter/widgets.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/sms_code_page/sms_code_page.dart';

import 'package:rsk_electronic_queue/feature/presentation/pages/login_page/login_page.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/queue_time_page/queue_time_page.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/service_items_page/service_items_page.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/service_type_page/service_type_page.dart';

import 'package:rsk_electronic_queue/feature/presentation/pages/splash_page/splash_page.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/ticket_page/qr_cod_view_page.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/ticket_page/ticket_page.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/ticket_page/your_ticket_page.dart';
import 'package:rsk_electronic_queue/feature/presentation/pages/unauthorized_page/unauthorized_page.dart';

export 'package:auto_route/auto_route.dart';
part 'routes.gr.dart';

/// Этот код относится к классу AppRouter, который используется для настройки маршрутов приложения с помощью пакета AutoRoute.

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: SplashRoute.page, // Страница, связанная с маршрутом "Splash"
          path: '/splash', // Путь для маршрута "Splash"
          initial: true, // Указание, что это начальный маршрут приложения
        ),
        CustomRoute(
          page: UnauthorizedRoute
              .page, // Страница, связанная с маршрутом "Unauthorized"
          path: '/unauthorized', // Путь для маршрута "Unauthorized"
          // transitionsBuilder: TransitionsBuilders
          //     .slideTop, // Настройка перехода для маршрута "Unauthorized" с эффектом slideTop
          durationInMilliseconds: 1000, // Длительность перехода в миллисекундах
        ),
        CustomRoute(
          page:
              LoginRoute.page, // Страница, связанная с маршрутом "Unauthorized"
          path: '/login', // Путь для маршрута "Unauthorized"
        ),
        CustomRoute(
          page: SMSCodeRoute.page,
          path: '/smsCode',
        ),
        CustomRoute(
          page: ServiceItemsRoute
              .page, // Страница, связанная с маршрутом "LoginRoute"
          path: '/serviceitems', // Путь для маршрута "LoginRoute"
          // initial: true,
        ),
        CustomRoute(
          page: FiliationRoute
              .page, // Страница, связанная с маршрутом "ServiceItemsRoute"
          path: '/filiation', // Путь для маршрута "ServiceItemsRoute"
        ),
        CustomRoute(
          page: ServiceTypeRoute
              .page, // Страница, связанная с маршрутом "FiliationRoute"
          path: '/servicetype', // Путь для маршрута "FiliationRoute"
        ),
        CustomRoute(
          page: QueueTimeRoute
              .page, // Страница, связанная с маршрутом "ServiceTypeRoute"
          path: '/queuetime', // Путь для маршрута "ServiceTypeRoute"
          // initial: true,
        ),
        CustomRoute(
          page: TicketRoute
              .page, // Страница, связанная с маршрутом "QueueTimeRoute"
          path: '/ticket', // Путь для маршрута "QueueTimeRoute"
          // initial: true,
        ),
        CustomRoute(
          page: YourTicketRoute
              .page, // Страница, связанная с маршрутом "TicketRoute"
          path: '/yourticket', // Путь для маршрута "TicketRoute"
          // initial: true,
        ),
        CustomRoute(
            page: QRcodViewRoute
                .page, // Страница, связанная с маршрутом "YourTicketRoute"
            path: '/qrcod'), // Путь для маршрута "YourTicketRoute"
      ];
}

// Для запуска генератора ввести в консоль: 
// dart run build_runner watch --delete-conflicting-outputs
