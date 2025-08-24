class LuckyColorsEntity {
  String? day;
  String? luckyColor1;
  String? luckyColor2;
  String? unluckyColor1;
  String? unluckyColor2;

  LuckyColorsEntity({
    this.day,
    this.luckyColor1,
    this.luckyColor2,
    this.unluckyColor1,
    this.unluckyColor2,
  });

  factory LuckyColorsEntity.fromMap(Map<String, dynamic> map) {
    return LuckyColorsEntity(
      day: map['day'],
      luckyColor1: map['lucky_color1'],
      luckyColor2: map['lucky_color2'],
      unluckyColor1: map['unlucky_color1'],
      unluckyColor2: map['unlucky_color2'],
    );
  }

  Map<String, dynamic> toMap() => {
    'day': day,
    'lucky_color1': luckyColor1,
    'lucky_color2': luckyColor2,
    'unlucky_color1': unluckyColor1,
    'unlucky_color2': unluckyColor2,
  };
}

final List<String> weekDays = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Weekly Color Schedule',
];

class ColorMeaning {
  final String name;
  final String description;

  ColorMeaning({required this.name, required this.description});
}

final List<String> colors = [
  'Red',
  'Blue',
  'Green',
  'Yellow',
  'Purple',
  'Orange',
  'Pink',
  'Brown',
  'Black',
  'White',
  'Gray',
  'Cyan',
  'Magenta',
  'Teal',
  'Indigo',
  'Lime',
  'Amber',
  'Deep Purple',
  'Light Blue',
  'Light Green',
];

final Map<String, ColorMeaning> colorMeanings = {
  'Red': ColorMeaning(
    name: 'Red',
    description:
        'Symbolizes passion, power, and courage. It can inspire inner energy, enhance self-confidence and leadership.',
  ),
  'Blue': ColorMeaning(
    name: 'Blue',
    description:
        'Represents wisdom, trust, and inner peace. It helps improve focus and decision-making abilities.',
  ),
  'Green': ColorMeaning(
    name: 'Green',
    description:
        'Symbolizes nature, growth, and harmony. It brings hope and new beginnings, promoting physical and mental health.',
  ),
  'Yellow': ColorMeaning(
    name: 'Yellow',
    description:
        'Represents joy, wisdom, and creativity. It can inspire ideas and enhance optimistic emotions.',
  ),
  'Purple': ColorMeaning(
    name: 'Purple',
    description:
        'Symbolizes mystery, nobility, and spirituality. It helps enhance intuition and inner wisdom.',
  ),
  'Orange': ColorMeaning(
    name: 'Orange',
    description:
        'Represents vitality, social skills, and success. It can enhance interpersonal relationships and communication skills.',
  ),
  'Pink': ColorMeaning(
    name: 'Pink',
    description:
        'Symbolizes love, gentleness, and romance. It brings harmonious relationships and emotional fulfillment.',
  ),
  'Brown': ColorMeaning(
    name: 'Brown',
    description:
        'Represents stability, reliability, and practicality. It helps build solid foundations and a sense of security.',
  ),
  'Black': ColorMeaning(
    name: 'Black',
    description:
        'Symbolizes power, mystery, and elegance. It can enhance personal charm and inner strength.',
  ),
  'White': ColorMeaning(
    name: 'White',
    description:
        'Represents purity, clarity, and new life. It brings inner peace and new beginnings.',
  ),
  'Gray': ColorMeaning(
    name: 'Gray',
    description:
        'Symbolizes balance, wisdom, and maturity. It helps with rational thinking and emotional stability.',
  ),
  'Cyan': ColorMeaning(
    name: 'Cyan',
    description:
        'Represents freshness, innovation, and communication. It can inspire new ideas and improve expression.',
  ),
  'Magenta': ColorMeaning(
    name: 'Magenta',
    description:
        'Symbolizes passion, uniqueness, and confidence. It can enhance personal charm and self-expression.',
  ),
  'Teal': ColorMeaning(
    name: 'Teal',
    description:
        'Represents healing, balance, and depth. It helps with inner peace and emotional healing.',
  ),
  'Indigo': ColorMeaning(
    name: 'Indigo',
    description:
        'Symbolizes intuition, insight, and wisdom. It can enhance sixth sense and inner insight.',
  ),
  'Lime': ColorMeaning(
    name: 'Lime',
    description:
        'Represents vitality, freshness, and optimism. It brings positive energy and new perspectives.',
  ),
  'Amber': ColorMeaning(
    name: 'Amber',
    description:
        'Symbolizes warmth, wisdom, and protection. It brings a sense of security and inner strength.',
  ),
  'Deep Purple': ColorMeaning(
    name: 'Deep Purple',
    description:
        'Represents mystery, authority, and spirituality. It can enhance personal charm and inner authority.',
  ),
  'Light Blue': ColorMeaning(
    name: 'Light Blue',
    description:
        'Symbolizes calmness, trust, and communication. It helps relax the mind and improve relationships.',
  ),
  'Light Green': ColorMeaning(
    name: 'Light Green',
    description:
        'Represents healing, hope, and new life. It brings inner peace and new beginnings.',
  ),
};
