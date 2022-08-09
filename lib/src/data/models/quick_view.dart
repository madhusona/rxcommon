import 'package:equatable/equatable.dart';
class QuickView extends Equatable {
  final String title;
  final String description;
  final String actionDescription;
  final String quickViewURL;
  final String itemType;
  final String transactionId;
  final String extUrl;
  final String venueSystemId;
  final String sortOrder;

  const QuickView({
    required this.title, 
    required this.description, 
    required this.actionDescription, 
    required this.quickViewURL, 
    required this.itemType, 
    required this.transactionId, 
    required this.extUrl, 
    required this.venueSystemId, 
    required this.sortOrder});

  factory QuickView.fromXml(List fav) {
   
   return QuickView(
      transactionId: fav[0],
      title: fav[2],
      description: fav[3],
      extUrl: fav[7],
      quickViewURL:fav[9],
      itemType: fav[11],
      actionDescription:fav[14],    
      venueSystemId: fav[19],
      sortOrder: fav[23],     
    );
  }
 
  @override
  // TODO: implement props
  List<Object?> get props => [
    title,
    description,
    actionDescription,
    quickViewURL,
    itemType,
    transactionId,
    extUrl,
    venueSystemId,
    sortOrder    
  ];
}