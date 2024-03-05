import 'appAssets.dart';

class AppStringConstants{
  static const double borderRadius = 8;
  static List<String> cities = [
    "Aluva",
    "Angamaly",
    "Edappally",
    "Fort Kochi",
    "Kakkanad",
    "Kalamassery",
    "Kadavantra",
    "Marine Drive",
    "MG Road",
    "North Paravur",
    "Panampilly Nagar",
    "Palarivattom",
    "Perumbavoor",
    "Thrikkakara",
    "Thrippunithura",
    "Vytila",
  ];

  static List<String> specialities = [
    "General medicine",
    "Dentistry",
    "Cardiology",
    "Gastroenterology",
    "Pulmonology",
    "Orthopedics",
    "Dermatology",
    "Obstetrics and Gynecology",
    "Geriatrics",
    "Pediatrics",
    "Psychiatry",
    "ENT",
    "Ophthalmology",
    "Neurology",
    "Sleep Medicine",
    "Allergy & Immunology",
    "Anesthesiology",
    "Endocrinology",
    "Hematology",
    "Nephrology",
    "Oncology",
    "Neurology",
    "Others"
  ];

  static   List<Map<String, dynamic>> categoryName = [
    {
      'layman': 'General medicine',
      'medicalterm': 'General Practitioners',
      'image': AppAssets.firstAid,
    },
    {
      'layman': 'Dental',
      'medicalterm': 'Dentists',
      'image': AppAssets.dental,
    },
    {
      'layman': 'Heart',
      'medicalterm': 'Cardiologists',
      'image': AppAssets.heart,
    },
    {
      'layman': 'Stomach',
      'medicalterm': 'Gastroenterologists',
      'image': AppAssets.stomach,
    },
    {
      'layman': 'Lungs',
      'medicalterm': 'Pulmonologist',
      'image': AppAssets.lungs,
    },
    {
      'layman': 'Bones&Muscles',
      'medicalterm': 'Orthopedists',
      'image': AppAssets.bonesMuscles,
    },
    {
      'layman': 'Skincare',
      'medicalterm': 'Dermatologists',
      'image': AppAssets.skincare,
    },
    {
      'layman': 'Gynecology',
      'medicalterm': 'Gynecologists',
      'image': AppAssets.gynaec,
    },
    {
      'layman': 'Elderly Health',
      'medicalterm': 'Geriatricians',
      'image': AppAssets.elderly,
    },
    {
      'layman': 'Child Health',
      'medicalterm': 'Pediatricians',
      'image': AppAssets.child,
    },
    {
      'layman': 'Psychology',
      'medicalterm': 'Psychiatrists and Psychologists',
      'image': AppAssets.psychology,
    },
    {
      'layman': 'ENT',
      'medicalterm': 'ENT Specialists',
      'image': AppAssets.ent,
    },
    {
      'layman': 'Eye care',
      'medicalterm': 'Ophthalmologists',
      'image': AppAssets.eyecare,
    },
    {
      'layman': 'Brain&Nerves',
      'medicalterm': 'Neurologists',
      'image': AppAssets.brain,
    },
    {
      'layman': 'Sleep health',
      'medicalterm': 'Sleep Medicine Specialists',
      'image': AppAssets.sleep,
    },
  ];
}