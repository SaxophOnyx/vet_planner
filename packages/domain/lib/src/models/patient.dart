class Patient {
  final int id;
  final String name;

  const Patient({
    required this.id,
    required this.name,
  });

  const Patient.empty()
      : id = 0,
        name = '';
}
