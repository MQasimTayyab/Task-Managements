class UserprofModel {
  UserProfile? userProfile;
  List<Post>? posts;
  List<Product>? products;
  List<Transaction>? transactions;
  List<Event>? events;

  UserprofModel({
    this.userProfile,
    this.posts,
    this.products,
    this.transactions,
    this.events,
  });

  factory UserprofModel.fromJson(Map<String, dynamic> json) {
    return UserprofModel(
      userProfile: UserProfile.fromJson(json['userProfile']),
      posts: (json['posts'] as List)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      transactions: (json['transactions'] as List)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      events: (json['events'] as List)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

//  UserProfile nc

class UserProfile {
  String? userId;
  String? username;
  String? email;
  String? dateJoined;
  String? lastLogin;
  String? profilePictureUrl;
  String? bio;
  Location? location;
  Preferences? preferences;
  List<SocialLink>? socialLinks;
  List<Skill>? skills;

  UserProfile({
    this.userId,
    this.username,
    this.email,
    this.dateJoined,
    this.lastLogin,
    this.profilePictureUrl,
    this.bio,
    this.location,
    this.preferences,
    this.socialLinks,
    this.skills,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      dateJoined: json['dateJoined'],
      lastLogin: json['lastLogin'],
      profilePictureUrl: json['profilePictureUrl'],
      bio: json['bio'],
      location: Location.fromJson(json['location']),
      preferences: Preferences.fromJson(json['preferences']),
      socialLinks: (json['socialLinks'] as List)
          .map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['skills'] as List)
          .map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Location {
  String? city;
  String? country;
  double? latitude;
  double? longitude;

  Location({
    this.city,
    this.country,
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'],
      country: json['country'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }
}

class Preferences {
  String? theme;
  String? language;
  String? currency;
  bool? notificationsEnabled;
  PrivacySettings? privacySettings;

  Preferences({
    this.theme,
    this.notificationsEnabled,
    this.language,
    this.currency,
    this.privacySettings,
  });

  factory Preferences.fromJson(Map<String, dynamic> json) {
    return Preferences(
      theme: json['theme'],
      notificationsEnabled: json['notificationsEnabled'],
      language: json['language'],
      currency: json['currency'],
      privacySettings: PrivacySettings.fromJson(json['privacySettings']),
    );
  }
}

class PrivacySettings {
  String? profileVisibility;
  String? emailVisibility;
  bool? dataSharingConsent;

  PrivacySettings({
    this.profileVisibility,
    this.emailVisibility,
    this.dataSharingConsent,
  });

  factory PrivacySettings.fromJson(Map<String, dynamic> json) {
    return PrivacySettings(
      profileVisibility: json['profileVisibility'],
      emailVisibility: json['emailVisibility'],
      dataSharingConsent: json['dataSharingConsent'],
    );
  }
}

class SocialLink {
  String? platform;
  String? url;

  SocialLink({this.platform, this.url});

  factory SocialLink.fromJson(Map<String, dynamic> json) {
    return SocialLink(
      platform: json['platform'],
      url: json['url'],
    );
  }
}

class Skill {
  String? name;
  String? level;
  int? yearsExperience;

  Skill({
    this.name,
    this.level,
    this.yearsExperience,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      name: json['name'],
      level: json['level'],
      yearsExperience: json['yearsExperience'],
    );
  }
}

//post comment and replies

class Post {
  String? postId;
  String? authorId;
  String? title;
  String? content;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;
  List<String>? tags;
  int? likes;
  int? commentsCount;
  int? views;
  List<Comment>? comments;

  Post({
    this.postId,
    this.authorId,
    this.title,
    this.content,
    this.imageUrl,
    this.tags,
    this.likes,
    this.commentsCount,
    this.views,
    this.createdAt,
    this.updatedAt,
    this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      authorId: json['authorId'],
      title: json['title'],
      content: json['content'],
      imageUrl: json['imageUrl'],
      tags: json['tags'],
      likes: json['likes'],
      commentsCount: json['commentsCount'],
      views: json['views'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      comments: (json['comments'] as List)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Comment {
  String? commentId;
  String? userId;
  String? username;
  String? text;
  String? createdAt;
  int? likes;
  List<Reply>? replies;

  Comment({
    this.commentId,
    this.userId,
    this.username,
    this.text,
    this.createdAt,
    this.likes,
    this.replies,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentId: json['commentId'],
      userId: json['userId'],
      username: json['username'],
      text: json['text'],
      createdAt: json['createdAt'],
      likes: json['likes'],
      replies: (json['replies'] as List)
          .map((e) => Reply.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Reply {
  String? replyId;
  String? userId;
  String? username;
  String? text;
  String? createdAt;

  Reply({
    this.replyId,
    this.userId,
    this.username,
    this.text,
    this.createdAt,
  });

  factory Reply.fromJson(Map<String, dynamic> json) {
    return Reply(
      replyId: json['replyId'],
      userId: json['userId'],
      username: json['username'],
      text: json['text'],
      createdAt: json['createdAt'],
    );
  }
}

// product price and rating

class Product {
  String? productId;
  String? productName;
  String? description;
  String? category;
  String? releaseDate;
  Price? price;
  Ratings? ratings;
  int? stockQuantity;
  bool? isAvailable;
  List<String>? features;

  Product({
    this.productId,
    this.productName,
    this.description,
    this.price,
    this.category,
    this.ratings,
    this.stockQuantity,
    this.isAvailable,
    this.releaseDate,
    this.features,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      productName: json['productName'],
      description: json['description'],
      price: Price.fromJson(json['price']),
      category: json['category'],
      ratings: Ratings.fromJson(json['ratings']),
      stockQuantity: json['stockQuantity'],
      isAvailable: json['isAvailable'],
      releaseDate: json['releaseDate'],
      features: List<String>.from(json['features'] as List),
    );
  }
}

class Price {
  double? amount;
  String? currency;

  Price({this.amount, this.currency});

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      amount: json['amount'],
      currency: json['currency'],
    );
  }
}

class Ratings {
  double? averageRating;
  int? totalReviews;
  List<IndividualRating>? individualRatings;

  Ratings({
    this.averageRating,
    this.totalReviews,
    this.individualRatings,
  });

  factory Ratings.fromJson(Map<String, dynamic> json) {
    return Ratings(
      averageRating: (json['averageRating'] as num).toDouble(),
      totalReviews: json['totalReviews'],
      individualRatings: (json['individualRatings'] as List)
          .map((e) => IndividualRating.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class IndividualRating {
  String? userId;
  int? rating;
  String? review;

  IndividualRating({
    this.userId,
    this.rating,
    this.review,
  });

  factory IndividualRating.fromJson(Map<String, dynamic> json) {
    return IndividualRating(
      userId: json['userId'],
      rating: json['rating'],
      review: json['review'],
    );
  }
}

// transtion payment method and shippig adreess

class Transaction {
  String? transactionId;
  String? userId;
  String? productId;
  String? transactionType;
  String? transactionDate;
  String? status;
  Price? amount;
  PaymentMethod? paymentMethod;
  ShippingAddress? shippingAddress;

  Transaction({
    this.transactionId,
    this.userId,
    this.productId,
    this.transactionType,
    this.amount,
    this.transactionDate,
    this.paymentMethod,
    this.status,
    this.shippingAddress,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transactionId'],
      userId: json['userId'],
      productId: json['productId'],
      transactionType: json['transactionType'],
      amount: Price.fromJson(json['amount']),
      transactionDate: json['transactionDate'],
      paymentMethod: PaymentMethod.fromJson(json['paymentMethod']),
      status: json['status'],
      shippingAddress: ShippingAddress.fromJson(json['shippingAddress']),
    );
  }
}

class PaymentMethod {
  String? type;
  String? lastFourDigits;
  String? cardType;

  PaymentMethod({
    this.type,
    this.lastFourDigits,
    this.cardType,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      type: json['type'],
      lastFourDigits: json['lastFourDigits'],
      cardType: json['cardType'],
    );
  }
}

class ShippingAddress {
  String? street;
  String? city;
  String? state;
  String? zipCode;
  String? country;

  ShippingAddress({
    this.street,
    this.city,
    this.state,
    this.zipCode,
    this.country,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
      country: json['country'],
    );
  }
}

// --- Events, EventLocation, Speaker ---

class Event {
  String? eventId;
  String? eventName;
  String? description;
  String? date;
  String? registrationLink;
  EventLocation? location;
  List<Speaker>? speakers;
  int? attendeesCount;
  bool? isOnlineEvent;

  Event({
    this.eventId,
    this.eventName,
    this.description,
    this.date,
    this.location,
    this.speakers,
    this.attendeesCount,
    this.isOnlineEvent,
    this.registrationLink,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['eventId'],
      eventName: json['eventName'],
      description: json['description'],
      date: json['date'],
      location: EventLocation.fromJson(json['location']),
      speakers: (json['speakers'] as List)
          .map((e) => Speaker.fromJson(e as Map<String, dynamic>))
          .toList(),
      attendeesCount: json['attendeesCount'],
      isOnlineEvent: json['isOnlineEvent'],
      registrationLink: json['registrationLink'],
    );
  }
}

class EventLocation {
  String? venue;
  String? city;
  String? country;
  double? latitude;
  double? longitude;

  EventLocation({
    this.venue,
    this.city,
    this.country,
    this.latitude,
    this.longitude,
  });

  factory EventLocation.fromJson(Map<String, dynamic> json) {
    return EventLocation(
        venue: json['venue'],
        city: json['city'],
        country: json['country'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }
}

class Speaker {
  String? speakerId, name, title, talkTitle;

  Speaker({
    this.speakerId,
    this.name,
    this.title,
    this.talkTitle,
  });

  factory Speaker.fromJson(Map<String, dynamic> json) {
    return Speaker(
      speakerId: json['speakerId'],
      name: json['name'],
      title: json['title'],
      talkTitle: json['talkTitle'],
    );
  }
}

List<UserprofModel> userProfiles = userprofile.map((productShow) {
  final rootModel = UserprofModel.fromJson(productShow);
  print('model');
  return rootModel;
}).toList();

List<Map<String, dynamic>> userprofile = [
  {
    "userProfile": {
      "userId": "usr_789012ABCDEF",
      "username": "codemaster_flutter",
      "email": "codemaster.flutter@example.com",
      "dateJoined": "2023-10-26T14:30:00Z",
      "lastLogin": "2025-07-19T13:15:00Z",
      "profilePictureUrl":
          "https://example.com/profiles/codemaster_flutter_avatar.jpg",
      "bio":
          "Passionate Flutter developer building cross-platform masterpieces. Always learning, always coding!",
      "location": {
        "city": "San Francisco",
        "country": "USA",
        "latitude": 37.7749,
        "longitude": -122.4194
      },
      "preferences": {
        "theme": "dark",
        "notificationsEnabled": true,
        "language": "en_US",
        "currency": "USD",
        "privacySettings": {
          "profileVisibility": "public",
          "emailVisibility": "friends_only",
          "dataSharingConsent": true
        }
      },
      "socialLinks": [
        {"platform": "GitHub", "url": "https://github.com/codemasterflutter"},
        {
          "platform": "LinkedIn",
          "url": "https://linkedin.com/in/codemasterflutter"
        },
        {"platform": "Twitter", "url": "https://twitter.com/flutter_dev_pro"}
      ],
      "skills": [
        {"name": "Flutter", "level": "expert", "yearsExperience": 4},
        {"name": "Dart", "level": "expert", "yearsExperience": 5},
        {"name": "Firebase", "level": "advanced", "yearsExperience": 3},
        {"name": "REST APIs", "level": "advanced", "yearsExperience": 4},
        {
          "name": "State Management (Provider, BLoC)",
          "level": "expert",
          "yearsExperience": 3
        }
      ]
    },
    "posts": [
      {
        "postId": "post_1234567890ABCDEF",
        "authorId": "usr_789012ABCDEF",
        "title": "Mastering Flutter Animations: A Deep Dive",
        "content":
            "Exploring complex implicit and explicit animations in Flutter. From basic Opacity to custom Painters.",
        "imageUrl": "https://example.com/posts/flutter_animations.jpg",
        "tags": ["Flutter", "Animations", "UI/UX", "Dart"],
        "likes": 150,
        "commentsCount": 25,
        "views": 2500,
        "createdAt": "2025-07-18T10:00:00Z",
        "updatedAt": "2025-07-18T10:30:00Z",
        "comments": [
          {
            "commentId": "comm_A1B2C3D4E5",
            "userId": "usr_543210FEDCBA",
            "username": "design_guru",
            "text": "Great post! The examples are really helpful.",
            "createdAt": "2025-07-18T11:00:00Z",
            "likes": 10,
            "replies": [
              {
                "replyId": "repl_X9Y8Z7A6B5",
                "userId": "usr_789012ABCDEF",
                "username": "codemaster_flutter",
                "text": "Thanks! Glad you found it useful.",
                "createdAt": "2025-07-18T11:15:00Z"
              }
            ]
          },
          {
            "commentId": "comm_F6G7H8I9J0",
            "userId": "usr_112233445566",
            "username": "junior_dev",
            "text":
                "I'm struggling with custom painters. Any tips for beginners?",
            "createdAt": "2025-07-18T12:00:00Z",
            "likes": 5,
            "replies": []
          }
        ]
      },
      {
        "postId": "post_FEDCBA0987654321",
        "authorId": "usr_789012ABCDEF",
        "title": "State Management Face-off: Provider vs. BLoC",
        "content":
            "A detailed comparison of Provider and BLoC for state management in large Flutter applications.",
        "imageUrl": "https://example.com/posts/state_management.jpg",
        "tags": ["Flutter", "State Management", "Provider", "BLoC"],
        "likes": 200,
        "commentsCount": 40,
        "views": 3000,
        "createdAt": "2025-07-15T09:00:00Z",
        "updatedAt": "2025-07-15T09:45:00Z",
        "comments": []
      }
    ],
    "products": [
      {
        "productId": "prod_PQRSTUUVWXYZ",
        "productName": "Flutter UI Kit Pro",
        "description":
            "A comprehensive UI kit for rapid Flutter app development, including 100+ customizable widgets.",
        "price": {"amount": 49.99, "currency": "USD"},
        "category": "Development Tools",
        "ratings": {
          "averageRating": 4.8,
          "totalReviews": 120,
          "individualRatings": [
            {
              "userId": "usr_543210FEDCBA",
              "rating": 5,
              "review": "Amazing kit, saved me so much time!"
            },
            {
              "userId": "usr_112233445566",
              "rating": 4,
              "review": "Good, but some widgets need more documentation."
            },
            {
              "userId": "usr_789012ABCDEF",
              "rating": 5,
              "review": "As the developer, I approve! 😉"
            }
          ]
        },
        "stockQuantity": 500,
        "isAvailable": true,
        "releaseDate": "2024-12-01T00:00:00Z",
        "features": [
          "100+ Widgets",
          "Dark/Light Theme Support",
          "Responsive Design",
          "Easy Integration"
        ]
      }
    ],
    "transactions": [
      {
        "transactionId": "txn_ABCDEF1234567890",
        "userId": "usr_789012ABCDEF",
        "productId": "prod_PQRSTUUVWXYZ",
        "transactionType": "purchase",
        "amount": {"amount": 49.99, "currency": "USD"},
        "transactionDate": "2025-01-10T15:30:00Z",
        "paymentMethod": {
          "type": "Credit Card",
          "lastFourDigits": "1234",
          "cardType": "Visa"
        },
        "status": "completed",
        "shippingAddress": {
          "street": "123 Dev Lane",
          "city": "San Francisco",
          "state": "CA",
          "zipCode": "94105",
          "country": "USA"
        }
      }
    ],
    "events": [
      {
        "eventId": "evt_ALPHA123",
        "eventName": "Flutter Global Summit 2025",
        "description":
            "The largest annual gathering of Flutter developers worldwide.",
        "date": "2025-09-20T09:00:00Z",
        "location": {
          "venue": "Moscone Center",
          "city": "San Francisco",
          "country": "USA",
          "latitude": 37.7840,
          "longitude": -122.4011
        },
        "speakers": [
          {
            "speakerId": "spk_JDOE",
            "name": "Jane Doe",
            "title": "Google Developer Expert (Flutter)",
            "talkTitle": "Beyond Widgets: Advanced Custom Rendering"
          },
          {
            "speakerId": "spk_MSMITH",
            "name": "Mike Smith",
            "title": "Lead Mobile Engineer at TechCorp",
            "talkTitle": "Scaling Flutter Apps with Micro-frontends"
          }
        ],
        "attendeesCount": 5000,
        "isOnlineEvent": false,
        "registrationLink": "https://flutterglobalsummit.com/register"
      }
    ]
  }
];
