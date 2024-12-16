class ItemModel {
  final String image;
  final String name;
  final String itemId;
  final String discount;

  ItemModel(
      {required this.image,
      required this.name,
      required this.itemId,
      required this.discount});

  get price => null;
}
