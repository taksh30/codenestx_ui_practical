class Event {
  final String name, location, imageUrl;
  final int id;
  final List<String> images;

  Event({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.id,
    required this.images,
  });
}

List<Event> events = [
  Event(
    name: 'Fringe Club Event',
    location: 'Gelaro Bung Karno Stadium..',
    imageUrl: 'https://picsum.photos/800/400?random=1',
    id: 1,
    images: [
      'https://picsum.photos/800/400?random=1',
      'https://picsum.photos/800/400?random=6',
      'https://picsum.photos/800/400?random=7',
    ],
  ),
  Event(
    name: 'Product Launch Event',
    location: 'Sydney Opera House..',
    imageUrl: 'https://picsum.photos/800/400?random=2',
    id: 2,
    images: [
      'https://picsum.photos/800/400?random=2',
      'https://picsum.photos/800/400?random=8',
      'https://picsum.photos/800/400?random=9',
    ],
  ),
  Event(
    name: 'Food Tasting Event',
    location: 'Tokyo Dome City..',
    imageUrl: 'https://picsum.photos/800/400?random=3',
    id: 3,
    images: [
      'https://picsum.photos/800/400?random=3',
      'https://picsum.photos/800/400?random=10',
      'https://picsum.photos/800/400?random=11',
    ],
  ),
  Event(
    name: 'Networking Event',
    location: 'Royal Albert Hall..',
    imageUrl: 'https://picsum.photos/800/400?random=4',
    id: 4,
    images: [
      'https://picsum.photos/800/400?random=4',
      'https://picsum.photos/800/400?random=12',
      'https://picsum.photos/800/400?random=13',
    ],
  ),
  Event(
    name: 'Fundraiser Event',
    location: 'Bell Centre..',
    imageUrl: 'https://picsum.photos/800/400?random=5',
    id: 5,
    images: [
      'https://picsum.photos/800/400?random=5',
      'https://picsum.photos/800/400?random=14',
      'https://picsum.photos/800/400?random=15',
    ],
  ),
];
