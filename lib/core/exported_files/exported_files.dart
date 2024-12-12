//fooder/
export 'package:fooder/main.dart';
export 'package:fooder/app.dart';

// fooder/core/
export 'package:fooder/core/app_providers/providers/food_provider.dart';
export 'package:fooder/core/app_providers/app_providers.dart';
export 'package:fooder/core/constants/assets_paths/assets_base_path.dart';
export 'package:fooder/core/constants/assets_paths/icons_paths.dart';
export 'package:fooder/core/constants/assets_paths/images_paths.dart';
export 'package:fooder/core/constants/assets_paths/jsons_paths.dart';
export 'package:fooder/core/constants/assets_paths/lotties_paths.dart';
export 'package:fooder/core/constants/paddings/paddings.dart';
export 'package:fooder/core/data/models/food_model.dart';
export 'package:fooder/core/routes/app_routes.dart';
export 'package:fooder/core/routes/route_names.dart';
export 'package:fooder/core/theme/app_colors/app_colors.dart';
export 'package:fooder/core/utils/logger.dart';
export 'package:fooder/core/widgets/centered_circular_progress_indicator.dart';
export 'package:fooder/core/widgets/custom_app_bar.dart';
export 'package:fooder/core/widgets/custom_app_bar_leading_icon.dart';
export 'package:fooder/core/widgets/custom_button.dart';
export 'package:fooder/core/widgets/custom_icon_button.dart';
export 'package:fooder/core/widgets/dual_rich_text.dart';
export 'package:fooder/core/widgets/horizontal_icon_with_text.dart';
export 'package:fooder/core/widgets/increment_decrement_button.dart';
export 'package:fooder/core/widgets/text_with_button_row.dart';
export 'package:fooder/core/wrappers/alert_message.dart';
export 'package:fooder/core/wrappers/lottie_viewer.dart';
export 'package:fooder/core/wrappers/svg_viewer.dart';

// fooder/features/

// fooder/features/common/
export 'package:fooder/features/common/data/models/category_model.dart';
export 'package:fooder/features/common/data/models/location_model.dart';
export 'package:fooder/features/common/data/models/reviews_model.dart';
export 'package:fooder/features/common/providers/categories_provider.dart';
export 'package:fooder/features/common/providers/locations_provider.dart';
export 'package:fooder/features/common/widgets/custom_ratings.dart';
export 'package:fooder/features/common/widgets/empty_food_widget.dart';
export 'package:fooder/features/common/widgets/food.dart';
export 'package:fooder/features/common/widgets/food_card_tile.dart';
export 'package:fooder/features/common/widgets/food_category_card.dart';
export 'package:fooder/features/common/widgets/food_increment_decrement_section.dart';
export 'package:fooder/features/common/widgets/order_button.dart';
export 'package:fooder/features/common/widgets/stock_badge.dart';
export 'package:fooder/features/common/widgets/wish_icon.dart';

// fooder/features/cart/
export 'package:fooder/features/cart/presentation/screens/cart_screen.dart';
export 'package:fooder/features/cart/providers/cart_provider.dart';
export 'package:fooder/features/cart/utilities/constants/cart_strings.dart';

// fooder/features/category/
export 'package:fooder/features/category/presentation/screens/category_screen.dart';
export 'package:fooder/features/category/utilities/constants/category_strings.dart';

// fooder/features/checkout/
export 'package:fooder/features/checkout/presentations/screens/checkout_screen.dart';
export 'package:fooder/features/checkout/presentations/widgets/food_delivery_location_section.dart';
export 'package:fooder/features/checkout/providers/checkout_provider.dart';
export 'package:fooder/features/checkout/utilities/checkout_strings/check_out_strings.dart';

// fooder/features/food_details/
export 'package:fooder/features/food_details/presentations/screens/food_details_screen.dart';
export 'package:fooder/features/food_details/presentations/widgets/food_info_view.dart';
export 'package:fooder/features/food_details/presentations/widgets/food_reviews_view.dart';
export 'package:fooder/features/food_details/presentations/widgets/food_details_box.dart';
export 'package:fooder/features/food_details/utilities/constants/food_details_strings.dart';

// fooder/features/food_list/
export 'package:fooder/features/food_list/presentations/screens/food_list_screen.dart';

// fooder/features/home/
export 'package:fooder/features/home/presentations/screens/home_screen.dart';
export 'package:fooder/features/home/presentations/widgets/custom_notification_icon.dart';
export 'package:fooder/features/home/presentations/widgets/food_promo.dart';
export 'package:fooder/features/home/presentations/widgets/location_selector.dart';
export 'package:fooder/features/home/utilities/constants/home_strings.dart';

// fooder/features/main_bottom_nav/
export 'package:fooder/features/main_bottom_nav/presentation/screens/main_bottom_nav_screen.dart';
export 'package:fooder/features/main_bottom_nav/presentation/widgets/custom_bottom_nav_bar.dart';
export 'package:fooder/features/main_bottom_nav/providers/main_bottom_nav_provider.dart';

// fooder/features/order/
export 'package:fooder/features/order/presentations/screens/order_screen.dart';
export 'package:fooder/features/order/provider/order_provider.dart';
export 'package:fooder/features/order/utilities/constants/order_strings.dart';

// fooder/features/wish_list/
export 'package:fooder/features/wish_list/presentation/screens/wish_list_screen.dart';
export 'package:fooder/features/wish_list/presentation/widgets/wish_food.dart';
export 'package:fooder/features/wish_list/providers/wish_list_provider.dart';
export 'package:fooder/features/wish_list/utilities/constants/wish_list_strings.dart';
