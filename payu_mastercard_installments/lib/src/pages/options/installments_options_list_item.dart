import 'installments_options_list_tile_data.dart';

abstract class InstallmenstOptionsListItem {}

class InstallmenstOptionsListHeaderItem implements InstallmenstOptionsListItem {}

class InstallmenstOptionsListOptionItem implements InstallmenstOptionsListItem {
  final InstallmentsOptionsListTileData data;

  InstallmenstOptionsListOptionItem(this.data);
}
