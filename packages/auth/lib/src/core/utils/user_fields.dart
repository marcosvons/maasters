// ignore_for_file: public_member_api_docs

enum Seniority {
  trainee('Trainee'),
  junior('Junior'),
  semiSenior('Semi Senior'),
  senior('Senior'),
  unknown('');

  const Seniority(this.value);

  final String value;
}

enum ProfileType {
  mentee,
  mentor,
  unknown,
}

enum SpecificInterest {
  cyberSecurity(
    'Ciberseguridad',
    AreaOfInterest.cyberSecurity,
  ),
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
  digitalMarketing('Marketing Digital', AreaOfInterest.digitalMarketing),
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
  male('Hombre'),
  female('Mujer'),
  notSpecified('Prefiero no decirlo'),
  unknown('');

  const Gender(this.value);

  final String value;
}

enum Objective {
  findJob('Encontrar un trabajo'),
  learn('Aprender y potenciar conocimientos'),
  network('Networking'),
  grow('Crecer profesionalmente'),
  change('Cambiar de carrera'),
  notSure('No estoy seguro');

  const Objective(this.objective);

  final String objective;
}

enum Countries {
  arg('Argentina', '+54'),
  alb('Albania', '+355'),
  ger('Alemania', '+49'),
  and('Andorra', '+376'),
  ang('Angola', '+244'),
  antBar('Antigua y Barbuda', '+1-268'),
  sau('Arabia Saudita', '+966'),
  alg('Argelia', '+213'),
  arm('Armenia', '+374'),
  aus('Australia', '+61'),
  aut('Austria', '+43'),
  aze('Azerbaiyán', '+994'),
  bah('Bahamas', '+1-242'),
  ban('Bangladés', '+880'),
  bar('Barbados', '+1-246'),
  bhr('Baréin', '+973'),
  bel('Bélgica', '+32'),
  blz('Belice', '+501'),
  ben('Benín', '+229'),
  blr('Bielorrusia', '+375'),
  bir('Birmania', '+95'),
  bol('Bolivia', '+591'),
  bosHer('Bosnia y Herzegovina', '+387'),
  bot('Botsuana', '+267'),
  bra('Brasil', '+55'),
  bru('Brunéi', '+673'),
  bul('Bulgaria', '+359'),
  burFas('Burkina Faso', '+226'),
  bur('Burundi', '+257'),
  but('Bután', '+975'),
  cpv('Cabo Verde', '+238'),
  cam('Camboya', '+855'),
  cmr('Camerún', '+237'),
  can('Canadá', '+1'),
  qat('Catar', '+974'),
  cha('Chad', '+235'),
  chi('Chile', '+56'),
  chn('China', '+86'),
  cyp('Chipre', '+357'),
  vat('Ciudad del Vaticano', '+39'),
  col('Colombia', '+57'),
  com('Comoras', '+269'),
  norCor('Corea del Norte', '+850'),
  surCor('Corea del Sur', '+82'),
  cosMar('Costa de Marfil', '+225'),
  cosRic('Costa Rica', '+506'),
  cro('Croacia', '+385'),
  cub('Cuba', '+53'),
  den('Dinamarca', '+45'),
  dma('Dominica', '+1-767'),
  ecu('Ecuador', '+593'),
  egy('Egipto', '+20'),
  slv('El Salvador', '+503'),
  uae('Emiratos Árabes Unidos', '+971'),
  eri('Eritrea', '+291'),
  slo('Eslovaquia', '+421'),
  slov('Eslovenia', '+386'),
  esp('España', '+34'),
  usa('Estados Unidos', '+1'),
  est('Estonia', '+372'),
  esw('Eswatini', '+268'),
  eth('Etiopía', '+251'),
  phi('Filipinas', '+63'),
  fin('Finlandia', '+358'),
  fij('Fiyi', '+679'),
  fra('Francia', '+33'),
  gab('Gabón', '+241'),
  gam('Gambia', '+220'),
  geo('Georgia', '+995'),
  gha('Ghana', '+233'),
  grd('Granada', '+1-473'),
  gre('Grecia', '+30'),
  gua('Guatemala', '+502'),
  guy('Guyana', '+592'),
  gin('Guinea', '+224'),
  guiBis('Guinea-Bisáu', '+245'),
  guiEcu('Guinea Ecuatorial', '+240'),
  hai('Haití', '+509'),
  hon('Honduras', '+504'),
  hun('Hungría', '+36'),
  ind('India', '+91'),
  idn('Indonesia', '+62'),
  irq('Irak', '+964'),
  irn('Irán', '+98'),
  irl('Irlanda', '+353'),
  isl('Islandia', '+354'),
  mhl('Islas Marshall', '+692'),
  slb('Islas Salomón', '+677'),
  isr('Israel', '+972'),
  ita('Italia', '+39'),
  jam('Jamaica', '+1-876'),
  jap('Japón', '+81'),
  jor('Jordania', '+962'),
  kaz('Kazajistán', '+7'),
  ken('Kenia', '+254'),
  kgz('Kirguistán', '+996'),
  kir('Kiribati', '+686'),
  kwt('Kuwait', '+965'),
  lao('Laos', '+856'),
  les('Lesoto', '+266'),
  lva('Letonia', '+371'),
  lbn('Líbano', '+961'),
  lbr('Liberia', '+231'),
  lby('Libia', '+218'),
  lie('Liechtenstein', '+423'),
  ltu('Lituania', '+370'),
  lux('Luxemburgo', '+352'),
  mad('Madagascar', '+261'),
  mys('Malasia', '+60'),
  mwi('Malaui', '+265'),
  mdv('Maldivas', '+960'),
  mli('Malí', '+223'),
  mlt('Malta', '+356'),
  mar('Marruecos', '+212'),
  mau('Mauricio', '+230'),
  mrt('Mauritania', '+222'),
  mex('México', '+52'),
  fsm('Micronesia', '+691'),
  mda('Moldavia', '+373'),
  mco('Mónaco', '+377'),
  mong('Mongolia', '+976'),
  mne('Montenegro', '+382'),
  moz('Mozambique', '+258'),
  nam('Namibia', '+264'),
  nru('Nauru', '+674'),
  npa('Nepal', '+977'),
  nca('Nicaragua', '+505'),
  ner('Níger', '+227'),
  nga('Nigeria', '+234'),
  nor('Noruega', '+47'),
  nzl('Nueva Zelanda', '+64'),
  omn('Omán', '+968'),
  nld('Países Bajos', '+31'),
  pak('Pakistán', '+92'),
  plw('Palaos', '+680'),
  pan('Panamá', '+507'),
  png('Papúa Nueva Guinea', '+675'),
  pry('Paraguay', '+595'),
  per('Perú', '+51'),
  pol('Polonia', '+48'),
  prt('Portugal', '+351'),
  gbr('Reino Unido', '+44'),
  rca('República Centroafricana', '+236'),
  cze('República Checa', '+420'),
  con('República del Congo', '+242'),
  cod('República Democrática del Congo', '+243'),
  dom('República Dominicana', '+1-809, +1-829, +1-849'),
  rum('Rumanía', '+40'),
  rwa('Ruanda', '+250'),
  kna('Saint Kitts y Nevis', '+1-869'),
  lca('Santa Lucía', '+1-758'),
  vct('San Vicente y las Granadinas', '+1-784'),
  wsm('Samoa', '+685'),
  smr('San Marino', '+378'),
  stp('Santo Tomé y Príncipe', '+239'),
  sen('Senegal', '+221'),
  srb('Serbia', '+381'),
  sey('Seychelles', '+248'),
  sle('Sierra Leona', '+232'),
  sgp('Singapur', '+65'),
  sir('Siria', '+963'),
  som('Somalia', '+252'),
  lka('Sri Lanka', '+94'),
  swz('Suazilandia', '+268'),
  zaf('Sudáfrica', '+27'),
  sds('Sudán del Sur', '+211'),
  swe('Suecia', '+46'),
  sui('Suiza', '+41'),
  sur('Surinam', '+597'),
  thai('Tailandia', '+66'),
  tza('Tanzania', '+255'),
  tjk('Tayikistán', '+992'),
  tkm('Turkmenistán', '+993'),
  tls('Timor Oriental', '+670'),
  tog('Togo', '+228'),
  ton('Tonga', '+676'),
  tto('Trinidad y Tobago', '+1-868'),
  tun('Túnez', '+216'),
  tur('Turquía', '+90'),
  ukr('Ucrania', '+380'),
  uga('Uganda', '+256'),
  uzb('Uzbekistán', '+998'),
  vut('Vanuatu', '+678'),
  ven('Venezuela', '+58'),
  vnm('Vietnam', '+84'),
  yem('Yemen', '+967'),
  dji('Yibuti', '+253'),
  zmb('Zambia', '+260'),
  zwe('Zimbabue', '+263'),
  unknown('Unknown', '');

  const Countries(this.name, this.countryCode);
  final String name;
  final String countryCode;
}
