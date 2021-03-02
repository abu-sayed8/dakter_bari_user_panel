class StaticVariables {
  static const List<String> articleCategoryItems = [
    "News",
    "Diseases & Cause",
    "Health Tips",
    "Food & Nutrition",
    "Medicine & Treatment",
    "Medicare & Hospital",
    "Tourism & Cost",
    "Symptoms",
    "Visual Story",
  ];

  static const List<String> serviceCategoryItems = [
    'Cardiologist',
    'Colorectal Surgeon',
    'Dentist',
    'Dermatologist',
    'Dietician',
    'Eye Doctor',
    'Eye, Nose, Ear (ENT) Specialist',
    'Nephrologists',
    'Neurosurgeon',
    'Nutritionist',
    'Oncologist',
    'Ophthalmologist',
    'Orthodontist',
    'Orthopedic',
    'Surgeon',
    'Pediatrician',
    'Physiotherapist',
    'Plastic Surgeon',
    'Primary Care Doctor',
    'Psychiatrist',
    'Psychologist'
  ];
  static const List<String> genderItems = ['Male','Female','Other'];

  static const List<String> medicineList = [
    'A-One',
    'A-One XR',
    'Ace',
    'Ace Power',
    'Asmol',
    'Centamol',
    'A-Forte',
    'Lifil-A',
    'Vitamin A-Forte',
    'Painex',
    'Pin Zero TR',
    'Alona',
    'Flacol',
    'Flac',
    'Flamyd',
    'Alprax XR',
    'AL-DS',
    'Alba',
    'Alprax',
    'Zerodol',
    'Zolax',
    'Z-Antacid',
    'Antacid Max',
    'Lactameal',
    'Lacticare',
    'Laczym',
  ];
  static const List<String> dosageList =[
    'Tablet', 'Suppository', 'Oral' 'Suspension', 'Pediatric' 'Drops', 'Syrup'
  ];
  static const List<String> bloodGroupList = [
    'A (+ve)',
    'O (+ve)',
    'B (+ve)',
    'AB (+ve)',
    'A (-ve)',
    'O (-ve)',
    'B (-ve)',
    'AB (-ve)',
  ];
  static const List<String> hospitalLabPharmacyList = [

    'Clinic',
    'Hospital',
    'Pharmacy',
    'Lab/Diagonostic',
    'Ambulance',
    'Blood Bank',
    'Fitness Center',
    'Nursing Service',
    'Maternity Center',
    'Physiotherapy Center',
    ];
  static const List<String> travelTourList = [
    'Tickets',
    'Rent a car/bus',
    'Money Exchange',
    'Tour Guide',
    'Tour Package',
    'Travel/Visa Assistant',
    'Hajj Package',
  ];
  static const List<String> hotelRestaurantList = [
    'Hotel',
    'Restaurant',
    'Bangla',
    'Thai',
    'Chinese',
  ];
  static const List<String> educationTrainingList = [
  'School & College',
  'Photography',
  'Coaching',
  'Drawing/Painting',
  'Digital training',
  'Sports & Music',
  'English school',
  'Online training',
  'Vocational Training',
  'Corporate Training',
  ];
  static const List<String> entertainmentList = [
  'Movies',
  'Festivals',
  'Social Events',
  'Cause Dating',
  'Art & Exhibitions',
  'Plays & Comedy',
  'Picnic/Theme Park',
  'Foods & Happy Hours',
  'Events & Nightlife',
  ];
  static const List<String> weddingParlorList = [
    'Parlors',
    'Florists',
    'Cook',
    'Jewelry Shop',
    'Photographers',
    'Sound System',
    'Banquet Hall',
    'Dance/ Music Group',
    'Wedding Decoration',
    'Matrimonial Bureaus',
    'Caterers Supply',
    'Wedding Cards',
  ];
  static const List<String> familyNeedsList = [
  'Supper Shop',
  'Grocery',
  'Home Appliance',
  'Family Care',
  'Fashion Care',
  'Dairy Products',
  'Beauty care',
  'Cleaning Products',
  'Books & Stationery',
  'Fish & Meat',
  'Animals care',
  'Cakes/Pastry',
  'Baby Care',
  'Luggage & Bags',
  ];
  static const List<String> demandServiceList = [
  'Cleaning',
  'Electrical',
  'Gardening',
  'Plumbing',
  'Sanitary',
  'Thai Work',
  'Painting',
  'Ad/Printing',
  'Masonry',
  'Carpentry',
  'Daily Labor',
  'Key maker',
  'Home Design',
  'Civil Contractors',
  'Web Design',
  'Software Sales',
  'Event Management',
  'House Keeping',
  'Film & Movie Production',
  ];
  static const List<String> equipmentToolsList = [
  'Electrical/Electronics',
  'Industrial Equipment’s',
  'Food & Beverages',
  'Fashion Accessories',
  'Furniture & Hardware',
  'Apparels Clothing Footwear',
  'Agriculture Equipment’s',
  'Chemical Equipment',
  'Construction Machinery',
  'Engineering Services',
  'Gardening Tools',
  'Interior Designer Architecture',
  'Leather Goods Accessories',
  'Logistic & Transportation',
  'Laboratory Test Equipment',
  'Packaging & Labeling',
  'Security Equipment’s',
  'Stone Tiles Flooring',
  'Textile Goods',
  'Telecom Products',
  ];
  static const List<String> hireRentList = [
    'Flat on Rent',
    'Lift on Hire',
    'Room on Hire',
    'Cottage on Hire',
    'Hostel on Hire',
    'Bungalows on Hire',
    'Office Space on Hire',
    'Sound System on Hire',
    'Hydraulic Crane on Hire',
    'Dead body Freezer on Hire',
  ];
  static const List<String> automobilesList = [
    'Car',
    'Motor Bike',
    'Automobile Spare parts',
    'Heavy Transport & Parts',
  ];
  static const List<String> realState = [
    'Flat for Sale',
    'Land for Sale',
    'Office for Sale',
    'Hotel for Sale',
    'Business Space for Sale',
    'Farms House for Sale',
    'Other Property',
  ];
  static const List<String> miscellaneousList = [
    'Police Station',
    'RAB',
    'WASA',
    'PDB/ Electricity',
    'GAS Leakage',
    'Fire Station',
    'Roads/Highway',
    '24 Hour Pharmacy',
    'Funeral Service',
  ];
}

class Entry {
  final String title;
  final List<Entry>
      children; //Since this is an expansion list...children can be another list of entries.

  Entry(this.title, [this.children = const <Entry>[]]);
}

///This is the entire multi-level list displayed by this app
List<Entry> faqDataList() {
  final List<Entry> data = <Entry>[
    Entry('1. How much experience Dr. Shahanaz Bari in Pulmonology?', <Entry>[
      Entry('Ans: Dr.Shahanaz Bari has 10 years of experience in Pulmonology.'),
    ]),
    Entry(
        '2. How can I book an online appointment with Dr. Shahanaz Bari, Pulmonology?',
        <Entry>[
          Entry(
              'Ans: You can book an online appointment on DakterBari or you can call on +880-91923366'
              'to our medical experts.'),
        ]),
    Entry('3. What are the consultation charges of Dr. Shahanaz Bari?', <Entry>[
      Entry('Ans: The consultation fee of Dr. Shahanaz Bari is BDT. 1000.'),
    ]),
    Entry(
        '4. What is the location of the hospital/clinic/chamber in Noakhali?',
        <Entry>[
          Entry(
              'Ans: Popular Diagnostic Hospital, Medical Road, Maijdee court, Sadar, Noakhali.'
              'or You can call for details to our medical experts.'),
        ]),
    Entry(
        '5. Can I view the OPD schedule, fee, and other details of Dr. Shahanaz Bari?',
        <Entry>[
          Entry(
              'Ans: Yes, you can view all the required details on DakterBari or you can ask for help from'
              'DakterBari medical experts.'),
        ]),
    Entry('6. Is. Dr. Shahanaz Bari available at any other hospital?', <Entry>[
      Entry(
          'Ans: Yes, or Not. You can check out his visiting schedule on DakterBari.'),
    ]),
    Entry('7. What is Dr. Shahanaz Bari\'s fee?', <Entry>[
      Entry(
          'Ans: Dr. Shahanaz Bari\'s fee at Popular hospital of Noakhali for single consultation is BDT. 1500'
          'plus the registration fees, if applicable.'),
    ]),
    Entry('8. What are Dr. Shahanaz Bari\'s specialty interests?', <Entry>[
      Entry(
          'Ans: Dr. Shahanaz Bari is a trained Pulmonologist. His interests include bronchoscopic procedures and'
          'and management of respiratory failure.'),
    ]),
    Entry('9. Where can I consult Dr. Shahanaz Bari?', <Entry>[
      Entry(
          'Ans: You can consult Dr. Shahanaz Bari at Popular Hospital, Noakhali, from Friday to Saturday, from 10 am to 2 pm.'
          'or check out his chamber schedule in profile on DakterBari'),
    ]),
    Entry('10. What societies is Dr. Shahanaz Bari a member of?', <Entry>[
      Entry(
          'Ans: Dr. Shahanaz Bari is a member of some highly sought after societies and associations like the Bangladesh Medical Association, Europian Respiratory Society,, Europian Society of Intensive care Medicine, Bangladesh Society of Critical Care Medicine'),
    ]),

    //First Row...
    // Entry(
    //   'Title 1',
    //   <Entry>[
    //     Entry('Subtitle 1',
    //       <Entry>[
    //         Entry('Sub Item 1'),
    //         Entry('Sub Item 2'),
    //         Entry('Sub Item 3'),
    //       ],
    //     ),
    //     Entry('Item 1'),
    //     Entry('Item 2'),
    //   ],
    // ),

    //Second Row...
    // Entry('title 2',
    //     <Entry>[
    //       Entry('Item 1'),
    //       Entry('Item 2'),
    //       Entry('Subtitle',
    //         <Entry>[
    //           Entry('Sub Item 1'),
    //           Entry('Sub Item 2'),
    //         ],
    //       )
    //     ]
    // ),
  ];
  return data;
}

///This is the entire multi-level list displayed by this app
List<Entry> medicineDataList(){
  final List<Entry> data = <Entry>[
    Entry('title',
        <Entry>[
          Entry("title",<Entry>[Entry("title")])
        ]
    ),
    Entry('Indications', <Entry>[
      Entry('Ans: Dr.Shahanaz Bari has 10 years of experience in Pulmonology.'),
    ]),
    Entry(
        'Adult dose',
        <Entry>[
          Entry(
              'Ans: You can book an online appointment on DakterBari or you can call on +880-91923366'
                  'to our medical experts.'),
        ]),
    Entry('Child dose', <Entry>[
      Entry('Ans: The consultation fee of Dr. Shahanaz Bari is BDT. 1000.'),
    ]),
    Entry(
        'Renal dose',
        <Entry>[
          Entry(
              'Ans: Popular Diagnostic Hospital, Medical Road, Maijdee court, Sadar, Noakhali.'
                  'or You can call for details to our medical experts.'),
        ]),
    Entry(
        'Administration',
        <Entry>[
          Entry(
              'Ans: Yes, you can view all the required details on DakterBari or you can ask for help from'
                  'DakterBari medical experts.'),
        ]),
    Entry('Contraindication', <Entry>[
      Entry(
          'Ans: Yes, or Not. You can check out his visiting schedule on DakterBari.'),
    ]),
    Entry('Side effect', <Entry>[
      Entry(
          'Ans: Dr. Shahanaz Bari\'s fee at Popular hospital of Noakhali for single consultation is BDT. 1500'
              'plus the registration fees, if applicable.'),
    ]),
    Entry('Precautions & warnings', <Entry>[
      Entry(
          'Ans: Dr. Shahanaz Bari is a trained Pulmonologist. His interests include bronchoscopic procedures and'
              'and management of respiratory failure.'),
    ]),
    Entry('Pregnancy & Lactation', <Entry>[
      Entry(
          'Ans: You can consult Dr. Shahanaz Bari at Popular Hospital, Noakhali, from Friday to Saturday, from 10 am to 2 pm.'
              'or check out his chamber schedule in profile on DakterBari'),
    ]),
    Entry('Therapeutic class', <Entry>[
      Entry(
          'Ans: Dr. Shahanaz Bari is a member of some highly sought after societies and associations like the Bangladesh Medical Association, Europian Respiratory Society,, Europian Society of Intensive care Medicine, Bangladesh Society of Critical Care Medicine'),
    ]),
    Entry('Mode of Action', <Entry>[
      Entry(
          'Ans: Dr. Shahanaz Bari is a member of some highly sought after societies and associations like '
              'the Bangladesh Medical Association, Europian Respiratory Society,, Europian Society of '
              'Intensive care Medicine, Bangladesh Society of Critical Care Medicine'),
    ]),
    Entry('Interaction', <Entry>[
      Entry(
          'Ans: Dr. Shahanaz Bari is a member of some highly sought after societies and associations like the Bangladesh Medical Association, Europian Respiratory Society,, Europian Society of Intensive care Medicine, Bangladesh Society of Critical Care Medicine'),
    ]),

    //First Row...
    // Entry(
    //   'Title 1',
    //   <Entry>[
    //     Entry('Subtitle 1',
    //       <Entry>[
    //         Entry('Sub Item 1'),
    //         Entry('Sub Item 2'),
    //         Entry('Sub Item 3'),
    //       ],
    //     ),
    //     Entry('Item 1'),
    //     Entry('Item 2'),
    //   ],
    // ),

    //Second Row...
    // Entry('title 2',
    //     <Entry>[
    //       Entry('Item 1'),
    //       Entry('Item 2'),
    //       Entry('Subtitle',
    //         <Entry>[
    //           Entry('Sub Item 1'),
    //           Entry('Sub Item 2'),
    //         ],
    //       )
    //     ]
    // ),
  ];
  return data;
}
