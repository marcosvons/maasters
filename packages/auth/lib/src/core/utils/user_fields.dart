// ignore_for_file: public_member_api_docs

enum Seniority {
  trainee,
  junior,
  semiSenior,
  senior,
  unknown,
}

enum ProfileType {
  mentee,
  mentor,
  unknown,
}

enum SpecificInterest {
  cyberSecurity('Ciberseguridad', AreaOfInterest.cyberSecurity),
  dataScience('Ciencia de datos', AreaOfInterest.dataScience),
  devOps('DevOps', AreaOfInterest.devOps),
  htmlAndCss('HTML y CSS', AreaOfInterest.frontEnd),
  javascript('JavaScript', AreaOfInterest.frontEnd),
  react('React', AreaOfInterest.frontEnd),
  angular('Angular', AreaOfInterest.frontEnd),
  vue('Vue', AreaOfInterest.frontEnd),
  jQuery('jQuery', AreaOfInterest.frontEnd),
  bootstrap('Bootstrap', AreaOfInterest.frontEnd),
  typescript('TypeScript', AreaOfInterest.frontEnd),
  dotNet('.Net', AreaOfInterest.backEnd),
  java('Java', AreaOfInterest.backEnd),
  nodejs('Node.js', AreaOfInterest.backEnd),
  php('PHP', AreaOfInterest.backEnd),
  ruby('Ruby', AreaOfInterest.backEnd),
  python('Python', AreaOfInterest.backEnd),
  go('Go', AreaOfInterest.backEnd),
  rust('Rust', AreaOfInterest.backEnd),
  flutter('Flutter', AreaOfInterest.mobile),
  reactNative('React Native', AreaOfInterest.mobile),
  swift('Swift', AreaOfInterest.mobile),
  kotlin('Kotlin', AreaOfInterest.mobile),
  qa('QA', AreaOfInterest.qa),
  uxUi('UX/UI', AreaOfInterest.uxUi),
  digitalMarketing('Marketing digital', AreaOfInterest.digitalMarketing),
  productManagement('Product Management', AreaOfInterest.productManagement),
  ioT('IoT', AreaOfInterest.ioT),
  blockchain('Blockchain', AreaOfInterest.blockchain),
  graphicDesign('Diseño gráfico', AreaOfInterest.graphicDesign);

  const SpecificInterest(this.name, this.category);

  final String name;
  final AreaOfInterest category;
}

enum AreaOfInterest {
  qa,
  frontEnd,
  backEnd,
  mobile,
  uxUi,
  digitalMarketing,
  productManagement,
  cyberSecurity,
  dataScience,
  devOps,
  ioT,
  blockchain,
  graphicDesign,
}

enum Gender {
  male,
  female,
  notSpecified,
}

enum Objective {
  findJob('Encontrar un trabajo'),
  learn('Aprender y potenciar conocimientos'),
  network('Networking'),
  grow('Crecer profesionalmente'),
  change('Cambiar de carrera'),
  other('Otro'),
  notSure('No estoy seguro');

  const Objective(this.objective);

  final String objective;
}

List<String> paises = [
  'Afganistán',
  'Albania',
  'Alemania',
  'Andorra',
  'Angola',
  'Antigua y Barbuda',
  'Arabia Saudita',
  'Argelia',
  'Argentina',
  'Armenia',
  'Australia',
  'Austria',
  'Azerbaiyán',
  'Bahamas',
  'Bangladés',
  'Barbados',
  'Baréin',
  'Bélgica',
  'Belice',
  'Benín',
  'Bielorrusia',
  'Birmania',
  'Bolivia',
  'Bosnia y Herzegovina',
  'Botsuana',
  'Brasil',
  'Brunéi',
  'Bulgaria',
  'Burkina Faso',
  'Burundi',
  'Bután',
  'Cabo Verde',
  'Camboya',
  'Camerún',
  'Canadá',
  'Catar',
  'Chad',
  'Chile',
  'China',
  'Chipre',
  'Ciudad del Vaticano',
  'Colombia',
  'Comoras',
  'Corea del Norte',
  'Corea del Sur',
  'Costa de Marfil',
  'Costa Rica',
  'Croacia',
  'Cuba',
  'Dinamarca',
  'Dominica',
  'Ecuador',
  'Egipto',
  'El Salvador',
  'Emiratos Árabes Unidos',
  'Eritrea',
  'Eslovaquia',
  'Eslovenia',
  'España',
  'Estados Unidos',
  'Estonia',
  'Eswatini',
  'Etiopía',
  'Filipinas',
  'Finlandia',
  'Fiyi',
  'Francia',
  'Gabón',
  'Gambia',
  'Georgia',
  'Ghana',
  'Granada',
  'Grecia',
  'Guatemala',
  'Guyana',
  'Guinea',
  'Guinea-Bisáu',
  'Guinea Ecuatorial',
  'Haití',
  'Honduras',
  'Hungría',
  'India',
  'Indonesia',
  'Irak',
  'Irán',
  'Irlanda',
  'Islandia',
  'Islas Marshall',
  'Islas Salomón',
  'Israel',
  'Italia',
  'Jamaica',
  'Japón',
  'Jordania',
  'Kazajistán',
  'Kenia',
  'Kirguistán',
  'Kiribati',
  'Kuwait',
  'Laos',
  'Lesoto',
  'Letonia',
  'Líbano',
  'Liberia',
  'Libia',
  'Liechtenstein',
  'Lituania',
  'Luxemburgo',
  'Madagascar',
  'Malasia',
  'Malaui',
  'Maldivas',
  'Malí',
  'Malta',
  'Marruecos',
  'Mauricio',
  'Mauritania',
  'México',
  'Micronesia',
  'Moldavia',
  'Mónaco',
  'Mongolia',
  'Montenegro',
  'Mozambique',
  'Namibia',
  'Nauru',
  'Nepal',
  'Nicaragua',
  'Níger',
  'Nigeria',
  'Noruega',
  'Nueva Zelanda',
  'Omán',
  'Países Bajos',
  'Pakistán',
  'Palaos',
  'Panamá',
  'Papúa Nueva Guinea',
  'Paraguay',
  'Perú',
  'Polonia',
  'Portugal',
  'Reino Unido',
  'República Centroafricana',
  'República Checa',
  'República del Congo',
  'República Democrática del Congo',
  'República Dominicana',
  'República Sudafricana',
  'Ruanda',
  'Rumania',
  'Rusia',
  'Samoa',
  'San Cristóbal y Nieves',
  'San Marino',
  'San Vicente y las Granadinas',
  'Santa Lucía',
  'Santo Tomé y Príncipe',
  'Senegal',
  'Serbia',
  'Seychelles',
  'Sierra Leona',
  'Singapur',
  'Siria',
  'Somalia',
  'Sri Lanka',
  'Suazilandia',
  'Sudán',
  'Sudán del Sur',
  'Suecia',
  'Suiza',
  'Surinam',
  'Tailandia',
  'Tanzania',
  'Tayikistán',
  'Timor Oriental',
  'Togo',
  'Tonga',
  'Trinidad y Tobago',
  'Túnez',
  'Turkmenistán',
  'Turquía',
  'Tuvalu',
  'Ucrania',
  'Uganda',
  'Uruguay',
  'Uzbekistán',
  'Vanuatu',
  'Venezuela',
  'Vietnam',
  'Yemen',
  'Yibuti',
  'Zambia',
  'Zimbabue',
];
