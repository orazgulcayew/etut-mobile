class Faculty {
  final String? title;
  final String? body;
  final String? image;
  final List<Department> departments;

  Faculty({
    this.title,
    this.body,
    this.image,
    required this.departments,
  });

  factory Faculty.fromJson(Map<String, dynamic> json) {
    return Faculty(
      title: json['title'],
      body: json['body'],
      image: json['image'] ??
          "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
      departments: List<Department>.from(
          json['departments'].map((x) => Department.fromJson(x))),
    );
  }
}

class Department {
  final String? title;
  final String? body;
  final String? image;
  final List<Major> majors;

  Department({
    this.title,
    this.body,
    this.image,
    required this.majors,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      title: json['title'],
      body: json['body'],
      image: json['image'] ??
          "https://images.pexels.com/photos/4145194/pexels-photo-4145194.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      majors: List<Major>.from(json['majors'].map((x) => Major.fromJson(x))),
    );
  }
}

class Major {
  final String? title;
  final String? body;
  final String? image;
  final int? department;

  Major({
    required this.title,
    this.body,
    this.image,
    required this.department,
  });

  factory Major.fromJson(Map<String, dynamic> json) {
    return Major(
      title: json['title'],
      body: json['body'],
      image: json['image'] ??
          "https://images.pexels.com/photos/4145194/pexels-photo-4145194.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      department: json['department'],
    );
  }
}
