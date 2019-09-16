
# Esta sección se queda igual
puts "deleting general feedbacks"
GeneralFeedback.destroy_all

puts 'deleting all answers'
Answer.destroy_all

puts 'deleting all questions'
Question.destroy_all

puts 'deleting metadata-subarticles'
MetadatumSubarticle.destroy_all

puts 'deleting metadata'
Metadatum.destroy_all

puts 'deleting subsubarticles'
Subsubarticle.destroy_all

puts 'deleting subarticles'
Subarticle.destroy_all

puts 'deleting articles'
Article.destroy_all

puts 'destroying chapter_metadata'
ChapterMetadatum.destroy_all

puts 'deleting all chapters'
Chapter.destroy_all

puts 'deleting all titles'
Title.destroy_all

puts 'deleting all consultation'
Consultation.destroy_all

puts 'deleting all legislation'
Legislation.destroy_all

puts 'destroy admin users'
AdminUser.destroy_all

puts 'deleting all users'
User.destroy_all

puts "creating users"
user = User.create!(email: "bobstevens@charitize.com", password: 123456)
User.create!(email: "user2@charitize.com", password: 123456)
User.create!(email: "user3@charitize.com", password: 123456)
User.create!(email: "user4@charitize.com", password: 123456)
User.create!(email: "user5@charitize.com", password: 123456)
User.create!(email: "user6@charitize.com", password: 123456)

puts "creating admin users"
AdminUser.create!(email:"admin@charitize.com", password: 123456)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


puts "creating legislation"
l = Legislation.create!(
title: 'Constitución Política de la República de Panamá',
introduction: "Constitución Política de la República de Panamá y Texto Único del
Reglamento Orgánico del Régimen Interno de la Asamblea Nacional",
user: user)

puts "creating consultation"
Consultation.create!(legislation: l, user: user)

# Aquí es donde empezamos a crear cada sección....
# t -> titles, c -> chapters, a -> articles, m -> metadata, sa -> subarticle, msa -> metadatum_subarticle


puts "creating title 1"
t1 = Title.create!(number: 1,
  description: "EL ESTADO PANAMEÑO",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c11 = Chapter.create!(number: 1,
    description: "Disposiciones Fundamentales",
    title: t1,
    new: false)


    puts 'creating article 1'
    a1 = Article.create!(content: 'La Nación panameña está organizada en Estado soberano e independiente, cuya denominación es República de Panamá. Su Gobierno es unitario, republicano, democrático y
representativo.',
      chapter: c11,
      number: 1,
      new: false)

    # articulo nuevo 1. debe venir despues del 1 con ese titulo
    puts 'creating article 1'
    na1 = Article.create!(content: "Son fines esenciales del Estado promover la vigencia, aplicación y respeto de los Derechos Humanos de todos los ciudadanos y la comunidad, promover la prosperidad general y garantizar la efectividad de los principios, derechos, garantías y deberes consagrados en la Constitución, Tratados y Convenios Internacionales; garantizar el ejercicio de la consulta libre previa informada; facilitar la participación en paridad de todas las personas en las decisiones que las afectan y en la vida económica, política, administrativa, ambiental y cultural de la nación; defender la independencia nacional, mantener la integrriidad tertorial y asegurar la convivencia pacífica y la vigencia de un orden justo.",
      chapter: c11,
      number: 1.1,
      new: true)

    puts 'creating article 2'
    a2 = Article.create!(content: 'El Poder Público sólo emana del pueblo. Lo ejerce el Estado conforme esta Constitución lo establece, por medio de los Órganos Legislativo, Ejecutivo y Judicial, los cuales actúan limitada y separadamente, pero en armónica colaboración.',
      chapter: c11,
      number: 2,
      new: false)

    puts 'creating article 3'
    a3 = Article.create!(content: 'El territorio de la República de Panamá comprende la superficie terrestre, el mar territorial, la plataforma continental submarina, el subsuelo y el espacio aéreo entre Colombia y Costa Rica de acuerdo con los tratados de limites celebrados por Panamá y esos Estados. /n
      El territorio nacional no podrá ser jamás cedido, traspasado o enajenado, ni temporal ni parcialmente, a otros Estados.',
      chapter: c11,
      number: 3,
      new: false)

    puts 'creating article 4'
    a4 = Article.create!(content: 'La República de Panamá acata las normas del Derecho Internacional.',
      chapter: c11,
      number: 4,
      new: false)

    puts 'creating article 5'
    a5 = Article.create!(content: 'El territorio del Estado panameño se divide políticamente en Provincias, éstas a su vez en Distritos y los Distritos en Corregimientos. /n
      La ley podrá crear otras divisiones políticas, ya sea para sujetarlas a regímenes especiales o por razones de conveniencia administrativa o de servicio público.',
      chapter: c11,
      number: 5,
      new: false)

      puts 'creating metadata for article 5'
      m5 = Metadatum.create!(content: "El territorio del Estado panameño se divide políticamente en Provincias y Comarcas  indígenas, las cuales a su vez se dividen en Distritos y los Distritos en Corregimientos. /n
        La ley podrá crear otras divisiones políticas, ya sea para sujetarlas a regímenes especiales o por razones de conveniencia administrativa o de servicio público.",
        article: a5)

    puts 'creating article 6'
    a6 = Article.create!(content: 'Los símbolos de la Nación son: el himno, la bandera y el escudo de armas, adoptados por la Ley 34 de 1949.',
      chapter: c11,
      number: 6,
      new: false)

    puts 'creating article 7'
    a7 = Article.create!(content: 'El español es el idioma oficial de la República.',
      chapter: c11,
      number: 7,
      new: false)



puts "creating title 2"
t2 = Title.create!(number: 2,
  description: "NACIONALIDAD Y EXTRANJERÍA",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c21 = Chapter.create!(number: 0,
    description: "xxx",
    title: t2,
    new: false)


    puts 'creating article 8'
    a8 = Article.create!(content: 'La nacionalidad panameña se adquiere por el nacimiento, por la naturalización o por disposición constitucional.',
      chapter: c21,
      number: 8,
      new: false)

    puts 'creating article 9'
    a9 = Article.create!(content: "Son panameños por nacimiento:",
      chapter: c21,
      number: 9,
      new: false)

      puts 'creating subarticles for article 9'
      sa9001 = Subarticle.create!(content: "Los nacidos en el territorio nacional.",
        article: a9,
        number: 1)

      puts 'creating subarticles for article 9'
      sa9002 = Subarticle.create!(content: "Los hijos de padre o madre panameños por nacimiento nacidos fuera del territorio de la República, si aquellos establecen su domicilio en el territorio nacional.",
        article: a9,
        number: 2)

      puts 'creating subarticles for article 9'
      sa9003 = Subarticle.create!(content: "Los hijos de padre o madre panameños por naturalización nacidos fuera del territorio nacional, si aquellos establecen su domicilio en la República de Panamá y manifiestan su voluntad de acogerse a la nacionalidad panameña a más tardar un año después de su mayoría de edad.",
        article: a9,
        number: 3)

    puts 'creating article 10'
    a10 = Article.create!(content: "Pueden solicitar la nacionalidad panameña por naturalización:",
      chapter: c21,
      number: 10,
      new: false)

      puts 'creating subarticles for article 10'
      sa10001 = Subarticle.create!(content: "Los extranjeros con cinco años consecutivos de residencia en el territorio de la República si, después de haber alcanzado su mayoría de edad, declaran su voluntad de naturalizarse, renuncian expresamente a su nacionalidad de origen o a la que tengan y comprueban que poseen el idioma español y conocimientos básicos de geografía, historia y organización política panameñas.",
        article: a10,
        number: 1)

      puts 'creating subarticles for article 10'
      sa10002 = Subarticle.create!(content: "Los extranjeros con tres años consecutivos de residencia en el territorio de la República que tengan hijos nacidos en ésta, de padre o madre panameños o cónyuge de nacionalidad panameña, si hacen la declaración y presentan la comprobación de que trata el aparte anterior.",
        article: a10,
        number: 2)

      puts 'creating subarticles for article 10'
      sa10003 = Subarticle.create!(content: "Los nacionales por nacimiento, de España o de un Estado latinoamericano, si llenan los mismos requisitos que en su país de origen se exigen a los panameños para naturalizarse.",
        article: a10,
        number: 3)

    puts 'creating article 11'
    a11 = Article.create!(content: "Son panameños por disposición constitucional y sin necesidad de carta de naturaleza, los nacidos en el extranjero y adoptados antes de cumplir siete años por nacionales panameños. En este caso, la nacionalidad se adquiere a partir del momento en que la adopción se inscriba en el Registro Civil panameño.",
      chapter: c21,
      number: 11,
      new: false)

    puts 'creating article 12'
    a12 = Article.create!(content: "La Ley reglamentará la naturalización. El Estado podrá negar una solicitud de carta de naturaleza por razones de moralidad, seguridad, salubridad, incapacidad física o mental.",
      chapter: c21,
      number: 12,
      new: false)

    puts 'creating article 13'
    a13 = Article.create!(content: "La nacionalidad panameña de origen o adquirida por el nacimiento no se pierde, pero la renuncia expresa o tácita de ella suspenderá la ciudadanía. /n
      La nacionalidad panameña derivada o adquirida por la naturalización se perderá por las mismas causas. /n
      La renuncia expresa de la nacionalidad se produce cuando la persona manifiesta por escrito al Ejecutivo su voluntad de abandonarla; y la tácita, cuando se adquiere otra nacionalidad o cuando se entra al servicio de un Estado enemigo.",
      chapter: c21,
      number: 13,
      new: false)

    puts 'creating article 14'
    a14 = Article.create!(content: "La inmigración será regulada por la Ley en atención a los intereses sociales, económicos y demográficos del país.",
      chapter: c21,
      number: 14,
      new: false)

    puts 'creating article 15'
    a15 = Article.create!(content: "Tanto los nacionales como los extranjeros que se encuentren en el territorio de la República, estarán sometidos a la Constitución y a las Leyes.",
      chapter: c21,
      number: 15,
      new: false)

    puts 'creating article 16'
    a16 = Article.create!(content: "Los panameños por naturalización no están obligados a tomar las armas contra su Estado de origen.",
      chapter: c21,
      number: 16,
      new: false)



puts "creating title 3"
t3 = Title.create!(number: 3,
  description: "DERECHOS Y DEBERES INDIVIDUALES Y SOCIALES",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c31 = Chapter.create!(number: 1,
    description: "Garantías Fundamentales",
    title: t3,
    new: false)

    puts 'creating article 17'
    a17 = Article.create!(content: 'Las autoridades de la República están instituidas para proteger en su vida, honra y bienes a los nacionales dondequiera se encuentren y a los extranjeros que estén bajo su jurisdicción; asegurar la efectividad de los derechos y deberes individuales y sociales, y cumplir y hacer cumplir la Constitución y la Ley. /n
      Los derechos y garantías que consagra esta Constitución, deben considerarse como mínimos y no excluyentes de otros que incidan sobre los derechos fundamentales y la dignidad de la persona.',
      chapter: c31,
      number: 17,
      new: false)

    puts 'creating article 18'
    a18 = Article.create!(content: 'Los particulares sólo son responsables ante las autoridades por infracción de la Constitución o de la Ley. Los servidores públicos lo son por esas mismas causas y también por extralimitación de funciones o por omisión en el ejercicio de éstas.',
      chapter: c31,
      number: 18,
      new: false)

    puts 'creating article 19'
    a19 = Article.create!(content: 'No habrá fueros o privilegios ni discriminación por razón de raza, nacimiento, discapacidad, clase social, sexo, religión o ideas políticas.',
      chapter: c31,
      number: 19,
      new: false)

    puts 'creating article 20'
    a20 = Article.create!(content: 'Los panameños y los extranjeros son iguales ante la Ley, pero ésta podrá, por razones de trabajo, de salubridad, moralidad, seguridad pública y economía nacional, subordinar a condiciones especiales o negar el ejercicio de determinadas actividades a los extranjeros en general. Podrán, asimismo, la Ley o las autoridades, según las circunstancias, tomar medidas que afecten exclusivamente a los nacionales de determinados países en caso de guerra o de conformidad con lo que se establezca en tratados internacionales.',
      chapter: c31,
      number: 20,
      new: false)

    puts 'creating article 21'
    a21 = Article.create!(content: 'Nadie puede ser privado de su libertad, sino en virtud de mandamiento escrito de autoridad competente, expedido de acuerdo con las formalidades legales y por motivo previamente definido en la Ley. Los ejecutores de dicho mandamiento están obligados a dar copia de él al interesado, si la pidiere. /n
      El delincuente sorprendido in fraganti puede ser aprehendido por cualquier persona y debe ser entregado inmediatamente a la autoridad. /n
      Nadie puede estar detenido más de veinticuatro horas sin ser puesto a órdenes de la autoridad competente. Los servidores públicos que violen este precepto tienen como sanción la pérdida del empleo, sin perjuicio de las penas que para el efecto establezca la Ley. /n
      No hay prisión, detención o arresto por deuda u obligaciones puramente civiles.',
      chapter: c31,
      number: 21,
      new: false)

    puts 'creating article 22'
    a22 = Article.create!(content: 'Toda persona detenida debe ser informada inmediatamente y en forma que le sea comprensible, de las razones de su detención y de sus derechos constitucionales y legales correspondientes. /n
    Las personas acusadas de haber cometido un delito tienen derecho a que se presuma su inocencia mientras no se pruebe su culpabilidad en juicio público que le haya asegurado todas las garantías establecidas para su defensa. Quien sea detenido tendrá derecho, desde ese momento, a la asistencia de un abogado en las diligencias policiales y judiciales.  /n
    La Ley reglamentará esta materia.',
      chapter: c31,
      number: 22,
      new: false)

    puts 'creating article 23'
    a23 = Article.create!(content: 'Todo individuo detenido fuera de los casos y la forma que prescriben esta Constitución y la Ley, será puesto en libertad a petición suya o  de otra persona, mediante la acción de hábeas corpus que podrá ser interpuesta inmediatamente después de la detención y sin consideración a la pena aplicable. /n
    La acción se tramitará con prelación a otros casos pendientes mediante procedimiento sumarísimo, sin que el trámite pueda ser suspendido por razón de horas o días inhábiles. /n
    El hábeas corpus también procederá cuando exista una amenaza real o cierta contra la libertad corporal, o cuando la forma o las condiciones de la detención o el lugar en donde se encuentra la persona pongan en peligro su integridad física, mental o moral o infrinja su derecho de defensa.',
      chapter: c31,
      number: 23,
      new: false)

    puts 'creating article 24'
    a24 = Article.create!(content: 'El Estado no podrá extraditar a sus nacionales; ni a los extranjeros por delitos políticos.',
      chapter: c31,
      number: 24,
      new: false)

    puts 'creating article 25'
    a25 = Article.create!(content: 'Nadie está obligado a declarar en asunto criminal, correccional o de policía, contra sí mismo, su cónyuge o sus parientes dentro del cuarto grado de consanguinidad o segundo de afinidad.',
      chapter: c31,
      number: 25,
      new: false)

    puts 'creating article 26'
    a26 = Article.create!(content: 'El domicilio o residencia son inviolables. Nadie puede entrar en ellos sin el consentimiento de su dueño, a no ser por mandato escrito de autoridad competente y para fines específicos, o para socorrer a víctimas de crímenes o desastres. /n
    Los servidores públicos de trabajo, de seguridad social y de sanidad pueden practicar, previa identificación, visitas domiciliarias o de inspección, a los sitios de trabajo con el fin de velar por el cumplimiento de las Leyes sociales y de salud pública.',
      chapter: c31,
      number: 26,
      new: false)

    puts 'creating article 27'
    a27 = Article.create!(content: 'Toda persona puede transitar libremente por el territorio nacional y cambiar de domicilio o de residencia sin más limitaciones que las que impongan las leyes o reglamentos de tránsito, fiscales, de salubridad y de migración.',
      chapter: c31,
      number: 27,
      new: false)

    puts 'creating article 28'
    a28 = Article.create!(content: 'El sistema penitenciario se funda en principios de seguridad, rehabilitación y defensa social. Se prohíbe la aplicación de medidas que lesionen la integridad física, mental o moral de los detenidos. /n
    Se establecerá la capacitación de los detenidos en oficios que les permitan reincorporarse útilmente a la sociedad. /n
    Los detenidos menores de edad estarán sometidos a un régimen especial de custodia, protección y educación.',
      chapter: c31,
      number: 28,
      new: false)

    puts 'creating article 29'
    a29 = Article.create!(content: 'La correspondencia y demás documentos privados son inviolables y no pueden ser examinados ni retenidos, sino por mandato de autoridad competente y para fines específicos, de acuerdo con las formalidades legales. En todo caso, se guardará absoluta reserva sobre los asuntos ajenos al objeto del examen o de la retención. /n
    El registro de cartas y demás documentos o papeles se practicará siempre en presencia del interesado o de una persona de su familia o, en su defecto, de dos vecinos honorables del mismo lugar. /n
    Todas las comunicaciones privadas son inviolables y no podrán ser interceptadas o grabadas, sino por mandato de autoridad judicial. /n
    El incumplimiento de esta disposición impedirá la utilización de sus resultados como pruebas, sin perjuicio de las responsabilidades penales en que incurran los autores.',
      chapter: c31,
      number: 29,
      new: false)

    puts 'creating article 30'
    a30 = Article.create!(content: 'No hay pena de muerte, de expatriación, ni de confiscación de bienes.',
      chapter: c31,
      number: 30,
      new: false)

    puts 'creating article 31'
    a31 = Article.create!(content: 'Sólo serán penados los hechos declarados punibles por Ley anterior a su perpetración y exactamente aplicable al acto imputado.',
      chapter: c31,
      number: 31,
      new: false)

    puts 'creating article 32'
    a32 = Article.create!(content: 'Nadie será juzgado, sino por autoridad competente y conforme a los trámites legales, y no más de una vez por la misma causa penal, administrativa, policiva o disciplinaria.',
      chapter: c31,
      number: 32,
      new: false)

    puts 'creating article 33'
    a33 = Article.create!(content: 'Pueden sancionar sin juicio previo, en los casos y dentro de los precisos términos de la Ley:',
      chapter: c31,
      number: 33,
      new: false)

      puts 'creating subarticles for article 33'
      sa33001 = Subarticle.create!(content: "Los jefes de la Fuerza Pública, quienes pueden imponer sanciones a sus subalternos para contener una insubordinación o un motín, o por falta disciplinaria.",
        article: a33,
        number: 1)

      puts 'creating subarticles for article 33'
      sa33002 = Subarticle.create!(content: "Los capitanes de buques o aeronaves, quienes estando fuera de puerto tienen facultad para contener una insubordinación o un motín, o mantener el orden a bordo, y para detener provisionalmente a cualquier delincuente real o presunto.",
        article: a33,
        number: 2)

    puts 'creating article 34'
    a34 = Article.create!(content: 'En caso de infracción manifiesta de un precepto constitucional o legal, en detrimento de alguna persona, el mandato superior no exime de responsabilidad al agente que lo ejecuta. Se exceptúan los miembros de la Fuerza Pública cuando estén en servicio, en cuyo caso la responsabilidad recae únicamente sobre el superior jerárquico que imparta la orden.',
      chapter: c31,
      number: 34,
      new: false)

    puts 'creating article 35'
    a35 = Article.create!(content: 'Es libre la profesión de todas las religiones, así como el ejercicio de todos los cultos, sin otra limitación que el respeto a la moral cristiana y al orden público. Se reconoce que la religión católica es la de la mayoría de los panameños.',
      chapter: c31,
      number: 35,
      new: false)

    puts 'creating article 36'
    a36 = Article.create!(content: 'Las asociaciones religiosas tienen capacidad jurídica y ordenan y administran sus bienes dentro de los límites señalados por la Ley, lo mismo que las demás personas jurídicas.',
      chapter: c31,
      number: 36,
      new: false)

    puts 'creating article 37'
    a37 = Article.create!(content: 'Toda persona puede emitir libremente su pensamiento de palabra, por escrito o por cualquier otro medio, sin sujeción a censura previa; pero existen las responsabilidades legales cuando por alguno de estos medios se atente contra la reputación o la honra de las personas o contra la seguridad social o el orden público.',
      chapter: c31,
      number: 37,
      new: false)

    puts 'creating article 38'
    a38 = Article.create!(content: 'Los habitantes de la República tienen derecho a reunirse pacíficamente y sin armas para fines lícitos. Las manifestaciones o reuniones al aire libre no están sujetas a permiso y sólo se requiere para efectuarlas aviso previo a la autoridad administrativa local, con anticipación de veinticuatro horas. /n
    La autoridad puede tomar medidas de policía para prevenir o reprimir abusos en el ejercicio de este derecho, cuando la forma en que se ejerza cause o pueda causar perturbación del tránsito, alteración del orden público o violación de los derechos de terceros.',
      chapter: c31,
      number: 38,
      new: false)

    puts 'creating article 39'
    a39 = Article.create!(content: 'Es permitido formar compañías, asociaciones y fundaciones que no sean contrarias a la moral o al orden legal, las cuales pueden obtener su reconocimiento como personas jurídicas. /n
    No se otorgará reconocimiento a las asociaciones inspiradas en ideas o teorías basadas en la pretendida superioridad de una raza o de un grupo étnico, o que justifiquen o promuevan la discriminación racial. /n
    La capacidad, el reconocimiento y el régimen de las sociedades y demás personas jurídicas se determinarán por la Ley panameña.',
      chapter: c31,
      number: 39,
      new: false)

    puts 'creating article 40'
    a40 = Article.create!(content: 'Toda persona es libre de ejercer cualquier profesión u oficio sujeta a los reglamentos que establezca la Ley en lo relativo a idoneidad, moralidad, previsión y seguridad sociales, colegiación, salud pública, sindicación y cotizaciones obligatorias. /n
    No se establecerá impuesto o contribución para el ejercicio de las profesiones liberales y de los oficios y las artes.',
      chapter: c31,
      number: 40,
      new: false)

    puts 'creating article 41'
    a41 = Article.create!(content: 'Toda persona tiene derecho a presentar peticiones y quejas respetuosas a los servidores públicos por motivos de interés social o particular, y el de obtener pronta resolución. /n
    El servidor público ante quien se presente una petición, consulta o queja deberá resolver dentro del término de treinta días. /n
    La Ley señalará las sanciones que correspondan a la violación de esta norma.',
      chapter: c31,
      number: 41,
      new: false)

    puts 'creating article 42'
    a42 = Article.create!(content: 'Toda persona tiene derecho a acceder a la información personal contenida en bases de datos o registros públicos y privados, y a requerir su rectificación y protección, así como su supresión, de conformidad con lo previsto en la Ley. /n
    Esta información sólo podrá ser recogida para fines específicos, mediante consentimiento de su titular o por disposición de autoridad competente con fundamento en lo previsto en la Ley.',
      chapter: c31,
      number: 42,
      new: false)

    puts 'creating article 43'
    a43 = Article.create!(content: 'Toda persona tiene derecho a solicitar información de acceso público o de interés colectivo que repose en bases de datos o registros a cargo de servidores públicos o de personas privadas que presten servicios públicos, siempre que ese acceso no haya sido limitado por disposición escrita y por mandato de la Ley, así como para exigir su tratamiento leal y rectificación.',
      chapter: c31,
      number: 43,
      new: false)

    puts 'creating article 44'
    a44 = Article.create!(content: 'Toda persona podrá promover acción de hábeas data con miras a garantizar el derecho de acceso a su información personal recabada en bancos de datos o registros oficiales o particulares, cuando estos últimos traten de empresas que prestan un servicio al público o se dediquen a suministrar información. /n
    Esta acción se podrá interponer, de igual forma, para hacer valer el derecho de acceso a la información pública o de acceso libre, de conformidad con lo establecido en esta Constitución. /n
    Mediante la acción de hábeas data se podrá solicitar que se corrija, actualice, rectifique, suprima o se mantenga en confidencialidad la información o datos que tengan carácter personal. /n
    La Ley reglamentará lo referente a los tribunales competentes para conocer del hábeas data, que se sustanciará mediante proceso sumario y sin necesidad de apoderado judicial.',
      chapter: c31,
      number: 44,
      new: false)

    puts 'creating article 45'
    a45 = Article.create!(content: 'Los Ministros de los cultos religiosos, además de las funciones inherentes a su misión, sólo podrán ejercer los cargos públicos que se relacionen con la asistencia social, la educación o la investigación científica.',
      chapter: c31,
      number: 45,
      new: false)

    puts 'creating article 46'
    a46 = Article.create!(content: 'Las leyes no tienen efecto retroactivo, excepto las de orden público o de interés social cuando en ellas así se exprese. En materia criminal la Ley favorable al reo tiene siempre preferencia y retroactividad, aun cuando hubiese sentencia ejecutoriada.',
      chapter: c31,
      number: 46,
      new: false)

    puts 'creating article 47'
    a47 = Article.create!(content: 'Se garantiza la propiedad privada adquirida con arreglo a la Ley por personas jurídicas o naturales.',
      chapter: c31,
      number: 47,
      new: false)

    puts 'creating article 48'
    a48 = Article.create!(content: 'La propiedad privada implica obligaciones para su dueño por razón de la función social que debe llenar. /n
    Por motivos de utilidad pública o de interés social definidos en la Ley, puede haber expropiación mediante juicio especial e indemnización.',
      chapter: c31,
      number: 48,
      new: false)

    puts 'creating article 49'
    a49 = Article.create!(content: 'El Estado reconoce y garantiza el derecho de toda persona a obtener bienes y servicios de calidad, información veraz, clara y suficiente sobre las características y el contenido de los bienes y servicios que adquiere; así como a la libertad de elección y a condiciones de trato equitativo y digno. /n
    La Ley establecerá los mecanismos necesarios para garantizar esos derechos, su educación y los procedimientos de defensa del consumidor y usuario, el resarcimiento de los daños ocasionados y las sanciones correspondientes por la trasgresión de estos derechos.',
      chapter: c31,
      number: 49,
      new: false)

    puts 'creating article 50'
    a50 = Article.create!(content: 'Cuando de la aplicación de una Ley expedida por motivos de utilidad pública o de interés social, resultaren en conflicto los derechos de particulares con la necesidad reconocida por la misma Ley, el interés privado deberá ceder al interés público o social.',
      chapter: c31,
      number: 50,
      new: false)

    puts 'creating article 51'
    a51 = Article.create!(content: 'En caso de guerra, de grave perturbación del orden público o de interés social urgente, que exijan medidas rápidas, el Ejecutivo puede decretar la expropiación u ocupación de la propiedad privada. /n
    Cuando fuese factible la devolución del objeto ocupado, la ocupación será sólo por el tiempo que duren las circunstancias que la hubieren causado. /n
    El Estado es siempre responsable por toda expropiación que así lleve a cabo el Ejecutivo y por los daños y perjuicios causados por la ocupación, y pagará su valor cuando haya cesado el motivo determinante de la expropiación u ocupación.',
      chapter: c31,
      number: 51,
      new: false)

    puts 'creating article 52'
    a52 = Article.create!(content: 'Nadie está obligado a pagar contribución ni impuesto que no estuvieren legalmente establecidos y cuya cobranza no se hiciere en la forma prescrita por las leyes.',
      chapter: c31,
      number: 52,
      new: false)

    puts 'creating article 53'
    a53 = Article.create!(content: 'Todo autor, artista o inventor goza de la propiedad exclusiva de su obra o invención, durante el tiempo y en la forma que establezca la Ley.',
      chapter: c31,
      number: 53,
      new: false)

    puts 'creating article 54'
    a54 = Article.create!(content: 'Toda persona contra la cual se expida o se ejecute, por cualquier servidor público, una orden de hacer o de no hacer, que viole los derechos y garantías que esta Constitución consagra, tendrá derecho a que la orden sea revocada a petición suya o de cualquier persona. /n
    El recurso de amparo de garantías constitucionales a que este artículo se refiere, se tramitará mediante procedimiento sumario y será de competencia de los tribunales judiciales.',
      chapter: c31,
      number: 54,
      new: false)

    puts 'creating article 55'
    a55 = Article.create!(content: 'En caso de guerra exterior o de perturbación interna que amenace la paz y el orden público, se podrá declarar en estado de urgencia toda la República o parte de ella y suspender temporalmente, de modo parcial o total, los efectos de los artículos 21, 22, 23, 26, 27, 29, 37, 38 y 47 de la Constitución. /n
    El Estado de urgencia y la suspensión de los efectos de las normas constitucionales citadas serán declarados por el Órgano Ejecutivo mediante decreto acordado en Consejo de Gabinete. El Órgano Legislativo, por derecho propio o a instancia del Presidente de la República, deberá conocer de la declaratoria del estado referido si el mismo se prolonga por más de diez días y confirmar o revocar, total o parcialmente, las decisiones adoptadas por el Consejo de Gabinete, relacionadas con el estado de urgencia. /n
    Al cesar la causa que haya motivado la declaratoria del estado de urgencia, el Órgano Legislativo, si estuviese reunido, o, si no lo estuviera, el Consejo de Gabinete levantará el estado de urgencia.',
      chapter: c31,
      number: 55,
      new: false)


  puts 'creating chapter 2'
  c32 = Chapter.create!(number: 2,
    description: "La Familia",
    title: t3,
    new: false)

    puts 'creating article 56'
    a56 = Article.create!(content: 'El Estado protege el matrimonio, la maternidad y la familia. La Ley determinará lo relativo al estado civil. /n
    El Estado protegerá la salud física, mental y moral de los menores y garantizará el derecho de éstos a la alimentación, la salud, la educación y la seguridad y previsión sociales. Igualmente tendrán derecho a esta protección los ancianos y enfermos desvalidos.',
      chapter: c32,
      number: 56,
      new: false)

    puts 'creating article 57'
    a57 = Article.create!(content: 'El matrimonio es el fundamento legal de la familia, descansa en la igualdad de derechos de los cónyuges y puede ser disuelto de acuerdo con la Ley.',
      chapter: c32,
      number: 57,
      new: false)

    puts 'creating article 58'
    a58 = Article.create!(content: 'La unión de hecho entre personas de distinto sexo legalmente capacitadas para contraer matrimonio, mantenida durante cinco años consecutivos en condiciones de singularidad y estabilidad, surtirá todos los efectos del matrimonio civil. Para este fin, bastará que las partes interesadas soliciten conjuntamente al Registro Civil la inscripción del matrimonio de hecho. /n
    Cuando no se haya efectuado esa solicitud, el matrimonio podrá comprobarse, para los efectos de la reclamación de sus derechos, por uno de los cónyuges u otro interesado, mediante los trámites que determine la Ley. Podrán, no obstante, oponerse a que se haga la inscripción o impugnarla después de hecha, el Ministerio Público en interés de la moral y de la Ley, o los terceros que aleguen derechos susceptibles de ser afectados por la inscripción, si la declaración fuere contraria a la realidad de los hechos.',
      chapter: c32,
      number: 58,
      new: false)

    puts 'creating article 59'
    a59 = Article.create!(content: 'La patria potestad es el conjunto de deberes y derechos que tienen los padres en relación con los hijos.  /n
    Los padres están obligados a alimentar, educar y proteger a sus hijos para que obtengan una buena crianza y un adecuado desarrollo físico y espiritual, y éstos a respetarlos y asistirlos. /n
    La Ley regulará el ejercicio de la patria potestad de acuerdo con el interés social y el beneficio de los hijos.',
      chapter: c32,
      number: 59,
      new: false)

    puts 'creating article 60'
    a60 = Article.create!(content: 'Los padres tienen para con sus hijos habidos fuera del matrimonio los mismos deberes que respecto de los nacidos en él. Todos los hijos son iguales ante la Ley y tienen el mismo derecho hereditario en las sucesiones intestadas. /n
    La Ley reconocerá los derechos de los hijos menores o inválidos y de los padres desvalidos en las sucesiones testadas.',
      chapter: c32,
      number: 60,
      new: false)

    puts 'creating article 61'
    a61 = Article.create!(content: 'La Ley regulará la investigación de la paternidad. Queda abolida toda calificación sobre la naturaleza de la filiación. No se consignará declaración alguna que establezca diferencia en los nacimientos o sobre el estado civil de los padres en las actas de inscripción de aquellos, ni en ningún atestado, partida de bautismo o certificado referente a la filiación.  /n
    Se concede facultad al padre del hijo nacido con anterioridad a la vigencia de esta Constitución para ampararlo con lo dispuesto en este artículo, mediante la rectificación de cualquier acta o atestado en los cuales se halle establecida clasificación alguna con respecto a dicho hijo. No se requiere para esto el consentimiento de la madre. Si el hijo es mayor de edad, éste debe otorgar su consentimiento. /n
    En los actos de simulación de paternidad, podrá objetar esta medida quien se encuentre legalmente afectado por el acto. /n
    La Ley señalará el procedimiento.',
      chapter: c32,
      number: 61,
      new: false)

    puts 'creating article 62'
    a62 = Article.create!(content: 'El Estado velará por el mejoramiento social y económico de la familia y organizará el patrimonio familiar determinando la naturaleza y cuantía de los bienes que deban constituirlo, sobre la base de que es inalienable e inembargable.',
      chapter: c32,
      number: 62,
      new: false)

    puts 'creating article 63'
    a63 = Article.create!(content: 'El Estado creará un organismo destinado a proteger la familia con el fin de:',
      chapter: c32,
      number: 63,
      new: false)

      puts 'creating subarticles for article 63'
      sa63001 = Subarticle.create!(content: "Promover la paternidad y la maternidad responsables mediante la educación familiar.",
        article: a63,
        number: 1)

      puts 'creating subarticles for article 63'
      sa63002 = Subarticle.create!(content: "Institucionalizar la educación de los párvulos en centros especializados para atender aquellos cuyos padres o tutores así lo soliciten.",
        article: a63,
        number: 2)

      puts 'creating subarticles for article 63'
      sa63003 = Subarticle.create!(content: "Proteger a los menores y ancianos, y custodiar y readaptar socialmente a los abandonados, desamparados, en peligro moral o con desajustes de conducta.",
        article: a63,
        number: 3)

      # continuaion de parrafo principal
      puts 'creating subarticles for article 63'
      sa0063 = Subarticle.create!(content: "La Ley organizará y determinará el funcionamiento de la jurisdicción especial de menores la cual, entre otras funciones, conocerá sobre la investigación de la paternidad, el abandono de familia y los problemas de conducta juvenil.",
        article: a63,
        number: 2000)


  puts 'creating chapter 3'
  c33 = Chapter.create!(number: 3,
    description: "El Trabajo",
    title: t3,
    new: false)

    puts 'creating article 64'
    a64 = Article.create!(content: 'El trabajo es un derecho y un deber del individuo, y por lo tanto es una obligación del Estado elaborar políticas económicas encaminadas a promover el pleno empleo y asegurar a todo trabajador las condiciones necesarias a una existencia decorosa.',
      chapter: c33,
      number: 64,
      new: false)

    puts 'creating article 65'
    a65 = Article.create!(content: 'A todo trabajador al servicio del Estado o de empresas públicas o privadas o de individuos particulares se le garantiza su salario o sueldo mínimo. /n
    Los trabajadores de las empresas que la Ley determine participarán en las utilidades de las mismas, de acuerdo con las condiciones económicas del país.',
      chapter: c33,
      number: 65,
      new: false)

    puts 'creating article 66'
    a66 = Article.create!(content: 'La Ley establecerá la manera de ajustar periódicamente el salario o sueldo mínimo del trabajador, con el fin de cubrir las necesidades normales de su familia, mejorar su nivel de vida, según las condiciones particulares de cada región y de cada actividad económica; podrá determinar asimismo el método para fijar salarios o sueldos mínimos por profesión u oficio. /n
    En los trabajos por tarea o pieza, es obligatorio que quede asegurado el salario mínimo por pieza o jornada. /n
    El mínimo de todo salario o sueldo es inembargable, salvo las obligaciones alimenticias en la forma que establezca la Ley. Son también inembargables los instrumentos de labor de los trabajadores.',
      chapter: c33,
      number: 66,
      new: false)

    puts 'creating article 67'
    a67 = Article.create!(content: 'A trabajo igual en idénticas condiciones, corresponde siempre igual salario o sueldo, cualesquiera que sean las personas que lo realicen, sin distinción de sexo, nacionalidad, edad, raza, clase social, ideas políticas o religiosas.',
      chapter: c33,
      number: 67,
      new: false)

    puts 'creating article 68'
    a68 = Article.create!(content: 'Se reconoce el derecho de sindicación a los empleadores, asalariados y profesionales de todas clases para los fines de su actividad económica y social. /n
    El Ejecutivo tendrá un término improrrogable de treinta días para admitir o rechazar la inscripción de un sindicato. /n
    La Ley regulará lo concerniente al reconocimiento por el Ejecutivo de los sindicatos, cuya personería jurídica quedará determinada por la inscripción. /n
    El Ejecutivo no podrá disolver un sindicato sino cuando se aparte permanentemente de sus fines y así lo declare tribunal competente mediante sentencia firme. /n
    Las directivas de estas asociaciones estarán integradas exclusivamente por panameños.',
      chapter: c33,
      number: 68,
      new: false)

    puts 'creating article 69'
    a69 = Article.create!(content: 'Se reconoce el derecho de huelga. La Ley reglamentará su ejercicio y podrá someterlo a restricciones especiales en los servicios públicos que ella determine.',
      chapter: c33,
      number: 69,
      new: false)

    puts 'creating article 70'
    a70 = Article.create!(content: 'La jornada máxima de trabajo diurno es de ocho horas y la semana laborable de hasta cuarenta y ocho; la jornada máxima nocturna no será mayor de siete horas y las horas extraordinarias serán remuneradas con recargo. /n
    La jornada máxima podrá ser reducida hasta a seis horas diarias para los mayores de catorce años y menores de dieciocho. Se prohíbe el trabajo a los menores de catorce años y el nocturno a los menores de dieciséis, salvo las excepciones que establezca la Ley. Se prohíbe igualmente el empleo de menores hasta de catorce años en calidad de sirvientes domésticos y el trabajo de los menores y de las mujeres en ocupaciones insalubres. /n
    Además del descanso semanal, todo trabajador tendrá derecho a vacaciones remuneradas.  /n
    La Ley podrá establecer el descanso semanal remunerado de acuerdo con las condiciones económicas y sociales del país y el beneficio de los trabajadores.',
      chapter: c33,
      number: 70,
      new: false)

    puts 'creating article 71'
    a71 = Article.create!(content: 'Son nulas y, por lo tanto, no obligan a los contratantes, aunque se expresen en un convenio de trabajo o en otro pacto cualquiera, las estipulaciones que impliquen renuncia, disminución, adulteración o dejación de algún derecho reconocido a favor del trabajador. La Ley regulará todo lo relativo al contrato de trabajo.',
      chapter: c33,
      number: 71,
      new: false)

    puts 'creating article 72'
    a72 = Article.create!(content: 'Se protege la maternidad de la mujer trabajadora. La que esté en estado de gravidez no podrá ser separada de su empleo público o particular por esta causa. Durante un mínimo de seis semanas precedentes al parto y las ocho que le siguen, gozará de descanso forzoso retribuido del mismo modo que su trabajo y conservará el empleo y todos los derechos correspondientes a su contrato. Al reincorporarse la madre trabajadora a su empleo no podrá ser despedida por el término de un año, salvo en casos especiales previstos en la Ley, la cual reglamentará además, las condiciones especiales de trabajo de la mujer en estado de preñez.',
      chapter: c33,
      number: 72,
      new: false)

    puts 'creating article 73'
    a73 = Article.create!(content: 'Se prohíbe la contratación de trabajadores extranjeros que puedan rebajar las condiciones de trabajo o las normas de vida del trabajador nacional. La Ley regulará la contratación de Gerentes, Directores Administrativos y Ejecutivos, técnicos y profesionales extranjeros para servicios públicos y privados, asegurando siempre los derechos de los panameños y de acuerdo con el interés nacional.',
      chapter: c33,
      number: 73,
      new: false)

    puts 'creating article 74'
    a74 = Article.create!(content: 'Ningún trabajador podrá ser despedido sin justa causa y sin las formalidades que establezca la Ley. Esta señalará las causas justas para el despido, sus excepciones especiales y la indemnización correspondiente.',
      chapter: c33,
      number: 74,
      new: false)

    puts 'creating article 75'
    a75 = Article.create!(content: 'El Estado o la empresa privada impartirán enseñanza profesional gratuita al trabajador. La Ley reglamentará la forma de prestar este servicio.',
      chapter: c33,
      number: 75,
      new: false)

    puts 'creating article 76'
    a76 = Article.create!(content: 'Se establece la capacitación sindical. Será impartida exclusivamente por el Estado y las organizaciones sindicales panameñas.',
      chapter: c33,
      number: 76,
      new: false)

    puts 'creating article 77'
    a77 = Article.create!(content: 'Todas las controversias que originen las relaciones entre el capital y el trabajo, quedan sometidas a la jurisdicción del trabajo, que se ejercerá de conformidad con lo dispuesto por la Ley.',
      chapter: c33,
      number: 77,
      new: false)

    puts 'creating article 78'
    a78 = Article.create!(content: 'La Ley regulará las relaciones entre el capital y el trabajo, colocándolas sobre una base de justicia social y fijando una especial protección estatal en beneficio de los trabajadores.',
      chapter: c33,
      number: 78,
      new: false)

    puts 'creating article 79'
    a79 = Article.create!(content: 'Los derechos y garantías establecidos en este Capítulo serán considerados como mínimos a favor de los trabajadores.',
      chapter: c33,
      number: 79,
      new: false)


  puts 'creating chapter 4'
  c34 = Chapter.create!(number: 4,
    description: "Cultura Nacional",
    title: t3,
    new: false)

    puts 'creating article 80'
    a80 = Article.create!(content: 'El Estado reconoce el derecho de todo ser humano a participar en la Cultura y por tanto debe fomentar la participación de todos los habitantes de la República en la Cultura Nacional.',
      chapter: c34,
      number: 80,
      new: false)

    puts 'creating article 81'
    a81 = Article.create!(content: 'La Cultura Nacional está constituida por las manifestaciones artísticas, filosóficas y científicas producidas por el hombre en Panamá a través de las épocas. El Estado promoverá, desarrollará y custodiará este patrimonio cultural.',
      chapter: c34,
      number: 81,
      new: false)

      puts 'creating metadata for article 81'
      m81 = Metadatum.create!(content: "La cultura nacional está constituida por las manifestaciones artísticas, filosóficas, científicas y cognitivas, producidas por los grupos humanos de todas las etnias y su mestizaje que convergen en la República de Panamá a través de las épocas. El Estado promoverá, desarrollará y custodiará este patrimonio cultural a este fin el Estado formulará la política cultural nacional destinada a este propósito.",
        article: a81)

    puts 'creating article 82'
    a82 = Article.create!(content: 'El Estado velará por la defensa, difusión y pureza del idioma Español.',
      chapter: c34,
      number: 82,
      new: false)

    puts 'creating article 83'
    a83 = Article.create!(content: 'El Estado formulará la política científica nacional destinada a promover el desarrollo de la ciencia y la tecnología.',
      chapter: c34,
      number: 83,
      new: false)

    puts 'creating article 84'
    a84 = Article.create!(content: 'El Estado reconoce la individualidad y el valor universal de la obra artística; auspiciará y estimulará a los artistas nacionales divulgando sus obras a través de sistemas de orientación cultural y promoverá a nivel nacional el desarrollo del arte en todas sus manifestaciones mediante instituciones académicas, de divulgación y recreación.',
      chapter: c34,
      number: 84,
      new: false)

    puts 'creating article 85'
    a85 = Article.create!(content: 'Constituyen el patrimonio histórico de la Nación los sitios y objetos arqueológicos, los documentos, monumentos históricos u otros bienes muebles o inmuebles que sean testimonio del pasado panameño. El Estado decretará la expropiación de los que se encuentren en manos de particulares. /n
    La Ley reglamentará lo concerniente a su custodia, fundada en la primacía histórica de los mismos y tomará las providencias necesarias para conciliarla con la factibilidad de programas de carácter comercial, turístico, industrial y de orden tecnológico.',
      chapter: c34,
      number: 85,
      new: false)

    puts 'creating article 86'
    a86 = Article.create!(content: 'El Estado fomentará el desarrollo de la cultura física mediante instituciones deportivas, de enseñanza y de recreación que serán reglamentadas por la Ley.',
      chapter: c34,
      number: 86,
      new: false)

    puts 'creating article 87'
    a87 = Article.create!(content: 'El Estado reconoce que las tradiciones folclóricas constituyen parte medular de la cultura nacional y por tanto promoverá su estudio, conservación y divulgación, estableciendo su primacía sobre manifestaciones o tendencias que la adulteren.',
      chapter: c34,
      number: 87,
      new: false)

    puts 'creating article 88'
    a88 = Article.create!(content: 'Las lenguas aborígenes serán objeto de especial estudio, conservación y divulgación y el Estado promoverá programas de alfabetización bilingüe en las comunidades indígenas.',
      chapter: c34,
      number: 88,
      new: false)

    puts 'creating article 89'
    a89 = Article.create!(content: 'Los medios de comunicación social son instrumentos de información, educación, recreación y difusión cultural y científica. Cuando sean usados para la publicidad o la difusión de propaganda, éstas no deben ser contrarias a la salud, la moral, la educación, formación cultural de la sociedad y la conciencia nacional. La Ley reglamentará su funcionamiento.',
      chapter: c34,
      number: 89,
      new: false)

    puts 'creating article 90'
    a90 = Article.create!(content: 'El Estado reconoce y respeta la identidad étnica de las comunidades indígenas nacionales, realizará programas tendientes a desarrollar los valores materiales, sociales y espirituales propios de cada una de sus culturas y creará una institución para el estudio, conservación, divulgación de las mismas y de sus lenguas, así como la promoción del desarrollo integral de dichos grupos humanos.',
      chapter: c34,
      number: 90,
      new: false)

      puts 'creating metadata for article 90'
      m90 = Metadatum.create!(content: "El Estado reconoce y respeta la identidad y diversidad cultural de los pueblos originarios nacionales, sus derechos colectivos, su sistema de organización y gobernanza; y realizará programas tendientes a desarrollar sus valores materiales, culturales, económicos y sociales con base en sus tradiciones ancestrales; todo 10 anterior, con sujeción al respeto y observancia de los derechos humanos, la constitución y las leyes. La Ley reglamentará estos principios.",
        article: a90)


  puts 'creating chapter 5'
  c35 = Chapter.create!(number: 5,
    description: "Educación",
    title: t3,
    new: false)

    puts 'creating article 91'
    a91 = Article.create!(content: 'Todos tienen el derecho a la educación y la responsabilidad de educarse. El Estado organiza y dirige el servicio público de la educación nacional y garantiza a los padres de familia el derecho de participar en el proceso educativo de sus hijos. /n
    La educación se basa en la ciencia, utiliza sus métodos, fomenta su crecimiento y difusión y aplica sus resultados para asegurar el desarrollo de la persona humana y de la familia, al igual que la afirmación y fortalecimiento de la Nación panameña como comunidad cultural y política. /n
    La educación es democrática y fundada en principios de solidaridad humana y justicia social.',
      chapter: c35,
      number: 91,
      new: false)

    puts 'creating article 92'
    a92 = Article.create!(content: 'La educación debe atender el desarrollo armónico e integral del educando dentro de la convivencia social, en los aspectos físico, intelectual, moral, estético y cívico y debe procurar su capacitación para el trabajo útil en interés propio y en beneficio colectivo.',
      chapter: c35,
      number: 92,
      new: false)

    puts 'creating article 93'
    a93 = Article.create!(content: 'Se reconoce que es finalidad de la educación panameña fomentar en el estudiante una conciencia nacional basada en el conocimiento de la historia y los problemas de la patria.',
      chapter: c35,
      number: 93,
      new: false)

    puts 'creating article 94'
    a94 = Article.create!(content: 'Se garantiza la libertad de enseñanza y se reconoce el derecho de crear centros docentes particulares con sujeción a la Ley. El Estado podrá intervenir en los establecimientos docentes particulares para que se cumplan en ellos los fines nacionales y sociales de la cultura y la formación intelectual, moral, cívica y física de los educandos. /n
    La educación pública es la que imparten las dependencias oficiales y la educación particular es la impartida por las entidades privadas. /n
    Los establecimientos de enseñanza, sean oficiales o particulares, están abiertos a todos los alumnos, sin distinción de raza, posición social, ideas políticas, religión o la naturaleza de la unión de sus progenitores o guardadores. /n
    La Ley reglamentará tanto la educación pública como la educación particular.',
      chapter: c35,
      number: 94,
      new: false)

    puts 'creating article 95'
    a95 = Article.create!(content: 'La educación oficial es gratuita en todos los niveles preuniversitarios. /n
    Es obligatorio el primer nivel de enseñanza o educación básica general. /n
    La gratuidad implica para el Estado proporcionar al educando todos los útiles necesarios para su aprendizaje mientras completa su educación básica general. /n
    La gratuidad de la educación no impide el establecimiento de un derecho de matrícula pagada en los niveles no obligatorios.',
      chapter: c35,
      number: 95,
      new: false)

    puts 'creating article 96'
    a96 = Article.create!(content: 'La Ley determinará la dependencia estatal que elaborará y aprobará los planes de estudios, los programas de enseñanza y los niveles educativos, así como la organización de un sistema nacional de orientación educativa, todo ello de conformidad con las necesidades nacionales.',
      chapter: c35,
      number: 96,
      new: false)

    puts 'creating article 97'
    a97 = Article.create!(content: 'Se establece la educación laboral, como una modalidad no regular del sistema de educación, con programas de educación básica y capacitación especial.',
      chapter: c35,
      number: 97,
      new: false)

    puts 'creating article 98'
    a98 = Article.create!(content: 'Las empresas particulares cuyas operaciones alteren significativamente la población escolar en una área determinada, contribuirán a atender las necesidades educativas de conformidad con las normas oficiales y las empresas urbanizadoras tendrán esta misma responsabilidad en cuanto a los sectores que desarrollen.',
      chapter: c35,
      number: 98,
      new: false)

    puts 'creating article 99'
    a99 = Article.create!(content: 'Sólo se reconocen los títulos académicos y profesionales expedidos por el Estado o autorizados por éste de acuerdo con la Ley. La Universidad Oficial del Estado fiscalizará a las universidades particulares aprobadas oficialmente para garantizar los títulos que expidan y revalidará los de universidades extranjeras en los casos que la Ley establezca.',
      chapter: c35,
      number: 99,
      new: false)

    puts 'creating article 100'
    a100 = Article.create!(content: 'La educación se impartirá en el idioma oficial, pero por motivos de interés público la Ley podrá permitir que en algunos planteles ésta se imparta también en idioma extranjero. /n
    La enseñanza de la historia de Panamá y de la educación cívica será dictada por panameños.',
      chapter: c35,
      number: 100,
      new: false)

    puts 'creating article 101'
    a101 = Article.create!(content: 'La Ley podrá crear incentivos económicos en beneficio de la educación pública y de la educación particular, así como para la edición de obras didácticas nacionales.',
      chapter: c35,
      number: 101,
      new: false)

    puts 'creating article 102'
    a102 = Article.create!(content: 'El Estado establecerá sistemas que proporcionen los recursos adecuados para otorgar becas, auxilios u otras prestaciones económicas a los estudiantes que lo merezcan o lo necesiten. /n
    En igualdad de circunstancias se preferirá a los económicamente más necesitados.',
      chapter: c35,
      number: 102,
      new: false)

    puts 'creating article 103'
    a103 = Article.create!(content: 'La Universidad Oficial de la República es autónoma. Se le reconoce personería jurídica, patrimonio propio y derecho de administrarlo.  /n
    Tiene facultad para organizar sus estudios y designar y separar su personal en la forma que determine la Ley. Incluirá en sus actividades el estudio de los problemas nacionales así como la difusión de la cultura nacional. Se dará igual importancia a la educación universitaria impartida en Centros Regionales que a la otorgada en la capital.',
      chapter: c35,
      number: 103,
      new: false)

    puts 'creating article 104'
    a104 = Article.create!(content: 'Para hacer efectiva la autonomía económica de la Universidad, el Estado la dotará de lo indispensable para su instalación, funcionamiento y desarrollo futuro, así como del patrimonio de que trata el artículo anterior y de los medios necesarios para acrecentarlo.',
      chapter: c35,
      number: 104,
      new: false)

    puts 'creating article 105'
    a105 = Article.create!(content: 'Se reconoce la libertad de cátedra sin otras limitaciones que las que, por razones de orden público, establezca el Estatuto Universitario.',
      chapter: c35,
      number: 105,
      new: false)

    puts 'creating article 106'
    a106 = Article.create!(content: 'La excepcionalidad en el estudiante, en todas sus manifestaciones, será atendida mediante educación especial, basada en la investigación científica y orientación educativa.',
      chapter: c35,
      number: 106,
      new: false)

    puts 'creating article 107'
    a107 = Article.create!(content: 'Se enseñará la religión católica en las escuelas públicas, pero su aprendizaje y la asistencia a los cultos religiosos no serán obligatorios cuando lo soliciten sus padres o tutores.',
      chapter: c35,
      number: 107,
      new: false)

    puts 'creating article 108'
    a108 = Article.create!(content: 'El Estado desarrollará programas de educación y promoción para los grupos indígenas ya que poseen patrones culturales propios, a fin de lograr su participación activa en la función ciudadana.',
      chapter: c35,
      number: 108,
      new: false)


  puts 'creating chapter 6'
  c36 = Chapter.create!(number: 6,
    description: "Salud, Seguridad Social y Asistencia Social",
    title: t3,
    new: false)

    puts 'creating article 109'
    a109 = Article.create!(content: 'Es función esencial del Estado velar por la salud de la población  de la República. El individuo, como parte de la comunidad, tiene derecho a la promoción, protección, conservación, restitución y rehabilitación de la salud y la obligación de conservarla, entendida ésta como el completo bienestar físico, mental y social.',
      chapter: c36,
      number: 109,
      new: false)

    puts 'creating article 110'
    a110 = Article.create!(content: 'En materia de salud, corresponde primordialmente al Estado el desarrollo de las siguientes actividades, integrando las funciones de prevención, curación y rehabilitación:',
      chapter: c36,
      number: 110,
      new: false)

      puts 'creating subarticles for article 110'
      sa110001 = Subarticle.create!(content: "Desarrollar una política nacional de alimentación y nutrición que asegure un óptimo estado nutricional para toda la población, al promover la disponibilidad, el consumo y el aprovechamiento biológico de los alimentos adecuados.",
        article: a110,
        number: 1)

      puts 'creating subarticles for article 110'
      sa110002 = Subarticle.create!(content: "Capacitar al individuo y a los grupos sociales, mediante acciones educativas, que difundan el conocimiento de los deberes y derechos individuales y colectivos en materia de salud personal y ambiental.",
        article: a110,
        number: 2)

      puts 'creating subarticles for article 110'
      sa110003 = Subarticle.create!(content: "Proteger la salud de la madre, del niño y del adolescente, garantizando una atención integral durante el proceso de gestación, lactancia, crecimiento y desarrollo en la niñez y adolescencia.",
        article: a110,
        number: 3)

      puts 'creating subarticles for article 110'
      sa110004 = Subarticle.create!(content: "Combatir las enfermedades transmisibles mediante el saneamiento ambiental, el desarrollo de la disponibilidad de agua potable y adoptar medidas de inmunización, profilaxis y tratamiento, proporcionadas colectiva o individualmente, a toda la población.",
        article: a110,
        number: 4)

      puts 'creating subarticles for article 110'
      sa110005 = Subarticle.create!(content: "Crear, de acuerdo con las necesidades de cada región, establecimientos en los cuales se presten servicios de salud integral y suministren medicamentos a toda la población. Estos servicios de salud y medicamentos serán proporcionados gratuitamente a quienes carezcan de recursos económicos.",
        article: a110,
        number: 5)

      puts 'creating subarticles for article 110'
      sa110006 = Subarticle.create!(content: "Regular y vigilar el cumplimiento de las condiciones de salud y la seguridad que deban reunir los lugares de trabajo, estableciendo una política nacional de medicina e higiene industrial y laboral.",
        article: a110,
        number: 6)

    puts 'creating article 111'
    a111 = Article.create!(content: 'El Estado deberá desarrollar una política nacional de medicamentos que promueva la producción, disponibilidad, accesibilidad, calidad y control de los medicamentos para toda la población del país.',
      chapter: c36,
      number: 111,
      new: false)

    puts 'creating article 112'
    a112 = Article.create!(content: 'Es deber del Estado establecer una política de población que responda a las necesidades del desarrollo social y económico del país.',
      chapter: c36,
      number: 112,
      new: false)

    puts 'creating article 113'
    a113 = Article.create!(content: 'Todo individuo tiene derecho a la seguridad de sus medios económicos de subsistencia en caso de incapacidad para trabajar u obtener trabajo retribuido. Los servicios de seguridad social serán prestados o administrados por entidades autónomas y cubrirán los casos de enfermedad, maternidad, invalidez, subsidios de familia, vejez, viudez, orfandad, paro forzoso, accidentes de trabajo, enfermedades profesionales y las demás contingencias que puedan ser objeto de previsión y seguridad sociales. La Ley proveerá la implantación de tales servicios a medida que las necesidades lo exijan.  /n
    El Estado creará establecimientos de asistencia y previsión sociales. Son tareas fundamentales de éstos la rehabilitación económica y social de los sectores dependientes o carentes de recursos y la atención de los mentalmente incapaces, los enfermos crónicos, los inválidos indigentes y de los grupos que no hayan sido incorporados al sistema de seguridad social.',
      chapter: c36,
      number: 113,
      new: false)

    puts 'creating article 114'
    a114 = Article.create!(content: 'El Estado podrá crear fondos complementarios con el aporte y participación de los trabajadores de las empresas públicas y privadas a fin de mejorar los servicios de seguridad social en materia de jubilaciones. La Ley reglamentará esta materia.',
      chapter: c36,
      number: 114,
      new: false)

    puts 'creating article 115'
    a115 = Article.create!(content: 'Los sectores gubernamentales de salud, incluyendo sus instituciones autónomas y semiautónomas, intégranse orgánica y funcionalmente. /n
    La Ley reglamentará esta materia.',
      chapter: c36,
      number: 115,
      new: false)

    puts 'creating article 116'
    a116 = Article.create!(content: 'Las comunidades tienen el deber y el derecho de participar en la planificación, ejecución y evaluación de los distintos programas de salud.',
      chapter: c36,
      number: 116,
      new: false)

    puts 'creating article 117'
    a117 = Article.create!(content: 'El Estado establecerá una política nacional de vivienda destinada a proporcionar el goce de este derecho social a toda la población, especialmente a los sectores de menor ingreso.',
      chapter: c36,
      number: 117,
      new: false)


  puts 'creating chapter 7'
  c37 = Chapter.create!(number: 7,
    description: "Régimen Ecológico",
    title: t3,
    new: false)

  # nombre de capitulo modificado
  puts 'creating metadata for chapter 7'
  m37 = ChapterMetadatum.create!(
    content: "Régimen Ambiental",
    chapter: c37)

    puts 'creating article 118'
    a118 = Article.create!(content: 'Es deber fundamental del Estado garantizar que la población viva en un ambiente sano y libre de contaminación, en donde el aire, el agua y los alimentos satisfagan los requerimientos del desarrollo adecuado de la vida humana.',
      chapter: c37,
      number: 118,
      new: false)

    # articulo nuevo 2. debe venir despues del 118 con ese titulo
    puts 'creating article 118'
    a118 = Article.create!(content: "Es deber del Estado enfrentar el cambio climático en el contexto del desarrollo sostenible, adoptando medidas para la mitigación y eficiencia energética, incluyendo el desarrollo y uso de tecnologías limpias y fuentes de energía renovables, encaminadas hacia un modelo de descarbonización; e implementando las medidas de adaptación, restaurauración de ecosistemas y educación necesarias para reducir la vulnerabilidad e incrementar la resiliencia de la población, los ecosistemas y los sistemas productivos a los impactos producidos por la degradación ambiental y el cambio climático.",
      chapter: c37,
      number: 118.2,
      new: true)

    puts 'creating article 119'
    a119 = Article.create!(content: 'El Estado y todos los habitantes del territorio nacional tienen el deber de propiciar un desarrollo social y económico que prevenga la contaminación del ambiente, mantenga el equilibrio ecológico y evite la destrucción de los ecosistemas.',
      chapter: c37,
      number: 119,
      new: false)

    puts 'creating article 120'
    a120 = Article.create!(content: 'El Estado reglamentará, fiscalizará y aplicará oportunamente las medidas necesarias para garantizar que la utilización y el aprovechamiento de la fauna terrestre, fluvial y marina, así como de los bosques, tierras y aguas, se lleven a cabo racionalmente, de manera que se evite su depredación y se asegure su preservación, renovación y permanencia.',
      chapter: c37,
      number: 120,
      new: false)

    puts 'creating article 121'
    a121 = Article.create!(content: 'La Ley reglamentará el aprovechamiento de los recursos naturales no renovables, a fin de evitar que del mismo se deriven perjuicios sociales, económicos y ambientales.',
      chapter: c37,
      number: 121,
      new: false)


  puts 'creating chapter 8'
  c38 = Chapter.create!(number: 8,
    description: "Régimen Agrario",
    title: t3,
    new: false)

    puts 'creating article 122'
    a122 = Article.create!(content: 'El Estado prestará atención especial al desarrollo integral del sector agropecuario, fomentará el aprovechamiento óptimo del suelo, velará por su distribución racional y su adecuada utilización y conservación, a fin de mantenerlo en condiciones productivas y garantizará el derecho de todo agricultor a una existencia decorosa.',
      chapter: c38,
      number: 122,
      new: false)

    puts 'creating article 123'
    a123 = Article.create!(content: 'El Estado no permitirá la existencia de áreas incultas, improductivas u ociosas y regulará las relaciones de trabajo en el agro, fomentando una máxima productividad y justa distribución de los beneficios de ésta.',
      chapter: c38,
      number: 123,
      new: false)

      puts 'creating metadata for article 123'
      m123 = Metadatum.create!(content: "El Estado no permitirá la existencia de áreas incultas, improductivas u ociosas, reconocerá los servicios ecosistémicos del ambiente natural y regulará las relaciones de trabajo en el agro, fomentando una máxima productividad y justa distribución de los beneficios de ésta.",
        article: a123)

    puts 'creating article 124'
    a124 = Article.create!(content: 'El Estado dará atención especial a las comunidades campesinas e indígenas con el fin de promover su participación económica, social y política en la vida nacional.',
      chapter: c38,
      number: 124,
      new: false)

    puts 'creating article 125'
    a125 = Article.create!(content: 'El correcto uso de la tierra agrícola es un deber del propietario para con la comunidad y será regulado por la Ley de conformidad con su clasificación ecológica, a fin de evitar la subutilización y disminución de su potencial productivo.',
      chapter: c38,
      number: 125,
      new: false)

    puts 'creating article 126'
    a126 = Article.create!(content: 'Para el cumplimiento de los fines de la política agraria, el Estado desarrollará las siguientes actividades:',
      chapter: c38,
      number: 126,
      new: false)

      puts 'creating subarticles for article 126'
      sa126001 = Subarticle.create!(content: "Dotar a los campesinos de las tierras de labor necesarias y regular el uso de las aguas. La Ley podrá establecer un régimen especial de propiedad colectiva para las comunidades campesinas que lo soliciten;",
        article: a126,
        number: 1)

      puts 'creating subarticles for article 126'
      sa126002 = Subarticle.create!(content: "Organizar la asistencia crediticia para satisfacer las necesidades de financiamiento de la actividad agropecuaria y, en especial, del sector de escasos recursos y sus grupos organizados y dar atención especial al pequeño y mediano productor;",
        article: a126,
        number: 2)

      puts 'creating subarticles for article 126'
      sa126003 = Subarticle.create!(content: "Tomar medidas para asegurar mercados estables y precios equitativos a los productos y para impulsar el establecimiento de entidades, corporaciones y cooperativas de producción, industrialización. Distribución y consumo;",
        article: a126,
        number: 3)

      puts 'creating subarticles for article 126'
      sa126004 = Subarticle.create!(content: "Establecer medios de comunicación y transporte para unir las comunidades campesinas e indígena con los centros de almacenamiento, distribución y consumo;",
        article: a126,
        number: 4)

      puts 'creating subarticles for article 126'
      sa126005 = Subarticle.create!(content: "Colonizar nuevas tierras y reglamentar la tenencia y el uso de las mismas y de las que se integren a la economía como resultado de la construcción de nuevas carreteras;",
        article: a126,
        number: 5)

      puts 'creating subarticles for article 126'
      sa126006 = Subarticle.create!(content: "Estimular el desarrollo del sector agrario mediante asistencia técnica y fomento de la organización, capacitación, protección, tecnificación y demás formas que la Ley determine; y,",
        article: a126,
        number: 6)

      puts 'creating subarticles for article 126'
      sa126007 = Subarticle.create!(content: "Realizar estudios de la tierra a fin de establecer la clasificación agrológica del suelo panameño.",
        article: a126,
        number: 7)

      # continua parrafo del articulo
      puts 'creating subarticles for article 126'
      sa00126 = Subarticle.create!(content: "La política establecida para el desarrollo de este Capítulo será aplicable a las comunidades indígenas de acuerdo con los métodos científicos de cambio cultural.",
        article: a126,
        number: 2000)

    puts 'creating article 127'
    a127 = Article.create!(content: 'El Estado garantizará a las comunidades indígenas la reserva de las tierras necesarias y la propiedad colectiva de las mismas para el logro de su bienestar económico y social. La Ley regulará los procedimientos que deban seguirse para lograr esta finalidad y las delimitaciones correspondientes dentro de las cuales se prohíbe la apropiación privada de tierras.',
      chapter: c38,
      number: 127,
      new: false)

    puts 'creating article 128'
    a128 = Article.create!(content: 'Se establece la jurisdicción agraria y la Ley determinará la organización y funciones de sus tribunales.',
      chapter: c38,
      number: 128,
      new: false)


  puts 'creating chapter 9'
  c39 = Chapter.create!(number: 9,
    description: "Defensoría del Pueblo",
    title: t3,
    new: false)

    puts 'creating article 129'
    a129 = Article.create!(content: 'La Defensoría del Pueblo velará por la protección de los derechos y las garantías fundamentales consagradas en esta Constitución, así como los previstos en los convenios internacionales de derechos humanos y la Ley, mediante el control no jurisdiccional de los hechos, actos u omisiones de los servidores públicos y de quienes presten servicios públicos, y actuará para que ellos se respeten. /n
      La Defensoría del Pueblo actuará bajo la dirección y responsabilidad del Defensor del Pueblo, quien será nombrado por el Órgano Legislativo para un periodo de cinco años, dentro del cual no podrá ser suspendido ni removido, sino por el voto de dos tercios de los miembros de la Asamblea Nacional, en virtud de causas definidas previamente por la Ley.',
      chapter: c39,
      number: 129,
      new: false)

    puts 'creating article 130'
    a130 = Article.create!(content: 'Para ser elegido Defensor del Pueblo se requiere:',
      chapter: c39,
      number: 130,
      new: false)

      puts 'creating subarticles for article 130'
      sa130001 = Subarticle.create!(content: "Ser panameño por nacimiento.",
        article: a130,
        number: 1)

      puts 'creating subarticles for article 130'
      sa130002 = Subarticle.create!(content: "Estar en pleno goce de sus derechos civiles y políticos.",
        article: a130,
        number: 2)

      puts 'creating subarticles for article 130'
      sa130003 = Subarticle.create!(content: "Haber cumplido treinta y cinco años o más de edad.",
        article: a130,
        number: 3)

      puts 'creating subarticles for article 130'
      sa130004 = Subarticle.create!(content: "No haber sido condenado por delito doloso con pena privativa de la libertad de cinco años o más.",
        article: a130,
        number: 4)

      puts 'creating subarticles for article 130'
      sa130005 = Subarticle.create!(content: "Tener solvencia moral y prestigio reconocido.",
        article: a130,
        number: 5)

      puts 'creating subarticles for article 130'
      sa130006 = Subarticle.create!(content: "No tener parentesco, dentro del cuarto grado de consanguinidad y segundo de afinidad, con el Presidente de la República, con ningún otro miembro del Consejo de Gabinete, con Magistrados de la Corte Suprema de Justicia ni con Diputados de la República.",
        article: a130,
        number: 6)



puts "creating title 4"
t4 = Title.create!(number: 4,
  description: "DERECHOS POLÍTICOS",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c41 = Chapter.create!(number: 1,
    description: "De la Ciudadanía",
    title: t4,
    new: false)

    puts 'creating article 131'
    a131 = Article.create!(content: 'Son ciudadanos de la República todos los panameños mayores de dieciocho años, sin distinción de sexo.',
      chapter: c41,
      number: 131,
      new: false)

    puts 'creating article 132'
    a132 = Article.create!(content: 'Los derechos políticos y la capacidad para ejercer cargos públicos con mando y jurisdicción, se reservan a los ciudadanos panameños.',
      chapter: c41,
      number: 132,
      new: false)

    puts 'creating article 133'
    a133 = Article.create!(content: 'El ejercicio de los derechos ciudadanos se suspende:',
      chapter: c41,
      number: 133,
      new: false)

      puts 'creating subarticles for article 133'
      sa133001 = Subarticle.create!(content: "Por causa expresada en el artículo 13 de esta Constitución.",
        article: a133,
        number: 1)

      puts 'creating subarticles for article 133'
      sa133002 = Subarticle.create!(content: "Por pena conforme a la Ley.",
        article: a133,
        number: 2)

    puts 'creating article 134'
    a134 = Article.create!(content: 'La Ley regulará la suspensión y recobro de la ciudadanía.',
      chapter: c41,
      number: 134,
      new: false)


  puts 'creating chapter 2'
  c42 = Chapter.create!(number: 2,
    description: "El Sufragio",
    title: t4,
    new: false)


    puts 'creating article 135'
    a135 = Article.create!(content: 'El sufragio es un derecho y un deber de todos los ciudadanos. El voto es libre, igual, universal, secreto y directo.',
      chapter: c42,
      number: 135,
      new: false)

    puts 'creating article 136'
    a136 = Article.create!(content: 'Las autoridades están obligadas a garantizar la libertad y honradez del sufragio. Se prohíbe:',
      chapter: c42,
      number: 136,
      new: false)

      puts 'creating subarticles for article 136'
      sa136001 = Subarticle.create!(content: "El apoyo oficial, directo o indirecto, a candidatos a puestos de elección popular, aun cuando fueren velados los medios empleados a tal fin.",
        article: a136,
        number: 1)

      puts 'creating subarticles for article 136'
      sa136002 = Subarticle.create!(content: "Las actividades de propaganda y afiliación partidista en las oficinas públicas.",
        article: a136,
        number: 2)

      puts 'creating subarticles for article 136'
      sa136003 = Subarticle.create!(content: "La exacción de cuotas o contribuciones a los empleados públicos para fines políticos, aun a pretexto de que son voluntarias.",
        article: a136,
        number: 3)

      puts 'creating subarticles for article 136'
      sa136004 = Subarticle.create!(content: "Cualquier acto que impida o dificulte a un ciudadano obtener, guardar o presentar personalmente su cédula de identidad.",
        article: a136,
        number: 4)

      # continua parrafo del articulo
      puts 'creating subarticles for article 136'
      sa00136 = Subarticle.create!(content: "Igualmente, se prohíbe la exacción de cuotas, contribuciones, cobros o descuentos a los trabajadores del sector privado por los empleadores para fines políticos, aun a pretexto que son voluntarias. /n
      La Ley tipificará los delitos electorales y señalará las sanciones respectivas.",
        article: a136,
        number: 2000)

    puts 'creating article 137'
    a137 = Article.create!(content: 'Las condiciones de elegibilidad para ser candidato a cargos de elección popular, por parte de funcionarios públicos, serán definidas en la Ley.',
      chapter: c42,
      number: 137,
      new: false)

      puts 'creating metadata for article 137'
      m137 = Metadatum.create!(content: "La Ley definirá las condiciones de elegibilidad de los servidores públicos para cargos de elección popular, sin perjuicio de las restricciones establecidas en esta Constitución; de igual modo, garantizará la paridad en las postulaciones. Ningún ciudadano podrá estar postulado para más de un cargo de elección popular.",
        article: a137)

    puts 'creating article 138'
    a138 = Article.create!(content: 'Los partidos políticos expresan el pluralismo político, concurren a la formación y manifestación de la voluntad popular y son instrumentos fundamentales para la participación política, sin perjuicio de la postulación libre en la forma prevista en esta Constitución y la Ley. La estructura interna y el funcionamiento de los partidos políticos estarán fundados en principios democráticos. /n
    La Ley reglamentará el reconocimiento y subsistencia de los partidos políticos, sin que, en ningún caso, pueda establecer que el número de los votos necesarios para su subsistencia sea superior al cinco por ciento de los votos válidos emitidos en las elecciones para Presidente, Diputados, Alcaldes o Representantes de Corregimientos, según la votación más favorable al partido.',
      chapter: c42,
      number: 138,
      new: false)

    puts 'creating article 139'
    a139 = Article.create!(content: 'No es lícita la formación de partidos que tengan por base el sexo, la raza, la religión o que tiendan a destruir la forma democrática de Gobierno.',
      chapter: c42,
      number: 139,
      new: false)

    puts 'creating article 140'
    a140 = Article.create!(content: 'Los partidos políticos tendrán derecho, en igualdad de condiciones, al uso de los medios de comunicación social que el Gobierno Central administre y a recabar y recibir informes de todas las autoridades públicas sobre cualquier materia de su competencia, que no se refieran a relaciones diplomáticas reservadas.',
      chapter: c42,
      number: 140,
      new: false)

    puts 'creating article 141'
    a141 = Article.create!(content: 'El Estado podrá fiscalizar y contribuir a los gastos en que incurran las personas naturales y los partidos políticos en los procesos electorales. La Ley determinará y reglamentará dichas fiscalizaciones y contribuciones, asegurando la igualdad de erogaciones de todo partido o candidato.',
      chapter: c42,
      number: 141,
      new: false)


  puts 'creating chapter 3'
  c43 = Chapter.create!(number: 3,
    description: "El Tribunal Electoral",
    title: t4,
    new: false)

    puts 'creating article 142'
    a142 = Article.create!(content: 'Con el objeto de garantizar la libertad, honradez y eficacia del sufragio popular, se establece un tribunal autónomo e independiente, denominado Tribunal Electoral, al que se le reconoce personería jurídica, patrimonio propio y derecho de administrarlo. Este Tribunal interpretará y aplicará privativamente la Ley Electoral, dirigirá, vigilará y fiscalizará la inscripción de hechos vitales, defunciones, naturalización y demás hechos y actos jurídicos relacionados con el estado civil de las personas; la expedición de la cédula de identidad personal y las fases del proceso electoral. /n
    El Tribunal Electoral tendrá jurisdicción en toda la República y se compondrá de tres Magistrados que reúnan los mismos requisitos que se exigen para ser Magistrado de la Corte Suprema de Justicia, los cuales serán designados, en forma escalonada, para un periodo de diez años así: uno por el Órgano Legislativo, otro por el Órgano Ejecutivo y el tercero por la Corte Suprema de Justicia, entre personas que no formen parte de la autoridad nominadora. Para cada principal se nombrará, de la misma forma, un suplente.  /n
    Los Magistrados del Tribunal Electoral y el Fiscal General Electoral son responsables ante la Corte Suprema de Justicia por las faltas o delitos cometidos en el ejercicio de sus funciones, y les son aplicables las mismas prohibiciones y prerrogativas que establece esta Constitución para los Magistrados de la Corte Suprema de Justicia.',
      chapter: c43,
      number: 142,
      new: false)

    puts 'creating article 143'
    a143 = Article.create!(content: 'El Tribunal Electoral tendrá, además de las que le confiere la Ley, las siguientes atribuciones que ejercerá privativamente, excepto las consignadas en los numerales 5, 7 y 10:',
      chapter: c43,
      number: 143,
      new: false)

      puts 'creating subarticles for article 143'
      sa143001 = Subarticle.create!(content: "Efectuar las inscripciones de nacimientos, matrimonios, defunciones, naturalizaciones y demás hechos y actos jurídicos relacionados con el estado civil de las personas, y hacer las anotaciones procedentes en las respectivas inscripciones.",
        article: a143,
        number: 1)

      puts 'creating subarticles for article 143'
      sa143002 = Subarticle.create!(content: "Expedir la cédula de identidad personal.",
        article: a143,
        number: 2)

      puts 'creating subarticles for article 143'
      sa143003 = Subarticle.create!(content: "Reglamentar la Ley Electoral, interpretarla y aplicarla, y conocer de las controversias que origine su aplicación.",
        article: a143,
        number: 3)

      puts 'creating subarticles for article 143'
      sa143004 = Subarticle.create!(content: "Sancionar las faltas y delitos contra la libertad y pureza del sufragio, de conformidad con la Ley, garantizando la doble instancia.",
        article: a143,
        number: 4)

      puts 'creating subarticles for article 143'
      sa143005 = Subarticle.create!(content: "Levantar el Padrón Electoral.",
        article: a143,
        number: 5)

      puts 'creating subarticles for article 143'
      sa143006 = Subarticle.create!(content: "Organizar, dirigir y fiscalizar el registro de electores y resolver las controversias, quejas y denuncias que al respecto ocurrieren.",
        article: a143,
        number: 6)

      puts 'creating subarticles for article 143'
      sa143007 = Subarticle.create!(content: "Tramitar los expedientes de las solicitudes de migración y naturalización.",
        article: a143,
        number: 7)

      puts 'creating subarticles for article 143'
      sa143008 = Subarticle.create!(content: "Nombrar los miembros de las corporaciones electorales, en las cuales se deberá garantizar la representación de los partidos políticos legalmente constituidos. La Ley reglamentará esta materia.",
        article: a143,
        number: 8)

      puts 'creating subarticles for article 143'
      sa143009 = Subarticle.create!(content: "Formular su presupuesto y remitirlo oportunamente al Órgano Ejecutivo para su inclusión en el proyecto de Presupuesto General del Estado. El Tribunal Electoral sustentará, en todas las etapas,su proyecto de presupuesto. El presupuesto finalmente aprobado procurará garantizarle los fondos necesarios para el cumplimiento de sus fines. /n
        En dicho presupuesto se incorporarán los gastos de funcionamiento del Tribunal Electoral y de la Fiscalía General Electoral, las inversiones y los gastos necesarios para realizar los procesos electorales y las demás consultas populares, así como los subsidios a los partidos políticos y a los candidatos independientes a los puestos de elección popular. Durante el año inmediatamente anterior a las elecciones generales y hasta el cierre del periodo electoral, el Tribunal Electoral será fiscalizado por la Contraloría General de la República, solamente mediante el control posterior.",
        article: a143,
        number: 9)

      puts 'creating subarticles for article 143'
      sa1430010 = Subarticle.create!(content: "Ejercer iniciativa legislativa en las materias que son de su competencia.",
        article: a143,
        number: 10)

      puts 'creating subarticles for article 143'
      sa1430011 = Subarticle.create!(content: "Conocer privativamente de los recursos y acciones que se presenten en contra de las decisiones de los juzgados penales electorales y de la Fiscalía General Electoral. Las decisiones en materia electoral del Tribunal Electoral únicamente son recurribles ante él mismo y, una vez cumplidos los trámites de Ley, serán definitivas, irrevocables y obligatorias. Contra estas decisiones solo podrá ser admitido el recurso de inconstitucionalidad.",
        article: a143,
        number: 11)

    puts 'creating article 144'
    a144 = Article.create!(content: 'La Fiscalía General Electoral es una agencia de instrucción independiente y coadyuvante del Tribunal Electoral, que tendrá derecho a administrar su Presupuesto. /n
    El Fiscal General Electoral será nombrado por el Órgano Ejecutivo sujeto a la aprobación del Órgano Legislativo, para un periodo de diez años; deberá llenar los mismos requisitos que para ser Magistrado de la Corte Suprema de Justicia y tendrá iguales restricciones. Sus funciones son:',
      chapter: c43,
      number: 144,
      new: false)

      puts 'creating subarticles for article 144'
      sa144001 = Subarticle.create!(content: "Salvaguardar los derechos políticos de los ciudadanos.",
        article: a144,
        number: 1)

      puts 'creating subarticles for article 144'
      sa14402 = Subarticle.create!(content: "Vigilar la conducta oficial de los funcionarios públicos en lo que respecta a los derechos y deberes políticos electorales.",
        article: a144,
        number: 2)

      puts 'creating subarticles for article 144'
      sa144003 = Subarticle.create!(content: "Perseguir los delitos y contravenciones electorales.",
        article: a144,
        number: 3)

      puts 'creating subarticles for article 144'
      sa144004 = Subarticle.create!(content: "Ejercer las demás funciones que señale la Ley.",
        article: a144,
        number: 4)

    puts 'creating article 145'
    a145 = Article.create!(content: 'Las autoridades públicas están obligadas a acatar y cumplir las órdenes y decisiones emanadas de los funcionarios de la jurisdicción electoral, prestando a éstos la obediencia, cooperación y ayuda que requieran para el desempeño de sus atribuciones. La omisión o negligencia en el cumplimiento de tal obligación será sancionada de acuerdo con lo que disponga la Ley.',
      chapter: c43,
      number: 145,
      new: false)



puts "creating title 5"
t5 = Title.create!(number: 5,
  description: "EL ÓRGANO LEGISLATIVO",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c51 = Chapter.create!(number: 1,
    description: "Asamblea Nacional",
    title: t5,
    new: false)

    puts 'creating article 146'
    a146 = Article.create!(content: 'El Órgano Legislativo estará constituido por una corporación denominada Asamblea Nacional, cuyos miembros serán elegidos mediante postulación partidista o por libre postulación, mediante votación popular directa, conforme esta Constitución lo establece. /n
      Los requisitos y procedimientos que se establezcan en la Ley para formalizar la libre postulación, serán equivalentes y proporcionales a los que se exijan para la inscripción de los partidos políticos y para la presentación de las postulaciones partidistas en lo que sean aplicables.',
      chapter: c51,
      number: 146,
      new: false)

    puts 'creating article 147'
    a147 = Article.create!(content: 'La Asamblea Nacional se compondrá de setenta y un Diputados que resulten elegidos de conformidad con la Ley y sujeto a lo que se dispone a continuación:',
      chapter: c51,
      number: 147,
      new: false)

      puts 'creating subarticles for article 147'
      sa147001 = Subarticle.create!(content: "Habrá circuitos uninominales y plurinominales, garantizándose el principio de representación proporcional. Integrará un solo circuito electoral todo distrito en donde se elija más de un Diputado, salvo el distrito de Panamá, donde habrá circuitos de tres o más Diputados.",
        article: a147,
        number: 1)

      puts 'creating subarticles for article 147'
      sa147002 = Subarticle.create!(content: "Los circuitos se conformarán en proporción al número de electores que aparezca en el último Padrón Electoral.",
        article: a147,
        number: 2)

      puts 'creating subarticles for article 147'
      sa147003 = Subarticle.create!(content: "A cada comarca y a la provincia de Darién les corresponderá elegir el número de Diputados con que cuentan al momento de entrar en vigencia la presente norma.",
        article: a147,
        number: 3)

      puts 'creating subarticles for article 147'
      sa147004 = Subarticle.create!(content: "Para la creación de los circuitos, se tomará en cuenta la división político administrativa del país, la proximidad territorial, la concentración de la población, los lazos de vecindad, las vías de comunicación y los factores históricos y culturales, como criterios básicos para el agrupamiento de los electores en circuitos electorales. A cada Diputado le corresponderá un suplente personal elegido con el Diputado principal el mismo día que este, quien lo reemplazará en sus faltas. /n
      El Tribunal Electoral, previa consulta con los partidos legalmente reconocidos, en el marco del organismo de consulta instituido, elaborará y presentará a la Asamblea Nacional el proyecto de ley que crea los circuitos electorales que servirán de base para la elección de Diputados, con arreglo a lo dispuesto en esta norma constitucional.",
        article: a147,
        number: 4)

      # articulo 147 modificado con lista
      puts 'creating metadata for article 147'
      m147 = Metadatum.create!(content: "La Asamblea Nacional se compondrá de setenta y un (71) diputados elegidos de conformidad con la Ley y con sujeción a lo que se dispone a continuación:",
        article: a147)

      puts 'creating metadata subarticles for article 147'
      msa147001 = MetadatumSubarticle.create!(content: "Todos los diputados serán elegidos para un periodo de cinco años mediante el sistema de representación proporcional que determine la Ley, el mismo día en que se celebre la elección ordinaria de Presidente y Vicepresidente de la República.",
        metadatum: m147,
        number: 1)

      puts 'creating metadata subarticles for article 147'
      msa147002 = MetadatumSubarticle.create!(content: "Salvo las excepciones a que se refiere el numeral cinco (5) y seis (6), todos los circuitos electorales serán de postulación plurinominal, en los cuales se elegirán no menos de dos diputados.",
        metadatum: m147,
        number: 2)

      puts 'creating metadata subarticles for article 147'
      msa147003 = MetadatumSubarticle.create!(content: "Las provincias de Bocas del Toro y Los Santos en las cuales se eligen actualmente dos (2) diputados y la provincia de Herrera, que elige tres (3), quedan constituidas en sendos circuitos electorales plurinominales.",
        metadatum: m147,
        number: 3)

      puts 'creating metadata subarticles for article 147'
      msa147004 = MetadatumSubarticle.create!(content: "Las demás provincias se dividirán en circuitos electorales plurinominales, que se conformarán en proporción al número de electores que aparezca en el último Padrón Electoral. Para la creación de dichos circuitos, se tomarán en cuenta la división políticoadministrativa del país, la proximidad territorial, la concentración de la población, los lazos  de vecindad, las vías de comunicación y los factores históricos y culturales como criterios básicos para el agrupamiento de los electores.",
        metadatum: m147,
        number: 4)

      puts 'creating metadata subarticles for article 147'
      msa147005 = MetadatumSubarticle.create!(content: "Los actuales circuitos electorales que constituyen la provincia de Darién y las Comarcas Guna Yala y Ngabe-Buglé seguirán siendo de postulación uninominal.",
        metadatum: m147,
        number: 5)

      puts 'creating metadata subarticles for article 147'
      msa147006 = MetadatumSubarticle.create!(content: "Se constituye el circuito electoral de la Comarca Emberá-Wounaan, el cual será de postulación uninominal.",
        metadatum: m147,
        number: 6)

      puts 'creating metadata subarticles for article 147'
      msa147007 = MetadatumSubarticle.create!(content: "Los diputados solo podrán reelegirse por un periodo adicional, en forma consecutiva.",
        metadatum: m147,
        number: 7)

      puts 'creating metadata subarticles for article 147'
      msa147008 = MetadatumSubarticle.create!(content: "A cada Diputado le corresponderá un suplente personal elegido con el Diputado principal el mismo día que éste, quien lo reemplazará en sus faltas y devengará emolumentos solo cuando estén cumpliendo la función de reemplazo del Diputado principal. El suplente no podrá ser ni el cónyuge o pariente dentro del cuarto grado de consanguinidad o segundo de afinidad del Diputado principal.",
        metadatum: m147,
        number: 8)

      puts 'creating metadata subarticles for article 147'
      msa147009 = MetadatumSubarticle.create!(content: "El Tribunal Electoral, previa consulta con los partidos legalmente reconocidos y la Comisión Nacional de Reformas Electorales, en el marco del organismo de consulta instituido, elaborará y presentará a la Asamblea Nacional el proyecto de ley que crea los circuitos electorales que servirán de base para la elección de diputados, con arreglo a lo dispuesto en este artículo.",
        metadatum: m147,
        number: 9)

   puts 'creating article 148'
    a148 = Article.create!(content: 'Los Diputados serán elegidos por un período de cinco años, el mismo día en que se celebre la elección ordinaria de Presidente y Vicepresidente de la República.',
      chapter: c51,
      number: 148,
      new: false)

   puts 'creating article 149'
    a149 = Article.create!(content: 'La Asamblea Nacional se reunirá por derecho propio, sin previa convocatoria, en la Capital de la República, en sesiones que durarán ocho meses en el lapso de un año, dividido en dos legislaturas ordinarias de cuatro meses cada una. Dichas legislaturas se extenderán desde el primero de julio hasta el treinta y uno de octubre, y desde el dos de enero hasta el treinta de abril.  /n
    La Asamblea Nacional podrá reunirse en otro lugar del país, siempre que lo decida la mayoría de sus miembros. /n
    También se reunirá la Asamblea Nacional, en legislatura extraordinaria, cuando sea convocada por el Órgano Ejecutivo y durante el tiempo que este señale, para conocer exclusivamente de los asuntos que dicho Órgano someta a su consideración.',
      chapter: c51,
      number: 149,
      new: false)

    puts 'creating article 150'
    a150 = Article.create!(content: 'Los Diputados actuarán en interés de la Nación y representan en la Asamblea Nacional a sus respectivos partidos políticos y a los electores de su Circuito Electoral.',
      chapter: c51,
      number: 150,
      new: false)

    puts 'creating article 151'
    a151 = Article.create!(content: 'Los partidos políticos podrán revocar el mandato de los Diputados Principales o Suplentes que hayan postulado, para lo cual cumplirán los siguientes requisitos y formalidades:',
      chapter: c51,
      number: 151,
      new: false)

      puts 'creating subarticles for article 151'
      sa151001 = Subarticle.create!(content: "Las causales de revocatoria y el procedimiento aplicable deberán estar previstos en los estatutos del partido.",
        article: a151,
        number: 1)

      puts 'creating subarticles for article 151'
      sa151002 = Subarticle.create!(content: "Las causales deberán referirse a violaciones graves de los estatutos y de la plataforma ideológica, política o programática del partido y haber sido aprobados mediante resolución dictada por el Tribunal Electoral con anterioridad a la fecha de postulación.",
        article: a151,
        number: 2)

      puts 'creating subarticles for article 151'
      sa151003 = Subarticle.create!(content: "También es causal de revocatoria que el Diputado o Suplente haya sido condenado por delito doloso con pena privativa de la libertad de cinco años o más, mediante sentencia ejecutoriada, proferida por un tribunal de justicia.",
        article: a151,
        number: 3)

      puts 'creating subarticles for article 151'
      sa151004 = Subarticle.create!(content: "El afectado tendrá derecho, dentro de su partido, a ser oído y a defenderse en dos instancias.",
        article: a151,
        number: 4)

      puts 'creating subarticles for article 151'
      sa151005 = Subarticle.create!(content: "La decisión del partido en la que se adopte la revocatoria de mandato estará sujeta a recurso del cual conocerá privativamente el Tribunal Electoral y que tendrá efecto suspensivo.",
        article: a151,
        number: 5)

      puts 'creating subarticles for article 151'
      sa151006 = Subarticle.create!(content: "Para la aplicación de la revocatoria de mandato, los partidos políticos podrán establecer, previo al inicio del proceso, mecanismos de consulta popular con los electores del circuito correspondiente.",
        article: a151,
        number: 6)

      # continua parrafo del articulo
      puts 'creating subarticles for article 151'
      sa00151 = Subarticle.create!(content: "Los partidos políticos también podrán, mediante proceso sumario, revocar el mandato de los Diputados Principales y Suplentes que hayan renunciado a su partido.",
        article: a151,
        number: 2000)

      sa00151 = Subarticle.create!(content: "Los electores de un circuito electoral podrán solicitar al Tribunal Electoral revocar el mandato de los Diputados Principales o Suplentes de libre postulación que hayan elegido, para lo cual cumplirán los requisitos y formalidades establecidas en la Ley.",
        article: a151,
        number: 2001)

    puts 'creating article 152'
    a152 = Article.create!(content: 'Se denominarán sesiones judiciales las dedicadas al ejercicio de las atribuciones jurisdiccionales de la Asamblea Nacional, sea cual fuere el tiempo en que se celebren y la forma como dicha Asamblea Nacional hubiere sido convocada. Su celebración no alterará la continuidad y la duración de una legislatura, y sólo terminarán cuando la Asamblea hubiese fallado la causa pendiente. Para ejercer funciones jurisdiccionales, la Asamblea Nacional podrá reunirse por derecho propio, sin previa convocatoria.',
      chapter: c51,
      number: 152,
      new: false)

    puts 'creating article 153'
    a153 = Article.create!(content: 'Para ser Diputado se requiere:',
      chapter: c51,
      number: 153,
      new: false)

      puts 'creating subarticles for article 153'
      sa153001 = Subarticle.create!(content: "Ser panameño por nacimiento, o por naturalización con quince años de residencia en el país después de haber obtenido la nacionalización.",
        article: a153,
        number: 1)

      puts 'creating subarticles for article 153'
      sa153002 = Subarticle.create!(content: "Ser ciudadano en ejercicio.",
        article: a153,
        number: 2)

      puts 'creating subarticles for article 153'
      sa153003 = Subarticle.create!(content: "Haber cumplido por lo menos veintiún años de edad a la fecha de la elección.",
        article: a153,
        number: 3)

      puts 'creating subarticles for article 153'
      sa153004 = Subarticle.create!(content: "No haber sido condenado por delito doloso con pena privativa de la libertad de cinco años o más, mediante sentencia ejecutoriada, proferida por un tribunal de justicia.",
        article: a153,
        number: 4)

      puts 'creating subarticles for article 153'
      sa153005 = Subarticle.create!(content: "Ser residente del circuito electoral correspondiente, por lo menos un año inmediatamente anterior a la postulación.",
        article: a153,
        number: 5)

      puts 'creating metadata for article 153'
      m153 = Metadatum.create!(content: "Para ser Diputado se requiere:",
        article: a153)

      # esta es la lista para el articulo 153 modificado
      puts 'creating metadata subarticles for article 153'
      msa153001 = MetadatumSubarticle.create!(content: "Ser panameño por nacimiento, o por naturalización con quince años de residencia en cl país después de haber obtenido la nacionalización.",
        metadatum: m153,
        number: 1)

      puts 'creating metadata subarticles for article 153'
      msa153002 = MetadatumSubarticle.create!(content: "Ser ciudadano en ejercicio.",
        metadatum: m153,
        number: 2)

      puts 'creating metadata subarticles for article 153'
      msa153003 = MetadatumSubarticle.create!(content: "Haber cumplido por lo menos veintiún años de edad a la fecha de la elección.",
        metadatum: m153,
        number: 3)

      puts 'creating metadata subarticles for article 153'
      msa153004 = MetadatumSubarticle.create!(content: "No haber sido condenado por delito doloso, mediante sentencia ejecutoriada, proferida por un tribunal de justicia.",
        metadatum: m153,
        number: 4)

      puts 'creating metadata subarticles for article 153'
      msa153005 = MetadatumSubarticle.create!(content: "Ser residente del circuito electoral correspondiente, por lo menos un año inmediatamente anterior a la postulación.",
        metadatum: m153,
        number: 5)

    puts 'creating article 154'
    a154 = Article.create!(content: 'Los miembros de la Asamblea Nacional no son legalmente responsables por las opiniones y votos que emitan en el ejercicio de su cargo.',
      chapter: c51,
      number: 154,
      new: false)

    puts 'creating article 155'
    a155 = Article.create!(content: 'Los miembros de la Asamblea Nacional podrán ser investigados y procesados por el Pleno de la Corte Suprema de Justicia, por la presunta comisión de algún acto delictivo o policivo, sin que para estos efectos se requiera autorización de la Asamblea Nacional. La detención preventiva o cualquier medida cautelar será determinada por el Pleno de la Corte Suprema de Justicia. /n
    El Diputado Principal o Suplente podrá ser demandado civilmente, pero no podrá decretarse secuestro u otra medida cautelar sobre su patrimonio, sin previa autorización del Pleno de la Corte Suprema de Justicia, con excepción de las medidas que tengan como fundamento asegurar el cumplimiento de obligaciones por Derecho de Familia y Derecho Laboral.',
      chapter: c51,
      number: 155,
      new: false)

      puts 'creating metadata for article 155'
      m155 = Metadatum.create!(content: "Los diputados, sin que para estos efectos se requiera autorización de la Asamblea Nacional, serán investigados por el Procurador General de la Nación, juzgados en primera Instancia por tres Magistrados de la Corte Suprema de Justicia, cuyo fallo es recurrible ante el pleno de la Corte Suprema de Justicia. Actuará como Juez de garantía un magistrado de la sala penal.  /n
      Las medidas cautelares solicitadas por el Procurador General de la Nación serán autorizadas por el juez de garantías, cuyas decisiones serán recurribles ante el pleno de la Corte Suprema de Justicia. La Ley regulará la materia. /n
      Los diputados podrán ser demandados civilmente, pero no podrá decretarse secuestro u otra medida cautelar sobre sus patrimonios, sin previa autorización del Pleno de la Corte Suprema de Justicia, con excepción de las medidas que tengan como fundamento asegurar el cumplimiento de obligaciones por Derecho de Familia y Derecho Laboral.",
        article: a155)

    puts 'creating article 156'
    a156 = Article.create!(content: 'Los Diputados principales y suplentes, cuando estos últimos estén ejerciendo el cargo, no podrán aceptar ningún empleo público remunerado. /n
    Si lo hicieren, se producirá la vacante absoluta del cargo de Diputado principal o suplente, según sea el caso. Se exceptúan los nombramientos de Ministro, Viceministro, Director General o Gerente de entidades autónomas o semiautónomas y Agentes Diplomáticos, cuya aceptación sólo produce vacante transitoria por el tiempo en que se desempeñe el cargo. El ejercicio de los cargos de maestro o profesor en centros de educación oficial o particular es compatible con la calidad de Diputado.',
      chapter: c51,
      number: 156,
      new: false)

      puts 'creating metadata for article 156'
      m156 = Metadatum.create!(content: "Los diputados no podrán aceptar ningún empleo público ni privado remunerado. Si lo hicieren, se producirá la vacante del cargo de diputado y ocupará el cargo el suplente.  /n
      El ejercicio de cargos académicos y de enseñanza en centros de educación oficial o particular, fuera de su horario de trabajo en la Asamblea, es compatible con la calidad de diputado.",
        article: a156)

    puts 'creating article 157'
    a157 = Article.create!(content: 'Los Diputados devengarán los emolumentos que señale la Ley, los cuales serán imputables al Tesoro Nacional, pero su aumento sólo será efectivo después de terminar el período de la Asamblea Nacional que lo hubiere aprobado.',
      chapter: c51,
      number: 157,
      new: false)

    puts 'creating article 158'
    a158 = Article.create!(content: 'Los Diputados no podrán hacer por sí mismos, ni por interpuestas personas, contrato alguno con Órganos del Estado o con instituciones o empresas vinculadas a este, ni admitir de nadie poder para gestionar negocios ante esos Órganos, instituciones o empresas.  /n
    Quedan exceptuados los casos siguientes:',
      chapter: c51,
      number: 158,
      new: false)

      puts 'creating subarticles for article 158'
      sa158001 = Subarticle.create!(content: "Cuando el Diputado hace uso personal o profesional de servicios públicos o efectúe operaciones corrientes de la misma índole con instituciones o empresas vinculadas al Estado.",
        article: a158,
        number: 1)

      puts 'creating subarticles for article 158'
      sa158002 = Subarticle.create!(content: "Cuando se trate de contratos con cualesquiera de los Órganos o entidades mencionados en este artículo, mediante licitación, por sociedades que no tengan el carácter de anónimas y de las cuales sea socio un Diputado, siempre que la participación de este en aquellas sea de fecha anterior a su elección para el cargo.",
        article: a158,
        number: 2)

      puts 'creating subarticles for article 158'
      sa158003 = Subarticle.create!(content: "Cuando, mediante licitación o sin ella, celebran contratos con tales Órganos o entidades, sociedades anónimas de las cuales no pertenezca un total de más de veinte por ciento de acciones del capital social, a uno o más Diputados.",
        article: a158,
        number: 3)

      puts 'creating subarticles for article 158'
      sa158004 = Subarticle.create!(content: "Cuando el Diputado actúe en ejercicio de la profesión de abogado ante el Órgano Judicial, fuera del período de sesiones o dentro de este mediante licencia concedida por el Pleno de la Asamblea Nacional.",
        article: a158,
        number: 4)

      puts 'creating subarticles for article 158'
      sa158004 = Subarticle.create!(content: "Queda exceptuado el caso cuando el Diputado hace uso personal o profesional de servicios públicos o efectúe operaciones corrientes de la misma índole con instituciones o empresas vinculadas al Estado.",
        article: a158,
        number: 2000)

      puts 'creating metadata for article 158'
      m158 = Metadatum.create!(content: "Los Diputados no podrán:",
        article: a158)

      # esta es la lista para el articulo 158 modificado
      puts 'creating metadata subarticles for article 158'
      msa158001 = MetadatumSubarticle.create!(content: "Ejecutar obras públicas ni partidas presupuestarias por sí mismos, ni por interpuestas personas, incluyendo organizaciones sin fines de lucro, o a través de entidades públicas.",
        metadatum: m158,
        number: 1)

      puts 'creating metadata subarticles for article 158'
      msa158002 = MetadatumSubarticle.create!(content: "Hacer por sí mismos, ni por interpuestas personas naturales o jurídicas, contrato alguno con Órganos del Estado o con instituciones o empresas vinculadas a este, ni admitir de nadie poder para gestionar negocios ante esos Órganos, instituciones o empresas.",
        metadatum: m158,
        number: 2)

      # continua parrafo del articulo
      puts 'creating subarticles for article 158'
      msa00158 = Subarticle.create!(content: "Queda exceptuado el caso cuando el Diputado hace uso personal o profesional de servicios públicos o efectúe operaciones corrientes de la misma índole con instituciones o empresas vinculadas al Estado.",
        article: a158,
        number: 158)

    puts 'creating article 159'
    a159 = Article.create!(content: 'La función legislativa, es ejercida por medio de la Asamblea Nacional y consiste en expedir las leyes necesarias para el cumplimiento de los fines y el ejercicio de las funciones del Estado declaradas en esta Constitución y en especial para lo siguiente:',
      chapter: c51,
      number: 159,
      new: false)

      puts 'creating subarticles for article 159'
      sa159001 = Subarticle.create!(content: "Expedir, modificar, reformar o derogar los Códigos Nacionales.",
        article: a159,
        number: 1)

      puts 'creating subarticles for article 159'
      sa159002 = Subarticle.create!(content: "Expedir la Ley general de sueldos propuesta por el Órgano Ejecutivo.",
        article: a159,
        number: 2)

      puts 'creating subarticles for article 159'
      sa159003 = Subarticle.create!(content: "Aprobar o desaprobar, antes de su ratificación, los tratados y los convenios internacionales que celebre el Órgano Ejecutivo.",
        article: a159,
        number: 3)

      puts 'creating subarticles for article 159'
      sa159004 = Subarticle.create!(content: "Intervenir en la aprobación del Presupuesto del Estado, según lo establece el Título IX de esta Constitución.",
        article: a159,
        number: 4)

      puts 'creating subarticles for article 159'
      sa159005 = Subarticle.create!(content: "Declarar la guerra y facultar al Órgano Ejecutivo para asegurar y concertar la paz.",
        article: a159,
        number: 5)

      puts 'creating subarticles for article 159'
      sa159006 = Subarticle.create!(content: "Decretar amnistía por delitos políticos.",
        article: a159,
        number: 6)

      puts 'creating subarticles for article 159'
      sa159007 = Subarticle.create!(content: "Establecer o reformar la división política del territorio nacional.",
        article: a159,
        number: 7)

      puts 'creating subarticles for article 159'
      sa159008 = Subarticle.create!(content: "Determinar la Ley, el peso, valor, forma, tipo y denominación de la moneda nacional.",
        article: a159,
        number: 8)

      puts 'creating subarticles for article 159'
      sa159009 = Subarticle.create!(content: "Disponer sobre la aplicación de los bienes nacionales a usos públicos.",
        article: a159,
        number: 9)

      puts 'creating subarticles for article 159'
      sa1590010 = Subarticle.create!(content: "Establecer impuestos y contribuciones nacionales, rentas y monopolios oficiales para atender los servicios públicos.",
        article: a159,
        number: 10)

      puts 'creating subarticles for article 159'
      sa1590011 = Subarticle.create!(content: "Dictar las normas oficiales o específicas a las cuales deben sujetarse el Órgano Ejecutivo, las entidades autónomas y semiautónomas, las empresas estatales y mixtas cuando, con respecto a estas últimas, el Estado tenga su control administrativo, financiero o accionario, para los siguientes efectos: negociar y contratar empréstitos; organizar el crédito público; reconocer la deuda nacional y arreglar su servicio; fijar y modificar los aranceles, tasas y demás disposiciones concernientes al régimen de aduanas.",
        article: a159,
        number: 11)

      puts 'creating subarticles for article 159'
      sa1590012 = Subarticle.create!(content: "Determinar, a propuesta del Órgano Ejecutivo, la estructura de la administración nacional mediante la creación de Ministerios, Entidades Autónomas, Semiautónomas, Empresas Estatales y demás establecimientos públicos, y distribuir entre ellos las funciones y negocios de la Administración, con el fin de asegurar la eficacia de las funciones administrativas.",
        article: a159,
        number: 12)

      puts 'creating subarticles for article 159'
      sa1590013 = Subarticle.create!(content: "Organizar los servicios públicos establecidos en esta Constitución; expedir o autorizar la expedición del Pacto Social y los Estatutos de las sociedades de economía mixta y las Leyes orgánicas de las empresas industriales o comerciales del Estado, así como dictar las normas correspondientes a las carreras previstas en el TÍTULO XI.",
        article: a159,
        number: 13)

      puts 'creating subarticles for article 159'
      sa1590014 = Subarticle.create!(content: "Decretar las normas relativas a la celebración de contratos en los cuales sea parte o tenga interés el Estado o algunas de sus entidades o empresas.",
        article: a159,
        number: 14)

      puts 'creating subarticles for article 159'
      sa1590015 = Subarticle.create!(content: "Aprobar o improbar los contratos en los cuales sea parte o tenga interés el Estado o alguna de sus entidades o empresas, si su celebración no estuviere reglamentada previamente conforme al numeral catorce o si algunas estipulaciones contractuales no estuvieren ajustadas a la respectiva Ley de autorizaciones.",
        article: a159,
        number: 15)

      puts 'creating subarticles for article 159'
      sa1590016 = Subarticle.create!(content: "Conceder al Órgano Ejecutivo, cuando éste lo solicite, y siempre que la necesidad lo exija, facultades extraordinarias precisas, que serán ejercidas durante el receso de la Asamblea Nacional, mediante Decretos Leyes. /n
      La Ley en que se confieran dichas facultades expresará específicamente la materia y los fines que serán objeto de los Decretos-Leyes y no podrá comprender las materias previstas en los numerales tres, cuatro y diez de este artículo, ni el desarrollo de las garantías fundamentales, el sufragio, el régimen de los partidos y la tipificación de delitos y sanciones. La Ley de facultades extraordinarias expira al iniciarse la legislatura ordinaria subsiguiente. /n
      Todo Decreto-Ley que el Ejecutivo expida en el ejercicio de las facultades que se le confieren, deberá ser sometido al Órgano Legislativo para que legisle sobre la materia en la legislatura ordinaria inmediatamente siguiente a la promulgación del Decreto-Ley de que se trate. El Órgano Legislativo podrá en todo tiempo y a iniciativa propia derogar, modificar o adicionar sin limitación de materias los Decretos-Leyes así dictados.",
        article: a159,
        number: 16)

      puts 'creating subarticles for article 159'
      sa1590017 = Subarticle.create!(content: "Dictar el Reglamento Orgánico de su régimen interno.",
        article: a159,
        number: 2000)

    puts 'creating article 160'
    a160 = Article.create!(content: 'Es función judicial de la Asamblea Nacional conocer de las acusaciones o denuncias que se presenten contra el Presidente de la República y los Magistrados de la Corte Suprema de Justicia, y juzgarlos, si a ello diere lugar, por actos ejecutados en el ejercicio de sus funciones en perjuicio del libre funcionamiento del poder público o violatorios de esta Constitución o las leyes.',
      chapter: c51,
      number: 160,
      new: false)

      puts 'creating metadata for article 160'
      m160 = Metadatum.create!(content: "Es función judicial de la Asamblea Nacional conocer de las denuncias o querellas que se presenten contra el Presidente de la República, y juzgarlo, si a ello hubiere lugar, por actos ejecutados en el ejercicio de sus funciones en perjuicio del libre funcionamiento del poder público o violatorio de esta Constitución o las leyes.",
        article: a160)

    puts 'creating article 161'
    a161 = Article.create!(content: 'Son funciones administrativas de la Asamblea Nacional:',
      chapter: c51,
      number: 161,
      new: false)

      puts 'creating subarticles for article 161'
      sa161001 = Subarticle.create!(content: "Examinar las credenciales de sus propios miembros y decidir si han sido expedidas en la forma que prescribe la Ley.",
        article: a161,
        number: 1)

      puts 'creating subarticles for article 161'
      sa161002 = Subarticle.create!(content: "Admitir o rechazar la renuncia del Presidente y del Vicepresidente de la República.",
        article: a161,
        number: 2)

      puts 'creating subarticles for article 161'
      sa161003 = Subarticle.create!(content: "Conceder licencia al Presidente de la República cuando se la solicite, y autorizarlo para ausentarse del territorio nacional, conforme a lo dispuesto en esta Constitución.",
        article: a161,
        number: 3)

      puts 'creating subarticles for article 161'
      sa161004 = Subarticle.create!(content: "Aprobar o improbar los nombramientos de los Magistrados de la Corte Suprema de Justicia, del Procurador General de la Nación, del Procurador de la Administración y los demás que haga el Ejecutivo y que, por disposición de esta Constitución o la Ley, requieran la ratificación de la Asamblea Nacional. Los funcionarios que requieran ratificación no podrán tomar posesión de su cargo hasta tanto sean ratificados.",
        article: a161,
        number: 4)

      puts 'creating subarticles for article 161'
      sa161005 = Subarticle.create!(content: "Nombrar al Contralor General de la República, al Subcontralor de la República, al Defensor del Pueblo, al Magistrado del Tribunal Electoral y al suplente que le corresponde conforme a esta Constitución.",
        article: a161,
        number: 5)

      puts 'creating subarticles for article 161'
      sa161006 = Subarticle.create!(content: "Nombrar, con sujeción a lo previsto en esta Constitución y en el Reglamento Interno, las comisiones permanentes de la Asamblea Nacional y las comisiones de investigación sobre cualquier asunto de interés público, para que informen al Pleno a fin de que dicte las medidas que considere apropiadas.",
        article: a161,
        number: 6)

      puts 'creating subarticles for article 161'
      sa161007 = Subarticle.create!(content: "Dar votos de censura contra los Ministros de Estado cuando estos, a juicio de la Asamblea Nacional, sean responsables de actos atentatorios o ilegales, o de errores graves que hayan causado perjuicio a los intereses del Estado. Para que el voto de censura sea exequible se requiere que sea propuesto por escrito con seis días de anticipación a su debate, por no menos de la mitad de los Diputados, y aprobado con el voto de las dos terceras partes de la Asamblea. La Ley establecerá la sanción que corresponda.",
        article: a161,
        number: 7)

      puts 'creating subarticles for article 161'
      sa16108 = Subarticle.create!(content: "Examinar y aprobar o deslindar responsabilidades sobre la Cuenta General del Tesoro que el Ejecutivo le presente, con el concurso del Contralor General de la República. /n
      Con ese propósito, el Ministro del ramo presentará personalmente ante el Pleno de la Asamblea Nacional la Cuenta General del Tesoro, en marzo de cada año. El Reglamento Interno de la Asamblea Nacional dispondrá lo concerniente a esa comparecencia y a la votación de la Cuenta del Tesoro presentada por el Órgano Ejecutivo.",
        article: a161,
        number: 8)

      puts 'creating subarticles for article 161'
      sa161009 = Subarticle.create!(content: "Citar o requerir a los funcionarios que nombre o ratifique el Órgano Legislativo, a los Ministros de Estado, a los Directores Generales o Gerentes de todas las entidades autónomas, semiautónomas, organismos descentralizados, empresas industriales o comerciales del Estado, así como a los de las empresas mixtas a las que se refiere el numeral 11 del artículo 159, para que rindan los informes verbales o escritos sobre las materias propias de su competencia, que la Asamblea Nacional requiera para el mejor desempeño de sus funciones o para conocer los actos de la Administración, salvo lo dispuesto en el numeral 7 del artículo 163. Cuando los informes deban ser verbales, las citaciones se harán con anticipación no menor de cuarenta y ocho horas y se formulará en cuestionario escrito y específico. Los funcionarios que hayan de rendir el informe deberán concurrir y ser oídos en la sesión para la cual fueron citados, sin perjuicio de que el debate continúe en sesiones posteriores por decisión de la Asamblea Nacional. Tal debate no podrá extenderse a asuntos ajenos al cuestionario específico.",
        article: a161,
        number: 9)

      puts 'creating subarticles for article 161'
      sa1610010 = Subarticle.create!(content: "Rehabilitar a los que hayan perdido derechos inherentes a la ciudadanía.",
        article: a161,
        number: 10)

      puts 'creating subarticles for article 161'
      sa1610011 = Subarticle.create!(content: "Aprobar, reformar o derogar el decreto de estado de urgencia y la suspensión de las garantías constitucionales, conforme a lo dispuesto en esta Constitución.",
        article: a161,
        number: 11)

    puts 'creating article 162'
    a162 = Article.create!(content: 'Todas las Comisiones de la Asamblea Nacional serán elegidas por ésta mediante un sistema que garantice la representación proporcional de la minoría.',
      chapter: c51,
      number: 162,
      new: false)

    puts 'creating article 163'
    a163 = Article.create!(content: 'Es prohibido a la Asamblea Nacional:',
      chapter: c51,
      number: 163,
      new: false)

      puts 'creating subarticles for article 163'
      sa163001 = Subarticle.create!(content: "Expedir leyes que contraríen la letra o el espíritu de esta Constitución.",
        article: a163,
        number: 1)

      puts 'creating subarticles for article 163'
      sa163002 = Subarticle.create!(content: "Inmiscuirse por medio de resoluciones en asuntos que son de la privativa competencia de los otros Órganos del Estado.",
        article: a163,
        number: 2)

      puts 'creating subarticles for article 163'
      sa163003 = Subarticle.create!(content: "Reconocer a cargo del Tesoro Público indemnizaciones que no hayan sido previamente declaradas por las autoridades competentes y votar partidas para pagar becas, pensiones, jubilaciones, gratificaciones o erogaciones que no hayan sido decretadas conforme a las leyes generales preexistentes.",
        article: a163,
        number: 3)

      puts 'creating subarticles for article 163'
      sa163004 = Subarticle.create!(content: "Decretar actos de proscripción o persecución contra personas o corporaciones.",
        article: a163,
        number: 4)

      puts 'creating subarticles for article 163'
      sa163005 = Subarticle.create!(content: "Incitar o compeler a los funcionarios públicos para que adopten determinadas medidas.",
        article: a163,
        number: 5)

      puts 'creating subarticles for article 163'
      sa163006 = Subarticle.create!(content: "Hacer nombramientos distintos de los que les correspondan de acuerdo con esta Constitución y las leyes.",
        article: a163,
        number: 6)

      puts 'creating subarticles for article 163'
      sa163007 = Subarticle.create!(content: "Exigir al Órgano Ejecutivo comunicación de las instrucciones dadas a los Agentes Diplomáticos o informes sobre negociaciones que tengan carácter reservado.",
        article: a163,
        number: 7)

      puts 'creating subarticles for article 163'
      sa163008 = Subarticle.create!(content: "Ordenar o autorizar otras partidas y programas no previstos en el Presupuesto General del Estado, salvo en casos de emergencia así declarados expresamente por el Órgano Ejecutivo.",
        article: a163,
        number: 8)

      puts 'creating subarticles for article 163'
      sa163009 = Subarticle.create!(content: "Delegar cualquiera de las funciones que le correspondan, salvo lo previsto en el numeral 16 del artículo 159.",
        article: a163,
        number: 9)

      puts 'creating subarticles for article 163'
      sa1630010 = Subarticle.create!(content: "Dar votos de aplauso o de censura respecto de actos del Presidente de la República.",
        article: a163,
        number: 10)

    # articulo nuevo 3. debe venir despues del 163 con ese titulo
    puts 'creating article 163'
    a163 = Article.create!(content: "Toda denuncia o querella que se presente contra los Magistrados del Tribunal Constitucional será investigada por el Procurador General de la Nación. /n
      En caso de ser acusado, el Magistrado será procesado, en primera instancia, por una Comisión especial de la Asamblea Nacional, que se compondrá de nueve (9) miembros, la cual no ejercerá ninguna otra función y tomará todas sus decisiones por el voto de cinco (5) de sus miembros. /n
      La sentencia condenatoria dictada por dicha comisión será recurrible ante la Asamblea Nacional, sin la participación de los diputados que hayan integrado la referida comisión En estos procesos actuará como juez de garantías el diputado designado por la referida comisión. /n
      Cualquier medida cautelar solicitada por el Procurador General será autorizada por el juez de garantías, cuyas decisiones serán recurribles ante la mencionada Comisión especial de la Asamblea Nacional.",
      chapter: c51,
      number: 163.3,
      new: true)


  puts 'creating chapter 2'
  c52 = Chapter.create!(number: 2,
    description: "Formación de Leyes",
    title: t5,
    new: true)

    puts 'creating article 164'
    a164 = Article.create!(content: 'Las Leyes tienen su origen en la Asamblea Nacional y se dividen así:',
      chapter: c52,
      number: 164,
      new: false)

      # esta lista debe ser del tipo a b c
      puts 'creating subarticles for article 164'
      sa164001 = Subarticle.create!(content: "Orgánicas, las que se expidan en cumplimiento de los numerales 1, 2, 3, 4, 7, 8, 9, 10, 11, 12, 13, 14, 15 y 16 del artículo 159.",
        article: a164,
        number: 1)

      puts 'creating subarticles for article 164'
      sa164002 = Subarticle.create!(content: "Ordinarias, las que se expidan en relación con los demás numerales de dicho artículo.",
        article: a164,
        number: 2)

    puts 'creating article 165'
    a165 = Article.create!(content: 'Las leyes serán propuestas:',
      chapter: c52,
      number: 165,
      new: false)

      puts 'creating subarticles for article 165'
      sa165001 = Subarticle.create!(content: "Cuando sean orgánicas:",
        article: a165,
        number: 1)



      # aqui comienza una subsubsublista con letras.


      puts 'creating subarticles for article 165'
      ssa165001a = Subsubarticle.create!(content: "Por Comisiones Permanentes de la Asamblea Nacional.",
        subarticle: sa165001,
        number: 1)

      puts 'creating subarticles for article 165'
      ssa165001b = Subsubarticle.create!(content: "Por los Ministros de Estado, en virtud de autorización del Consejo de Gabinete.",
        subarticle: sa165001,
        number: 2)

      puts 'creating subarticles for article 165'
      ssa165001c = Subsubarticle.create!(content: "Por la Corte Suprema de Justicia, el Procurador General de la Nación y el Procurador de la Administración, siempre que se trate de la expedición o reformas de los Códigos Nacionales.",
        subarticle: sa165001,
        number: 3)

      puts 'creating subarticles for article 165'
      ssa165001d = Subsubarticle.create!(content: "Por el Tribunal Electoral cuando se trate de materia de su competencia.",
        subarticle: sa165001,
        number: 4)

      # aqui termina la subsubsublista con letras.


      puts 'creating subarticles for article 165'
      sa165002 = Subarticle.create!(content: "Cuando sean ordinarias:",
        article: a165,
        number: 2)


      # aqui empieza una subsubsublista con letras.

      puts 'creating subarticles for article 165'
      ssa165002a = Subsubarticle.create!(content: "Por cualquier miembro de la Asamblea Nacional.",
        subarticle: sa165002,
        number: 1)

      puts 'creating subarticles for article 165'
      ssa165002b = Subsubarticle.create!(content: "Por los Ministros de Estado, en virtud de autorización del Consejo de Gabinete.",
        subarticle: sa165002,
        number: 2)

      puts 'creating subarticles for article 165'
      ssa165002c = Subsubarticle.create!(content: "Por los Presidentes de los Concejos Provinciales, con autorización del Concejo Provincial.",
        subarticle: sa165002,
        number: 3)

      # aqui termina la subsubsublista con letras.


      # continua parrafo del articulo
      puts 'creating subarticles for article 165'
      sa00165 = Subarticle.create!(content: "Todos los funcionarios antes mencionados tendrán derecho a voz en las sesiones de la Asamblea Nacional. En el caso de los Presidentes de los Concejos Provinciales y de los Magistrados del Tribunal Electoral, tendrán derecho a voz cuando se trate de proyectos de leyes presentados por ellos.",
        article: a165,
        number: 2000)

      puts 'creating subarticles for article 165'
      sa00166 = Subarticle.create!(content: "Las leyes orgánicas necesitan para su expedición el voto favorable en segundo y tercer debates, de la mayoría absoluta de los miembros de la Asamblea Nacional.",
        article: a165,
        number: 2001)

      puts 'creating subarticles for article 165'
      sa00167 = Subarticle.create!(content: "Las ordinarias solo requerirán la aprobación de la mayoría de los Diputados asistentes a las sesiones correspondientes.",
        article: a165,
        number: 2002)

    puts 'creating article 166'
    a166 = Article.create!(content: 'Ningún proyecto será Ley de la República si no ha sido aprobado por la Asamblea Nacional en tres debates, en días distintos y sancionado por el Ejecutivo en la forma que dispone esta Constitución. /n
    Es primer debate de todo proyecto de Ley el que se le da en la Comisión de que trata el artículo anterior. /n
    Un proyecto de Ley puede pasar a segundo debate cuando la mayoría de la Asamblea Nacional, a solicitud de uno de sus miembros, revocare el dictamen de la Comisión y diere su aprobación al Proyecto.',
      chapter: c52,
      number: 166,
      new: false)

    puts 'creating article 167'
    a167 = Article.create!(content: 'Todo proyecto de Ley que no hubiere sido presentado por una de las Comisiones será pasado por el Presidente de la Asamblea Nacional a una Comisión ad-hoc para que lo estudie y discuta dentro de un término prudencial.',
      chapter: c52,
      number: 167,
      new: false)

    puts 'creating article 168'
    a168 = Article.create!(content: 'Aprobado un proyecto de Ley pasará al Ejecutivo, y si éste lo sancionare lo mandará a promulgar como Ley. En caso contrario, lo devolverá con objeciones a la Asamblea Nacional.',
      chapter: c52,
      number: 168,
      new: false)

    puts 'creating article 169'
    a169 = Article.create!(content: 'El Ejecutivo dispondrá de un término máximo de treinta días hábiles para devolver con objeciones cualquier proyecto.  /n
    Si el Ejecutivo una vez transcurrido el indicado término no hubiese devuelto el proyecto con objeciones no podrá dejar de sancionarlo y hacerlo promulgar.',
      chapter: c52,
      number: 169,
      new: false)

    puts 'creating article 170'
    a170 = Article.create!(content: 'El proyecto de Ley objetado en su conjunto por el Ejecutivo, volverá a la Asamblea Nacional, a tercer debate. Si lo fuera solo en parte, volverá a segundo, con el único fin de formular las objeciones formuladas. /n
    Si consideradas por la Asamblea Nacional las objeciones el proyecto fuere aprobado por los dos tercios de los Diputados que componen la Asamblea Nacional, el Ejecutivo lo sancionará y hará promulgar sin poder presentar nuevas objeciones. Si no obtuviere la aprobación de este número de Diputados, el proyecto quedará rechazado.',
      chapter: c52,
      number: 170,
      new: false)

    puts 'creating article 171'
    a171 = Article.create!(content: 'Cuando el Ejecutivo objetare un proyecto por inexequible y la Asamblea Nacional, por la mayoría expresada, insistiere en su adopción, aquél lo pasará a la Corte Suprema de Justicia para que decida sobre su inconstitucionalidad. El fallo de la Corte que declare el proyecto constitucional, obliga al Ejecutivo a sancionarlo y hacerlo promulgar.',
      chapter: c52,
      number: 171,
      new: false)

      puts 'creating metadata for article 171'
      m171 = Metadatum.create!(content: "Cuando el Ejecutivo objetare un proyecto por inexequible, y la Asamblea Nacional, por la mayoría expresada, insistiere en su adopción, aquéllo remitirá al Tribunal Constitucional para que decida sobre su exequibilidad. El fallo de dicho Tribunal que declare el proyecto exequible, obliga al Ejecutivo a sancionarlo y hacerlo promulgar.",
        article: a171)

    puts 'creating article 172'
    a172 = Article.create!(content: 'Si el Ejecutivo no cumpliere con el deber de sancionar y de hacer promulgar las Leyes, en los términos y según las condiciones que este Título establece, las sancionará y hará promulgar el Presidente de la Asamblea Nacional.',
      chapter: c52,
      number: 172,
      new: false)

    puts 'creating article 173'
    a173 = Article.create!(content: 'Toda Ley será promulgada dentro de los seis días hábiles que siguen al de su sanción y comenzará a regir desde su promulgación, salvo que ella misma establezca que rige a partir de una fecha posterior. La promulgación extemporánea de una Ley no determina su inconstitucionalidad.',
      chapter: c52,
      number: 173,
      new: false)

    # ASANBLEA NACIONAL DECRETA deberia ir centrado en bold o negrita
    puts 'creating article 174'
    a174 = Article.create!(content: 'Las Leyes podrán ser motivadas y al texto de ellas precederá la siguiente fórmula: /n
    LA ASAMBLEA NACIONAL /n
    DECRETA:',
      chapter: c52,
      number: 174,
      new: false)


puts "creating title 6"
t6 = Title.create!(number: 6,
  description: "EL ÓRGANO EJECUTIVO",
  legislation: l,
  new: false)

  puts 'creating chapter 1'
  c61 = Chapter.create!(number: 1,
    description: "Presidente y Vicepresidente de la República",
    title: t6,
    new: false)

    puts 'creating article 175'
    a175 = Article.create!(content: 'El Órgano Ejecutivo está constituido por el Presidente de la República y los Ministros de Estado, según las normas de esta Constitución.',
      chapter: c61,
      number: 175,
      new: false)

    puts 'creating article 176'
    a176 = Article.create!(content: 'El Presidente de la República ejerce sus funciones por sí solo o con la participación del Ministro del ramo respectivo, o con la de todos los Ministros en Consejo de Gabinete, o en cualquier otra forma que determine esta Constitución.',
      chapter: c61,
      number: 176,
      new: false)

    puts 'creating article 177'
    a177 = Article.create!(content: 'El Presidente de la República será elegido por sufragio popular directo y por la mayoría de votos, para un periodo de cinco años. Con el Presidente de la República será elegido, de la misma manera y por igual periodo, un Vicepresidente, quien lo reemplazará en sus faltas, conforme a lo prescrito en esta Constitución.',
      chapter: c61,
      number: 177,
      new: false)

    puts 'creating article 178'
    a178 = Article.create!(content: 'Los funcionarios que hayan sido elegidos Presidente o Vicepresidente no podrán ser reelegidos para el mismo cargo en los dos períodos presidenciales inmediatamente siguientes.',
      chapter: c61,
      number: 178,
      new: false)

    puts 'creating article 179'
    a179 = Article.create!(content: 'Para ser Presidente o Vicepresidente de la República se requiere:',
      chapter: c61,
      number: 179,
      new: false)

      puts 'creating subarticles for article 179'
      sa179001 = Subarticle.create!(content: "Ser panameño por nacimiento.",
        article: a179,
        number: 1)

      puts 'creating subarticles for article 179'
      sa179002 = Subarticle.create!(content: "Haber cumplido treinta y cinco años de edad.",
        article: a179,
        number: 2)

    puts 'creating article 180'
    a180 = Article.create!(content: 'No podrá ser elegido Presidente ni Vicepresidente de la República quien haya sido condenado por delito doloso con pena privativa de la libertad de cinco años o más, mediante sentencia ejecutoriada proferida por un tribunal de justicia.',
      chapter: c61,
      number: 180,
      new: false)

      puts 'creating metadata for article 180'
      m180 = Metadatum.create!(content: "No podrán ser elegidos Presidente ni Vicepresidente de la República quienes hayan sido condenados por delito doloso, mediante sentencia ejecutoriada proferida por un tribunal de justicia.",
        article: a180)

    puts 'creating article 181'
    a181 = Article.create!(content: 'El Presidente y el Vicepresidente de la República tomarán posesión de sus respectivos cargos, ante la Asamblea Nacional, el primer día del mes de julio siguiente al de su elección y prestarán juramento en estos términos: “Juro a Dios y a la Patria cumplir fielmente la Constitución y las leyes de la República”. /n
    El ciudadano que no profese creencia religiosa podrá prescindir de la invocación a Dios en su juramento.',
      chapter: c61,
      number: 181,
      new: false)

    puts 'creating article 182'
    a182 = Article.create!(content: 'Si por cualquier motivo el Presidente o el Vicepresidente de la República no pudiera tomar posesión ante la Asamblea Nacional, lo hará ante la Corte Suprema de Justicia; si esto no fuere posible, ante un Notario Público y, en defecto de este, ante dos testigos hábiles.',
      chapter: c61,
      number: 182,
      new: false)

    puts 'creating article 183'
    a183 = Article.create!(content: 'Son atribuciones que ejerce por si solo el Presidente de la República:',
      chapter: c61,
      number: 183,
      new: false)

      puts 'creating subarticles for article 183'
      sa183001 = Subarticle.create!(content: "Nombrar y separar libremente a los Ministros de Estado.",
        article: a183,
        number: 1)

      puts 'creating subarticles for article 183'
      sa183002 = Subarticle.create!(content: "Coordinar la labor de la administración y los establecimientos públicos.",
        article: a183,
        number: 2)

      puts 'creating subarticles for article 183'
      sa183003 = Subarticle.create!(content: "Velar por la conservación del orden público.",
        article: a183,
        number: 3)

      puts 'creating subarticles for article 183'
      sa183004 = Subarticle.create!(content: "Adoptar las medidas necesarias para que la Asamblea Legislativa se reúna el día señalado por la Constitución o el Decreto mediante el cual haya sido convocada a sesiones extraordinarias.",
        article: a183,
        number: 4)

      puts 'creating subarticles for article 183'
      sa183005 = Subarticle.create!(content: "Presentar al principio de cada legislatura, el primer día de sus sesiones ordinarias, un mensaje sobre los asuntos de la administración.",
        article: a183,
        number: 5)

      puts 'creating subarticles for article 183'
      sa183006 = Subarticle.create!(content: "Objetar los proyectos de Leyes por considerarlos inconvenientes o inexequibles.",
        article: a183,
        number: 6)

      puts 'creating subarticles for article 183'
      sa183007 = Subarticle.create!(content: "Invalidar las órdenes o disposiciones que dicte un Ministro de Estado en virtud del artículo 186.",
        article: a183,
        number: 7)

      puts 'creating subarticles for article 183'
      sa183008 = Subarticle.create!(content: "Las demás que le correspondan de conformidad con la Constitución o la Ley.",
        article: a183,
        number: 8)

    puts 'creating article 184'
    a184 = Article.create!(content: 'Son atribuciones que ejerce el Presidente de la República con la participación del Ministro respectivo:',
      chapter: c61,
      number: 184,
      new: false)

      puts 'creating subarticles for article 184'
      sa184001 = Subarticle.create!(content: "Sancionar y promulgar las Leyes, obedecerlas y velar por su exacto cumplimiento.",
        article: a184,
        number: 1)

      puts 'creating subarticles for article 184'
      sa184002 = Subarticle.create!(content: "Nombrar y separar los Directores y demás miembros de los servicios de policía y disponer el uso de estos servicios.",
        article: a184,
        number: 2)

      puts 'creating subarticles for article 184'
      sa184003 = Subarticle.create!(content: "Nombrar y separar libremente a los Gobernadores de las Provincias.",
        article: a184,
        number: 3)

      puts 'creating subarticles for article 184'
      sa184004 = Subarticle.create!(content: "Informar al Órgano Legislativo de las vacantes producidas en los cargos que éste debe proveer.",
        article: a184,
        number: 4)

      puts 'creating subarticles for article 184'
      sa184005 = Subarticle.create!(content: "Vigilar la recaudación y administración de las rentas nacionales.",
        article: a184,
        number: 5)

      puts 'creating subarticles for article 184'
      sa184006 = Subarticle.create!(content: "Nombrar, con arreglo a lo dispuesto en el Título XI, a las personas que deban desempeñar cualesquiera cargos o empleos nacionales cuya provisión no corresponda a otro funcionario o corporación.",
        article: a184,
        number: 6)

      puts 'creating subarticles for article 184'
      sa184007 = Subarticle.create!(content: "Enviar al Órgano Legislativo, dentro del primer mes de la primera legislatura anual, el Proyecto de Presupuesto General del Estado, salvo que la fecha de toma de posesión del Presidente de la República coincida con la iniciación de dichas sesiones. En este caso, el Presidente de la República deberá hacerlo dentro de los primeros cuarenta días de sesiones.",
        article: a184,
        number: 7)

      puts 'creating subarticles for article 184'
      sa184008 = Subarticle.create!(content: "Celebrar contratos administrativos para la prestación de servicios y ejecución de obras públicas, con arreglo a lo que disponga esta Constitución y la Ley.",
        article: a184,
        number: 8)

      puts 'creating subarticles for article 184'
      sa184009 = Subarticle.create!(content: "Dirigir las relaciones exteriores; celebrar tratados y convenios internacionales, los cuales serán sometidos a la consideración del Órgano Legislativo y acreditar y recibir agentes diplomáticos y consulares.",
        article: a184,
        number: 9)

      puts 'creating subarticles for article 184'
      sa1840010 = Subarticle.create!(content: "Dirigir, reglamentar e inspeccionar los servicios establecidos en esta Constitución.",
        article: a184,
        number: 10)

      puts 'creating subarticles for article 184'
      sa1840011 = Subarticle.create!(content: "Nombrar a los Jefes, Gerentes y Directores de las entidades públicas autónomas, semiautónomas y de las empresas estatales, según lo dispongan las Leyes respectivas.",
        article: a184,
        number: 11)

      puts 'creating subarticles for article 184'
      sa1840012 = Subarticle.create!(content: "Decretar indultos por delitos políticos, rebajar penas y conceder libertad condicional a los reos de delitos comunes.",
        article: a184,
        number: 12)

      puts 'creating subarticles for article 184'
      sa1840013 = Subarticle.create!(content: "Conferir ascenso a los miembros de los servicios de policía con arreglo al escalafón y a las disposiciones legales correspondientes.",
        article: a184,
        number: 13)

      puts 'creating subarticles for article 184'
      sa1840014 = Subarticle.create!(content: "Reglamentar las Leyes que lo requieran para su mejor cumplimiento, sin apartarse en ningún caso de su texto ni de su espíritu.",
        article: a184,
        number: 14)

      puts 'creating subarticles for article 184'
      sa1840015 = Subarticle.create!(content: "Conceder a los nacionales que lo soliciten permiso para aceptar cargos de gobiernos extranjeros, en los casos que sea necesario de acuerdo con la Ley.",
        article: a184,
        number: 15)

      puts 'creating subarticles for article 184'
      sa1840016 = Subarticle.create!(content: "Ejercer las demás atribuciones que le correspondan de acuerdo con esta Constitución y la Ley.",
        article: a184,
        number: 16)

    puts 'creating article 185'
    a185 = Article.create!(content: 'Son atribuciones que ejerce el Vicepresidente de la República:',
      chapter: c61,
      number: 185,
      new: false)

      puts 'creating subarticles for article 185'
      sa185001 = Subarticle.create!(content: "Reemplazar al Presidente de la República en caso de falta temporal o absoluta.",
        article: a185,
        number: 1)

      puts 'creating subarticles for article 185'
      sa185002 = Subarticle.create!(content: "Asistir con voz, pero sin voto, a las sesiones del Consejo de Gabinete.",
        article: a185,
        number: 2)

      puts 'creating subarticles for article 185'
      sa185003 = Subarticle.create!(content: "Asesorar al Presidente de la República en las materias que este determine.",
        article: a185,
        number: 3)

      puts 'creating subarticles for article 185'
      sa185004 = Subarticle.create!(content: "Asistir y representar al Presidente de la República en actos públicos y congresos nacionales o internacionales, o en misiones especiales que el Presidente le encomiende.",
        article: a185,
        number: 4)

    puts 'creating article 186'
    a186 = Article.create!(content: 'Los actos del Presidente de la República, salvo los que pueda ejercer por sí solo, no tendrán valor si no son refrendados por el Ministro de Estado respectivo, quien se hace responsable de ellos. /n
    Las órdenes y disposiciones que un Ministro de Estado expida por instrucciones del Presidente de la República son obligatorias y sólo podrán ser invalidadas por éste por ser contrarias a la Constitución o la Ley, sin perjuicio de los recursos a que haya lugar.',
      chapter: c61,
      number: 186,
      new: false)

    puts 'creating article 187'
    a187 = Article.create!(content: 'El Presidente y el Vicepresidente de la República podrán separarse de sus cargos mediante licencia que, cuando no exceda de noventa días, les será concedida por el Consejo de Gabinete. Para la separación por más de noventa días, se requerirá licencia de la Asamblea Nacional.  /n
    Durante el ejercicio de la licencia que se conceda al Presidente de la República para separarse de su cargo, este será reemplazado por el Vicepresidente de la República, quien tendrá el título de Encargado de la Presidencia de la República. /n
    Cuando por cualquier motivo las faltas del Presidente no pudieren ser llenadas por el Vicepresidente, ejercerá la Presidencia uno de los Ministros de Estado, que estos elegirán por mayoría de votos, quien debe cumplir los requisitos necesarios para ser Presidente de la República y tendrá el título de Ministro Encargado de la Presidencia de la República.  /n
    En los plazos señalados por este artículo y el siguiente se incluirán los días inhábiles.',
      chapter: c61,
      number: 187,
      new: false)

    puts 'creating article 188'
    a188 = Article.create!(content: 'El Presidente de la República podrá ausentarse del territorio nacional, en cada ocasión, sin pedir licencia de su cargo:',
      chapter: c61,
      number: 188,
      new: false)

     puts 'creating subarticles for article 188'
      sa188001 = Subarticle.create!(content: "Por un periodo máximo de hasta diez días, sin necesidad de autorización alguna.",
        article: a188,
        number: 1)

      puts 'creating subarticles for article 188'
      sa188002 = Subarticle.create!(content: "Por un periodo que exceda de diez días y no sea mayor de treinta días, con autorización del Consejo de Gabinete.",
        article: a188,
        number: 2)

      puts 'creating subarticles for article 188'
      sa188003 = Subarticle.create!(content: "Por un periodo mayor de treinta días, con la autorización de la Asamblea Nacional.",
        article: a188,
        number: 3)

      puts 'creating subarticles for article 188'
      sa00188 = Subarticle.create!(content: "Si el Presidente se ausentara por más de diez días, se encargará de la Presidencia el Vicepresidente y, en defecto de este, lo hará un Ministro de Estado, según lo establecido en esta Constitución. Quien ejerza el cargo tendrá el título de Encargado de la Presidencia de la República.",
        article: a188,
        number: 2000)

    puts 'creating article 189'
    a189 = Article.create!(content: 'Por falta absoluta del Presidente de la República, el Vicepresidente asumirá el cargo por el resto del periodo.  /n
    Cuando el Vicepresidente asuma el cargo de Presidente, ejercerá la vicepresidencia uno de los Ministros de Estado, que estos elegirán por mayoría de votos, quien debe cumplir los requisitos necesarios para ser Vicepresidente de la República. /n
    Cuando por cualquier motivo la falta absoluta del Presidente no pudiere ser llenada por el Vicepresidente, ejercerá la Presidencia uno de los Ministros de Estado, que estos elegirán por mayoría de votos, quien debe cumplir con los requisitos necesarios para ser Presidente de la República, y tendrá el título de Ministro Encargado de la Presidencia. /n
    Cuando la falta absoluta del Presidente y del Vicepresidente se produjera por lo menos dos años antes de la expiración del periodo presidencial, el Ministro Encargado de la Presidencia convocará a elecciones para Presidente y Vicepresidente en una fecha no posterior a cuatro meses, de modo que los ciudadanos electos tomen posesión dentro de los seis meses siguientes a la convocatoria, para el resto del periodo. El decreto respectivo será expedido a más tardar ocho días después de la asunción del cargo por dicho Ministro Encargado.',
      chapter: c61,
      number: 189,
      new: false)

    puts 'creating article 190'
    a190 = Article.create!(content: 'Los emolumentos que la Ley asigne al Presidente y al Vicepresidente de la República podrán ser modificados, pero el cambio entrará a regir en el período presidencial siguiente.',
      chapter: c61,
      number: 190,
      new: false)

    puts 'creating article 191'
    a191 = Article.create!(content: 'El Presidente y el Vicepresidente de la República sólo son responsables en los casos siguientes:',
      chapter: c61,
      number: 191,
      new: false)

     puts 'creating subarticles for article 191'
      sa191001 = Subarticle.create!(content: "Por extralimitación de sus funciones constitucionales.",
        article: a191,
        number: 1)

     puts 'creating subarticles for article 191'
      sa191002 = Subarticle.create!(content: "Por actos de violencia o coacción en el curso del proceso electoral; por impedir la reunión de la Asamblea Nacional; por obstaculizar el ejercicio de las funciones de esta o de los demás organismos o autoridades públicas que establece la Constitución.",
        article: a191,
        number: 2)

     puts 'creating subarticles for article 191'
      sa191003 = Subarticle.create!(content: "Por delitos contra la personalidad internacional del Estado o contra la Administración Pública.",
        article: a191,
        number: 3)

      puts 'creating subarticles for article 191'
      sa00191 = Subarticle.create!(content: "En los dos primeros casos, la pena será de destitución y de inhabilitación para ejercer cargo público por el término que fije la Ley. En el tercer caso, se aplicará el derecho común.",
        article: a191,
        number: 2000)

    puts 'creating article 192'
    a192 = Article.create!(content: 'No podrá ser elegido Presidente de la República:',
      chapter: c61,
      number: 192,
      new: false)

     puts 'creating subarticles for article 192'
      sa192001 = Subarticle.create!(content: "El ciudadano que llamado a ejercer la Presidencia por falta absoluta del titular, la hubiera ejercido en cualquier tiempo durante les tres años inmediatamente anteriores al periodo para el cual se hace la elección.",
        article: a192,
        number: 1)

     puts 'creating subarticles for article 192'
      sa192002 = Subarticle.create!(content: "Los parientes dentro del cuarto grado de consanguinidad o segundo de afinidad del Presidente de la República que haya ejercido sus funciones en el periodo inmediatamente anterior a los del ciudadano indicado en el numeral uno de este artículo.",
        article: a192,
        number: 2)

    puts 'creating article 193'
    a193 = Article.create!(content: 'No podrá ser elegido Vicepresidente de la República:',
      chapter: c61,
      number: 193,
      new: false)

     puts 'creating subarticles for article 193'
      sa193001 = Subarticle.create!(content: "El Presidente de la República que hubiere desempeñado sus funciones en cualquier tiempo, cuando la elección del Vicepresidente de la República sea para el periodo siguiente al suyo.",
        article: a193,
        number: 1)

     puts 'creating subarticles for article 193'
      sa193002 = Subarticle.create!(content: "Los parientes dentro del cuarto grado de consanguinidad o segundo de afinidad del Presidente de la República, para el período que sigue a aquel en que el Presidente de la República hubiere ejercido el cargo.",
        article: a193,
        number: 2)

     puts 'creating subarticles for article 193'
      sa193003 = Subarticle.create!(content: "El ciudadano que como Vicepresidente de la República hubiere ejercido el cargo de Presidente de la República en forma permanente en cualquier tiempo durante los tres años anteriores al período para el cual se hace la elección.",
        article: a193,
        number: 3)

     puts 'creating subarticles for article 193'
      sa193004 = Subarticle.create!(content: "Los parientes dentro del cuarto grado de consanguinidad y segundo de afinidad del ciudadano expresado en el numeral anterior para el período inmediatamente siguiente a aquél en que éste hubiere ejercido la Presidencia de la República.",
        article: a193,
        number: 4)

     puts 'creating subarticles for article 193'
      sa193005 = Subarticle.create!(content: "Los parientes dentro del cuarto grado de consanguinidad o segundo de afinidad del Presidente de la República.",
        article: a193,
        number: 5)

      puts 'creating metadata for article 193'
      m193 = Metadatum.create!(content: "No podrán ser elegidos Vicepresidentes de la República:",
        article: a193)

      puts 'creating metadata subarticles for article 193'
      msa193001 = MetadatumSubarticle.create!(content: "Los expresidentes, mientras no hayan transcurrido los dos (2) períodos presidenciales a que se refiere el artículo 178.",
        metadatum: m193,
        number: 1)

      puts 'creating metadata subarticles for article 193'
      msa193002 = MetadatumSubarticle.create!(content: "El Presidente de la República que hubiere desempeñado sus funciones en cualquier tiempo, cuando la elección del Vicepresidente de la República sea para el período siguiente al suyo.",
        metadatum: m193,
        number: 2)

      puts 'creating metadata subarticles for article 193'
      msa193003 = MetadatumSubarticle.create!(content: "El cónyuge y los parientes dentro del cuarto grado de consanguinidad o segundo de afinidad del Presidente de la República, para el período que sigue a aquel en que el Presidente de la República hubiere ejercido el cargo.",
        metadatum: m193,
        number: 3)

      puts 'creating metadata subarticles for article 193'
      msa193004 = MetadatumSubarticle.create!(content: "El ciudadano que corno Vicepresidente de la República hubiere ejercido el cargo de Presidente de la República en forma permanente en cualquier tiempo durante los tres (3) años anteriores al período para el cual se hace la elección.",
        metadatum: m193,
        number: 4)

      puts 'creating metadata subarticles for article 193'
      msa193005 = MetadatumSubarticle.create!(content: "El cónyuge y los parientes dentro del cuarto grado de consanguinidad o segundo de afinidad del ciudadano expresado en el numeral anterior para el período inmediatamente siguiente a aquél en que éste hubiere ejercido la Presidencia de la República.",
        metadatum: m193,
        number: 5)

      puts 'creating metadata subarticles for article 193'
      msa193006 = MetadatumSubarticle.create!(content: "El cónyuge y los parientes dentro del cuarto grado de consanguinidad o segundo de afinidad del Presidente de la República.",
        metadatum: m193,
        number: 6)


  puts 'creating chapter 2'
  c62 = Chapter.create!(number: 2,
    description: "Los Ministros de Estado",
    title: t6,
    new: false)

    puts 'creating article 194'
    a194 = Article.create!(content: 'Los Ministros de Estado son los jefes de sus respectivos ramos y participan con el Presidente de la República en el ejercicio de sus funciones, de acuerdo con esta Constitución y la Ley.',
      chapter: c62,
      number: 194,
      new: false)

    puts 'creating article 195'
    a195 = Article.create!(content: 'La distribución de los negocios entre los Ministros de Estado se efectuará de conformidad con la Ley, según sus finalidades.',
      chapter: c62,
      number: 195,
      new: false)

    puts 'creating article 196'
    a196 = Article.create!(content: 'Los Ministros de Estado deben ser panameños por nacimiento, haber cumplido veinticinco años de edad y no haber sido condenados por delito doloso con pena privativa de la libertad de cinco años o más, mediante sentencia ejecutoriada, proferida por un tribunal de justicia.',
      chapter: c62,
      number: 196,
      new: false)

    puts 'creating article 197'
    a197 = Article.create!(content: 'No podrán ser nombrados Ministros de Estado los parientes del Presidente de la República dentro del cuarto grado de consanguinidad o segundo de afinidad, ni ser miembros de un mismo Gabinete personas unidas entre sí por los expresados grados de parentesco.',
      chapter: c62,
      number: 197,
      new: false)

    puts 'creating article 198'
    a198 = Article.create!(content: 'Los Ministros de Estado entregarán personalmente a la Asamblea Nacional un informe o memoria anual sobre el estado de los negocios de su Ministerio y sobre las reformas que juzguen oportuno introducir.',
      chapter: c62,
      number: 198,
      new: false)


  puts 'creating chapter 3'
  c63 = Chapter.create!(number: 3,
    description: "El Consejo de Gabinete",
    title: t6,
    new: false)

    puts 'creating article 199'
    a199 = Article.create!(content: 'El Consejo de Gabinete es la reunión del Presidente de la República, quien lo presidirá, o del Encargado de la Presidencia, con el Vicepresidente de la República y los Ministros de Estado.',
      chapter: c63,
      number: 199,
      new: false)

    puts 'creating article 200'
    a200 = Article.create!(content: 'Son funciones del Consejo de Gabinete:',
      chapter: c63,
      number: 200,
      new: false)

     puts 'creating subarticles for article 200'
      sa200001 = Subarticle.create!(content: "Actuar como cuerpo consultivo en los asuntos que someta a su consideración el Presidente de la República y en los que deba ser oído por mandato de la Constitución o de la Ley.",
        article: a200,
        number: 1)

     puts 'creating subarticles for article 200'
      sa200002 = Subarticle.create!(content: "Acordar con el Presidente de la República los nombramientos de los Magistrados de la Corte Suprema de Justicia, del Procurador General de la Nación, del Procurador de la Administración, y de sus respectivos suplentes, con sujeción a la aprobación de la Asamblea Nacional.",
        article: a200,
        number: 2)

     puts 'creating subarticles for article 200'
      sa200003 = Subarticle.create!(content: "Acordar la celebración de contratos, la negociación de empréstitos y la enajenación de bienes nacionales muebles o inmuebles, según lo determine la Ley.",
        article: a200,
        number: 3)

     puts 'creating subarticles for article 200'
      sa200004 = Subarticle.create!(content: "Acordar con el Presidente de la República que este pueda transigir o someter a arbitraje los asuntos litigiosos en que el Estado sea parte, para lo cual es necesario el concepto favorable del Procurador General de la Nación. /n
      Este numeral no se aplicará a los convenios arbitrales pactados contractualmente por el Estado, los cuales tendrán eficacia por sí mismos.",
        article: a200,
        number: 4)

     puts 'creating subarticles for article 200'
      sa200005 = Subarticle.create!(content: "Decretar, bajo la responsabilidad colectiva de todos sus miembros, el estado de urgencia y la suspensión de las normas constitucionales pertinentes, de conformidad con lo dispuesto en el artículo 55 de esta Constitución.",
        article: a200,
        number: 5)

     puts 'creating subarticles for article 200'
      sa200006 = Subarticle.create!(content: "Requerir de los funcionarios públicos, entidades estatales y empresas mixtas los informes que estime necesarios o convenientes para el despacho de los asuntos que deba considerar y citar a los primeros y a los representantes de las segundas para que rindan informes verbales.",
        article: a200,
        number: 6)

     puts 'creating subarticles for article 200'
      sa200007 = Subarticle.create!(content: "Negociar y contratar empréstitos; organizar el crédito público; reconocer la deuda nacional y arreglar su servicio; fijar y modificar los aranceles, tasas y demás disposiciones concernientes al régimen de aduanas, con sujeción a las normas previstas en las Leyes a que se refiere el numeral 11 del artículo 159. Mientras el Órgano Legislativo no haya dictado Ley o Leyes que contengan las normas generales correspondientes, el Órgano Ejecutivo podrá ejercer estas atribuciones y enviará al Órgano Legislativo copia de todos los Decretos que dicte en ejercicio de esta facultad.",
        article: a200,
        number: 7)

     puts 'creating subarticles for article 200'
      sa200008 = Subarticle.create!(content: "Dictar el reglamento de su régimen interno y ejercer las demás funciones que le señale la Constitución o la Ley.",
        article: a200,
        number: 8)

      puts 'creating metadata for article 200'
      m200 = Metadatum.create!(content: "Son funciones del Consejo de Gabinete:",
        article: a200)

      puts 'creating metadata subarticles for article 200'
      msa200001 = MetadatumSubarticle.create!(content: "Actuar como cuerpo consultivo en los asuntos que someta a su consideración el Presidente de la República y en los que deba ser oído por mandato de la Constitución o de la Ley.",
        metadatum: m200,
        number: 1)

      puts 'creating metadata subarticles for article 200'
      msa200002 = MetadatumSubarticle.create!(content: "Acordar con el Presidente de la República, mediante el procedimiento dispuesto en esta Constitución, los nombramientos de los Magistrados de la Corte Suprema de Justicia, del Tribunal Constitucional, del Procurador General de la Nación, del Procurador de la Administración, de los Magistrados del Tribunal de Cuentas, del Magistrado del Tribunal Electoral que le corresponda y  6 del Fiscal General Electoral, y de sus respectivos suplentes, con sujeción a la aprobación de la Asamblea Nacional.",
        metadatum: m200,
        number: 2)

      puts 'creating metadata subarticles for article 200'
      msa200003 = MetadatumSubarticle.create!(content: "Acordar la celebración de contratos, la negociación de empréstitos y la enajenación de bienes nacionales muebles o inmuebles, según lo determine la Ley.",
        metadatum: m200,
        number: 3)

      puts 'creating metadata subarticles for article 200'
      msa200004 = MetadatumSubarticle.create!(content: "Acordar con el Presidente de la República que este pueda transigir o someter a arbitraje los asuntos litigiosos en que el Estado sea parte, para lo cual es necesario el concepto favorable del Procurador General de la Nación. Este numeral no se aplicará a los convenios arbitrales pactados contractualmente por el Estado, los cuales tendrán eficacia por si mismos.",
        metadatum: m200,
        number: 4)

      puts 'creating metadata subarticles for article 200'
      msa200005 = MetadatumSubarticle.create!(content: "Decretar, bajo la responsabilidad colectiva de todos sus miembros, el estado de urgencia y la suspensión de las normas constitucionales pertinentes, de conformidad con lo dispuesto en el artículo 55 de esta Constitución.",
        metadatum: m200,
        number: 5)

      puts 'creating metadata subarticles for article 200'
      msa200006 = MetadatumSubarticle.create!(content: "Requerir de los funcionarios públicos, entidades estatales y empresas mixtas los informes que estime necesarios o convenientes para el despacho de los asuntos que deba considerar y citar a los primeros y a los representantes de las segundas para que rindan informes verbales.",
        metadatum: m200,
        number: 6)

      puts 'creating metadata subarticles for article 200'
      msa200007 = MetadatumSubarticle.create!(content: "Contratar empréstitos; organizar el crédito público; reconocer la deuda nacional y arreglar su servicio; fijar y modificar los aranceles, tasas y demás disposiciones concernientes al régimen de aduanas, con sujeción a las normas previstas en las Leyes a que se refiere el numeral 11 del artículo 159. Mientras el Órgano Legislativo no haya dictado Ley o Leyes que contengan las normas generales correspondientes, el Órgano Ejecutivo podrá ejercer estas atribuciones y enviará al Órgano Legislativo copia de todos los Decretos que dicte en ejercicio de esta facultad.",
        metadatum: m200,
        number: 7)

      puts 'creating metadata subarticles for article 200'
      msa200008 = MetadatumSubarticle.create!(content: "Dictar el reglamento de su régimen interno y ejercer las demás funciones que le señale la Constitución o la Ley.",
        metadatum: m200,
        number: 8)



puts "creating title 7"
t7 = Title.create!(number: 7,
  description: "LA ADMINISTRACIÓN DE JUSTICIA",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c71 = Chapter.create!(number: 1,
    description: "Órgano Judicial",
    title: t7,
    new: false)

    puts 'creating article 201'
    a201 = Article.create!(content: 'La administración de justicia es gratuita, expedita e ininterrumpida. /n
    La gestión y actuación de todo proceso se surtirá en papel simple y no estarán sujetas a impuesto alguno. /n
    Las vacaciones de los Magistrados, Jueces y empleados judiciales no interrumpirán el funcionamiento continuo de los respectivos tribunales',
      chapter: c71,
      number: 201,
      new: false)

    puts 'creating article 202'
    a202 = Article.create!(content: 'El Órgano Judicial está constituido por la Corte Suprema de Justicia, los tribunales y los juzgados que la Ley establezca. La administración de justicia también podrá ser ejercida por la jurisdicción arbitral conforme lo determine la Ley. Los tribunales arbitrales podrán conocer y decidir por sí mismos acerca de su propia competencia.',
      chapter: c71,
      number: 202,
      new: false)

      puts 'creating metadata for article 202'
      m202 = Metadatum.create!(content: "El Órgano Judicial está constituido por la Corte Suprema de Justicia, el Tribunal Constitucional, los tribunales y los juzgados que la Ley establezca. La administración de justicia también podrá ser ejercida por la jurisdicción arbitral conforme lo determine la Ley. Los tribunales arbitrales podrán conocer y decidir por sí mismos acerca de su propia competencia.",
        article: a202)

    puts 'creating article 203'
    a203 = Article.create!(content: 'La Corte Suprema de Justicia estará compuesta del número de Magistrados que determine la Ley, nombrados mediante acuerdo del Consejo de Gabinete, con sujeción a la aprobación del Órgano Legislativo, para un periodo de diez años. La falta absoluta de un Magistrado será cubierta mediante nuevo nombramiento para el resto del periodo respectivo.  /n
    Cada Magistrado tendrá un suplente nombrado en igual forma que el principal y para el mismo periodo, quien lo reemplazará en sus faltas, conforme a la Ley. /n
    Solo podrán ser designados suplentes, los funcionarios de Carrera Judicial de servicio en el Órgano Judicial.  /n
    Cada dos años, se designarán dos Magistrados, salvo en los casos en que por razón del número de Magistrados que integren la Corte, se nombren más de dos o menos de dos Magistrados. /n
    Cuando se aumente el número de Magistrados de la Corte, se harán los nombramientos necesarios para tal fin, y la Ley respectiva dispondrá lo adecuado para mantener el principio de nombramientos escalonados. /n
    No podrá ser nombrado Magistrado de la Corte Suprema de Justicia:',
      chapter: c71,
      number: 203,
      new: false)

     puts 'creating subarticles for article 203'
      sa203001 = Subarticle.create!(content: "Quien esté ejerciendo o haya ejercido el cargo de Diputado de la República o suplente de Diputado durante el periodo constitucional en curso.",
        article: a203,
        number: 1)

     puts 'creating subarticles for article 203'
      sa203002 = Subarticle.create!(content: "Quien esté ejerciendo o haya ejercido cargos de mando y jurisdicción en el Órgano Ejecutivo durante el periodo constitucional en curso. La Ley dividirá la Corte en Salas, formadas por tres Magistrados permanentes cada una.",
        article: a203,
        number: 2)

      puts 'creating metadata for article 203'
      m203 = Metadatum.create!(content: "La Corte Suprema de Justicia estará compuesta del número de Magistrados que determine la Ley. Cada Magistrado será nombrado mediante acuerdo del Consejo de Gabinete, escogido de una tema propuesta por el Consejo de la Concertación Nacional para el Desarrollo, con 7 sujeción a la aprobación del Órgano Legislativo, para un periodo de quince (15) años2, manteniendo  el principio de nombramiento escalonado. La falta absoluta de un Magistrado será cubierta mediante nuevo nombramiento para el resto del periodo respectivo.  /n
      Cada Magistrado tendrá un suplente nombrado en igual forma que el principal y para el mismo  periodo, quien lo reemplazará en sus faltas, conforme a la Ley. Solo podrán ser designados suplentes, los funcionarios de Carrera Judicial de servicio en el Órgano Judicial.  /n
      Cuando se aumente el número de Magistrados de la Corte, se harán los nombramientos necesarios para tal fin, y la ley respectiva dispondrá lo adecuado para mantener el principio de nombramientos escalonados.  /n
      No podrá ser nombrado Magistrado de la Corte Suprema de Justicia:",
        article: a203)

      puts 'creating metadata subarticles for article 203'
      msa203001 = MetadatumSubarticle.create!(content: "Quien esté ejerciendo o haya ejercido el cargo de Diputado de la República o suplente de Diputado durante el periodo constitucional en curso.",
        metadatum: m203,
        number: 1)

      puts 'creating metadata subarticles for article 203'
      msa203002 = MetadatumSubarticle.create!(content: "Quien esté ejerciendo o haya ejercido cargos de mando y jurisdicción en el Órgano Ejecutivo durante el periodo constitucional en curso. La Ley dividirá la Corte en Salas, formadas por tres Magistrados permanentes cada una.",
        metadatum: m203,
        number: 2)

    puts 'creating article 204'
    a204 = Article.create!(content: 'Para ser Magistrado de la Corte Suprema de Justicia se requiere:',
      chapter: c71,
      number: 204,
      new: false)

     puts 'creating subarticles for article 204'
      sa204001 = Subarticle.create!(content: "Ser panameño por nacimiento.",
        article: a204,
        number: 1)

     puts 'creating subarticles for article 204'
      sa204002 = Subarticle.create!(content: "Haber cumplido treinta y cinco años de edad.",
        article: a204,
        number: 2)

     puts 'creating subarticles for article 204'
      sa204003 = Subarticle.create!(content: "Hallarse en pleno goce de los derechos civiles y políticos.",
        article: a204,
        number: 3)

     puts 'creating subarticles for article 204'
      sa204004 = Subarticle.create!(content: "Ser graduado en Derecho y haber inscrito el título universitario en la oficina que la Ley señale.",
        article: a204,
        number: 4)

     puts 'creating subarticles for article 204'
      sa204005 = Subarticle.create!(content: "Haber completado un periodo de diez años durante el cual haya ejercido indistintamente la profesión de abogado, cualquier cargo del Órgano Judicial, del Ministerio Público, del Tribunal Electoral o de la Defensoría del Pueblo que requiera título universitario en Derecho, o haber sido profesor de Derecho en un establecimiento de enseñanza universitaria.",
        article: a204,
        number: 5)

      # continuaion de parrafo principal
      puts 'creating subarticles for article 204'
      sa00204 = Subarticle.create!(content: "Se reconoce la validez de las credenciales para ser Magistrado de la Corte Suprema de Justicia, otorgadas de acuerdo con disposiciones constitucionales anteriores.",
        article: a204,
        number: 2000)

      puts 'creating metadata for article 204'
      m204 = Metadatum.create!(content: "Para ser Magistrado de la Corte Suprema de Justicia se requiere:",
        article: a204)

      puts 'creating metadata subarticles for article 204'
      msa204001 = MetadatumSubarticle.create!(content: "Ser panameño por nacimiento.",
        metadatum: m204,
        number: 1)

      puts 'creating metadata subarticles for article 204'
      msa204002 = MetadatumSubarticle.create!(content: "Haber cumplido cuarenta y cinco años de edad.",
        metadatum: m204,
        number: 2)

      puts 'creating metadata subarticles for article 204'
      msa204003 = MetadatumSubarticle.create!(content: "Hallarse en pleno goce de los derechos civiles y políticos.",
        metadatum: m204,
        number: 3)

      puts 'creating metadata subarticles for article 204'
      msa204004 = MetadatumSubarticle.create!(content: "Ser graduado en Derecho y haber inscrito el título universitario en la oficina que la Ley señale.",
        metadatum: m204,
        number: 4)

      puts 'creating metadata subarticles for article 204'
      msa204005 = MetadatumSubarticle.create!(content: "Haber completado un periodo de quince años durante el cual haya ejercido indistintamente la profesión de abogado, cualquier cargo del Órgano Judicial, del Ministerio Público, del Tribunal Electoral o de la Defensoría del Pueblo que requiera título universitario en Derecho, o haber sido profesor de Derecho en un establecimiento de enseñanza universitaria.",
        metadatum: m204,
        number: 5)

      puts 'creating metadata subarticles for article 204'
      msa204006 = MetadatumSubarticle.create!(content: "Haber realizado estudios de especialización o experiencia profesional en temas afines al ejercicio del cargo y de la sala correspondiente.",
        metadatum: m204,
        number: 6)

    puts 'creating article 205'
    a205 = Article.create!(content: 'La persona que haya sido condenada por delito doloso, mediante sentencia ejecutoriada proferida por un tribunal de justicia, no podrá desempeñar cargo alguno en el Órgano Judicial.',
      chapter: c71,
      number: 205,
      new: false)

    puts 'creating article 206'
    a206 = Article.create!(content: 'La Corte Suprema de Justicia tendrá, entre sus atribuciones constitucionales y legales, las siguientes:',
      chapter: c71,
      number: 206,
      new: false)

      puts 'creating subarticles for article 206'
      sa206001 = Subarticle.create!(content: "La guarda de la integridad de la Constitución para lo cual la Corte en pleno conocerá y decidirá, con audiencia del Procurador General de la Nación o del Procurador de la Administración, sobre la inconstitucionalidad de las Leyes, decretos, acuerdos, resoluciones y demás actos que por razones de fondo o de forma impugne ante ella cualquier persona. /n
      Cuando en un proceso el funcionario público encargado de impartir justicia advirtiere o se lo advirtiere alguna de las partes que la disposición legal o reglamentaria aplicable al caso es inconstitucional, someterá la cuestión al conocimiento del pleno de la Corte, salvo que la disposición haya sido objeto de pronunciamiento por parte de ésta, y continuará el curso del negocio hasta colocarlo en estado de decidir. /n
      Las partes sólo podrán formular tales advertencias una sola vez por instancia.",
        article: a206,
        number: 1)

      puts 'creating subarticles for article 206'
      sa206002 = Subarticle.create!(content: "La jurisdicción contencioso-administrativa respecto de los actos, omisiones, prestación defectuosa o deficiente de los servicios públicos, resoluciones, órdenes o disposiciones que ejecuten, adopten, expidan o en que incurran en ejercicio de sus funciones o pretextando ejercerlas, los funcionarios públicos y autoridades nacionales, provinciales, municipales y de las entidades públicas autónomas o semiautónomas. /n
      A tal fin, la Corte Suprema de Justicia con audiencia del Procurador de la Administración, podrá anular los actos acusados de ilegalidad; restablecer el derecho particular violado; estatuir nuevas disposiciones en reemplazo de las impugnadas y pronunciarse prejudicialmente acerca del sentido y alcance de un acto administrativo o de su valor legal. /n
      Podrán acogerse a la jurisdicción contencioso-administrativa las personas afectadas por el acto, resolución, orden o disposición de que se trate; y, en ejercicio de la acción pública, cualquier persona natural o jurídica domiciliada en el país.",
        article: a206,
        number: 2)

      puts 'creating subarticles for article 206'
      sa206003 = Subarticle.create!(content: "Investigar y procesar a los Diputados. Para efectos de la investigación, el Pleno de la Corte Suprema de Justicia comisionará a un agente de instrucción. /n
      Las decisiones de la Corte en el ejercicio de las atribuciones señaladas en este artículo son finales, definitivas, obligatorias y deben publicarse en la Gaceta Oficial.",
        article: a206,
        number: 3)

      puts 'creating metadata for article 206'
      m206 = Metadatum.create!(content: "La Corte Suprema de Justicia tendrá, entre sus atribuciones constitucionales y legales, las siguientes:",
        article: a206)

      puts 'creating metadata subarticles for article 206'
      msa206001 = MetadatumSubarticle.create!(content: "La jurisdicción contencioso-administrativa respecto de los actos, omisiones, prestación defectuosa o deficiente de los servicios públicos, resoluciones, órdenes o disposiciones que ejecuten, adopten, expidan o en que incurran en ejercicio de sus funciones o pretextando ejercerlas, los funcionarios públicos y autoridades nacionales, provinciales, municipales y de las entidades públicas autónomas o semiautónomas. A tal fin, la Corte Suprema de Justicia con audiencia del Procurador de la Administración, podrá anular los actos acusados de ilegalidad; restablecer el derecho particular violado; estatuir nuevas disposiciones en reemplazo de las impugnadas y pronunciarse prejudicialmente acerca del sentido y alcance de un acto administrativo o de su valor legal.  /n
      Podrán acogerse a la jurisdicción contencioso-administrativa las personas afectadas por el acto, resolución, orden o disposición de que se trate; y, en ejercicio de la acción pública, cualquier persona natural o jurídica domiciliada en el país.",
        metadatum: m206,
        number: 1)

      puts 'creating metadata subarticles for article 206'
      msa206002 = MetadatumSubarticle.create!(content: "La jurisdicción penal, civil y laboral, conforme lo dispone esta Constitución y la Ley.",
        metadatum: m206,
        number: 2)

      puts 'creating metadata subarticles for article 206'
      msa206002 = MetadatumSubarticle.create!(content: "Las decisiones de la Corte Suprema de Justicia, en el ejercicio de las atribuciones señaladas en esta Constitución, son finales, definitivas, obligatorias y deben publicarse en la Gaceta Oficial.",
        metadatum: m206,
        number: 2000)




      # corregir codigo continuo de articulo modificaado
      # puts 'creating subarticles for article 206'
      # sa00206 = Subarticle.create!(content: "La Ley organizará y determinará el funcionamiento de la jurisdicción especial de menores la cual, entre otras funciones, conocerá sobre la investigación de la paternidad, el abandono de familia y los problemas de conducta juvenil.",
      #   article: a206,
      #   number: 00206)

    puts 'creating article 207'
    a207 = Article.create!(content: 'No se admitirán recursos de inconstitucionalidad ni de amparo de garantías constitucionales contra los fallos de la Corte Suprema de Justicia o sus Salas.',
      chapter: c71,
      number: 207,
      new: false)

    puts 'creating article 208'
    a208 = Article.create!(content: 'Los Magistrados y Jueces principales no podrán desempeñar ningún otro cargo público, excepto el de profesor para la enseñanza del Derecho en establecimientos de educación universitaria.',
      chapter: c71,
      number: 208,
      new: false)

    puts 'creating article 209'
    a209 = Article.create!(content: 'En los Tribunales y juzgados que la Ley establezca, los Magistrados serán nombrados por la Corte Suprema de Justicia y los Jueces por su superior jerárquico. El personal subalterno será nombrado por el Tribunal o juez respectivo. Todos estos nombramientos serán hechos con arreglo a la Carrera Judicial, según lo dispuesto en el Título XI.',
      chapter: c71,
      number: 209,
      new: false)

    puts 'creating article 210'
    a210 = Article.create!(content: 'Los Magistrados y Jueces son independientes en el ejercicio de sus funciones y no están sometidos más que a la Constitución y a la Ley; pero los inferiores están obligados a acatar y cumplir las decisiones que dicten sus superiores jerárquicos al revocar o reformar, en virtud de recursos legales, las resoluciones proferidas por aquellos.',
      chapter: c71,
      number: 210,
      new: false)

    puts 'creating article 211'
    a211 = Article.create!(content: 'Los Magistrados y los Jueces no serán depuestos ni suspendidos o trasladados en el ejercicio de sus cargos, sino en los casos y con las formalidades que disponga la Ley.',
      chapter: c71,
      number: 211,
      new: false)

    puts 'creating article 212'
    a212 = Article.create!(content: 'Los cargos del Órgano Judicial son incompatibles con toda participación en la política, salvo la emisión del voto en las elecciones, con el ejercicio de la abogacía o del comercio y con cualquier otro cargo retribuido, excepto lo previsto en el artículo 208.',
      chapter: c71,
      number: 212,
      new: false)

    puts 'creating article 213'
    a213 = Article.create!(content: 'Los sueldos y asignaciones de los Magistrados de la Corte Suprema de Justicia no serán inferiores a los de los Ministros de Estado. Toda supresión de empleos en el ramo Judicial se hará efectiva al finalizar el período correspondiente.',
      chapter: c71,
      number: 213,
      new: false)

      puts 'creating metadata for article 213'
      m213 = Metadatum.create!(content: "Los sueldos y asignaciones de los Magistrados de la Corte Suprema de Justicia y de los Magistrados del Tribunal Constitucional no serán inferiores a los de los Ministros de Estado. Toda supresión de cargos en el ramo Judicial se hará efectiva al finalizar el período correspondiente.",
        article: a213)

    puts 'creating article 214'
    a214 = Article.create!(content: 'La Corte Suprema de Justicia y el Procurador General de la Nación formularán los respectivos Presupuestos del Órgano Judicial y del Ministerio Público y los remitirán oportunamente al Órgano Ejecutivo para su inclusión en el proyecto de Presupuesto General del sector público. El Presidente de la Corte y el Procurador podrán sustentar, en todas las etapas de los mismos, los respectivos proyectos de Presupuesto.  /n
    Los presupuestos del Órgano Judicial y del Ministerio Público, no serán inferiores, en conjunto, al dos por ciento de los ingresos corrientes del Gobierno Central. /n
    Sin embargo, cuando esta cantidad resultare superior a la requerida para cubrir las necesidades fundamentales propuestas por el Órgano Judicial y el Ministerio Público, el Órgano Ejecutivo incluirá el excedente en otros renglones de gastos o inversiones en el proyecto de Presupuesto del Gobierno Central, para que la Asamblea Nacional determine lo que proceda.',
      chapter: c71,
      number: 214,
      new: false)

      puts 'creating metadata for article 214'
      m214 = Metadatum.create!(content: "La Corte Suprema de Justicia, el Tribunal Constitucional y el Procurador General de la Nación formularán sus respectivos Presupuestos y los remitirán oportunamente al Órgano Ejecutivo para su inclusión en el proyecto de presupuesto General del sector público. El Presidente de la Corte, el Presidente del Tribunal Constitucional y el Procurador podrán sustentar, en todas las etapas de los mismos, los respectivos proyectos de presupuesto.  /n
      Los presupuestos del Órgano Judicial y del Ministerio Público no serán inferiores, en conjunto al 2% del Presupuesto General del Estado.  /n
      Sin embargo, cuando esta cantidad resultare superior a la requerida para cubrir las necesidades fundamentales propuestas por el Órgano Judicial y el Ministerio Público, el Órgano Ejecutivo incluirá el excedente en otros renglones de gastos o inversiones en el proyecto de Presupuesto del Gobierno Central, para que la Asamblea Nacional determine lo que proceda.",
        article: a214)

    puts 'creating article 215'
    a215 = Article.create!(content: 'Las Leyes procesales que se aprueben se inspirarán, entre otros, en los siguientes principios.',
      chapter: c71,
      number: 215,
      new: false)

      puts 'creating subarticles for article 215'
      sa215001 = Subarticle.create!(content: "Simplificación de los trámites, economía procesal y ausencia de formalismos.",
        article: a215,
        number: 1)

      puts 'creating subarticles for article 215'
      sa215002 = Subarticle.create!(content: "El objeto del proceso es el reconocimiento de los derechos consignados en la Ley substancial.",
        article: a215,
        number: 2)

    puts 'creating article 216'
    a216 = Article.create!(content: 'Los Magistrados y Jueces no podrán ser detenidos ni arrestados sino en virtud de mandamiento escrito de la autoridad judicial competente para juzgarlos.',
      chapter: c71,
      number: 216,
      new: false)

    puts 'creating article 217'
    a217 = Article.create!(content: 'La Ley arbitrará los medios para prestar asesoramiento y defensa jurídica a quienes por su situación económica no puedan procurárselos por si mismos, tanto a través de los organismos oficiales, creados al efecto, como por intermedio de las asociaciones profesionales de abogados reconocidas por el Estado.',
      chapter: c71,
      number: 217,
      new: false)

    puts 'creating article 218'
    a218 = Article.create!(content: 'Se instituye el juicio por jurados. La Ley determinará las causas que deban decidirse por este sistema.',
      chapter: c71,
      number: 218,
      new: false)


  # capitulo nuevo
  puts 'creating chapter 2'
  c72 = Chapter.create!(number: 2,
    description: "El Tribunal Constitucional",
    title: t7,
    new: true)

    # articulo nuevo 4. debe venir despues del 218 con ese titulo
    puts 'creating article 218'
    a218 = Article.create!(content: "Se establece la Jurisdicción Constitucional con competencia nacional, a cargo del Tribunal Constitucional, que es el máximo órgano judicial, independiente, único en su orden jurisdiccional y como intérprete de la Constitución Política de la República de Panamá, está encargado de la guarda de la integridad y supremacía de la misma.",
      chapter: c72,
      number: 218.4,
      new: true)

    # articulo nuevo 7. debe venir despues del 221 con ese titulo
    puts 'creating article 221'
    a221 = Article.create!(content: "El Tribunal Constitucional estará integrada por cinco (5) magistrados y sus respectivos suplentes, quienes deberán cumplir con iguales requisitos que para ser Magistrado de la Corte Suprema de Justicia, y serán nombrados de igual forma que éstos, mediante el principio de nombramientos escalonados. /n A los magistrados del Tribunal Constitucional les son aplicables las mismas prohibiciones y prerrogativas que establece esta Constitución para los Magistrados de la Corte Suprema de Justicia.",
      chapter: c72,
      number: 221.5,
      new: true)


  puts 'creating chapter 2'
  c721 = Chapter.create!(number: 2.1,
    description: "El Ministerio Público",
    title: t7,
    new: false)

    puts 'creating article 219'
    a219 = Article.create!(content: 'El Ministerio Público será ejercido por el Procurador General de la Nación, el Procurador de la Administración, los Fiscales y Personeros y por los demás funcionarios que establezca la Ley. Los agentes del Ministerio Público podrán ejercer por delegación, conforme lo determine la Ley, las funciones del Procurador General de la Nación.',
      chapter: c721,
      number: 219,
      new: false)

    # articulo nuevo 5. debe venir despues del 219 con ese titulo
    puts 'creating article 219'
    a2191 = Article.create!(content: "Son funciones del Tribunal Constitucional las siguientes:",
      chapter: c721,
      number: 219.6,
      new: true)

      puts 'creating subarticles for article 219'

      sa219101 = Subarticle.create!(content: 'Conocer de las demandas de inconstitucionalidad contra las leyes, decretos y demás disposiciones normativas con fuerza de Ley.',
        article: a2191,
        number: 1)

      sa219102 = Subarticle.create!(content: 'Decidir sobre las advertencias o consultas sobre la constitucionalidad de una norma juridica de inferior rango a la Constitución aplicable a un caso concreto. ',
        article: a2191,
        number: 2)

      sa219103 = Subarticle.create!(content: 'Conocer de la inexequibilidad de los proyectos de ley objetados por el Órgano Ejecutivo al estimarlos como inconstitucionales.',
        article: a2191,
        number: 3)

      sa219104 = Subarticle.create!(content: 'Decidir, sobre las demandas de inconstitucionalidad contra los actos reformatorios de la Constitución, por vicios de procedimiento en su formación.',
        article: a2191,
        number: 4)

      sa219105 = Subarticle.create!(content: 'Decidir, con anterioridad al pronunciamiento popular, sobre la constitucionalidad de la convocatoria a un referéndum, plebiscito o a una Asamblea Constituyente, solo en caso de vicios de procedimiento en su formación.',
        article: a2191,
        number: 5)
      sa219106 = Subarticle.create!(content: 'Conocer de la exequibilidad de [os Tratados Internacionales y de las leyes que los aprueben. Si la corte los declara constitucionales, el Gobierno podrá efectuar el canje de notas, de lo contrario, no serán ratificados. En caso de inexequibilidad de una o varias normas del Tratado multilateral, cabe la formulación de reserva. ',
        article: a2191,
        number: 6)

      sa219107 = Subarticle.create!(content: 'Conocer de las querellas o denuncias que se presenten contra los magistrados de la Corte Suprema de Justicia, con sujeción a lo establecido en el artículo siguiente. La fase de investigación corresponde al Ministerio Público.',
        article: a2191,
        number: 7)

      sa219108 = Subarticle.create!(content: 'Revisar, en la forma que determine la Ley, las decisiones judiciales sobre la acción de amparo de las garantías constitucionales fundamentales; atendiendo la excepción contenida en el artículo 207.',
        article: a2191,
        number: 8)

      sa219109 = Subarticle.create!(content: 'Las decisiones del Tribunal Constitucional, en el ejercicio de las atribuciones señaladas en esta Constitución, son finales, definitivas, obligatorias y deben publicarse en la Gaceta Oficial.',
        article: a2191,
        number: 2001)



    puts 'creating article 220'
    a220 = Article.create!(content: 'Son atribuciones del Ministerio Público:',
      chapter: c721,
      number: 220,
      new: false)

      puts 'creating subarticles for article 220'
      sa220001 = Subarticle.create!(content: "Defender los intereses del Estado o del Municipio.",
        article: a220,
        number: 1)

      puts 'creating subarticles for article 220'
      sa220002 = Subarticle.create!(content: "Promover el cumplimiento o ejecución de las Leyes, sentencias judiciales y disposiciones administrativas.",
        article: a220,
        number: 2)

      puts 'creating subarticles for article 220'
      sa220003 = Subarticle.create!(content: "Vigilar la conducta oficial de los funcionarios públicos y cuidar que todos desempeñen cumplidamente sus deberes.",
        article: a220,
        number: 3)

      puts 'creating subarticles for article 220'
      sa220004 = Subarticle.create!(content: "Perseguir los delitos y contravenciones de disposiciones constitucionales o legales.",
        article: a220,
        number: 4)

      puts 'creating subarticles for article 220'
      sa220005 = Subarticle.create!(content: "Servir de consejeros jurídicos a los funcionarios administrativos.",
        article: a220,
        number: 5)

      puts 'creating subarticles for article 220'
      sa220006 = Subarticle.create!(content: "Ejercer las demás funciones que determine la Ley.",
        article: a220,
        number: 6)

      # articulo nuevo 6. debe venir despues del 220 con ese titulo
      puts 'creating article 220'
      a2201 = Article.create!(content: " Toda denuncia o querella que se presente contra un magistrado de la Corte Suprema de Justicia, será investigada por el Procurador General de la Nación o Fiscal delegado. En caso de ser imputado por éste, el mismo será procesado, en primera instancia, por el Tribunal Constitucional. En la primera instancia el juzgamiento corresponderá a dos magistrados principales y un suplente de dicho tribunal. /n La sentencia dictada en primera instancia será recurrible ante otros tres magistrados principales o suplentes distintos de los que hayan dictado el fallo de primera instancia. En estos casos actuará como juez de garantías el magistrado que se designe por el resto del Tribunal Constitucional. /n Las medidas cautelares solicitadas por el Procurador General de la Nación serán autorizadas por el juez de garantías, cuyas decisiones serán recurribles ante los magistrados de primera instancia. ",
        chapter: c721,
        number: 220.7,
        new: true)

        # listas nuevas
        puts 'creating subarticles for article 220'
        sa220001 = Subarticle.create!(content: "Conocer de las demandas de inconstitucionalidad contra las leyes, decretos y demás disposiciones normativas con fuerza de Ley.",
          article: a2201,
          number: 1)

        puts 'creating subarticles for article 220'
        sa220002 = Subarticle.create!(content: "Decidir sobre las advertencias o consultas sobre la constitucionalidad de una norma juridica de inferior rango a la Constitución aplicable a un caso concreto.",
          article: a2201,
          number: 2)

        puts 'creating subarticles for article 220'
        sa220003 = Subarticle.create!(content: "Conocer de la inexequibilidad de los proyectos de ley objetados por el Órgano Ejecutivo al estimarlos como inconstitucionales.",
          article: a2201,
          number: 3)

        puts 'creating subarticles for article 220'
        sa220004 = Subarticle.create!(content: "Decidir, sobre las demandas de inconstitucionalidad contra los actos reformatorios de la Constitución, por vicios de procedimiento en su formación.",
          article: a2201,
          number: 4)

        puts 'creating subarticles for article 220'
        sa220005 = Subarticle.create!(content: "Decidir, con anterioridad al pronunciamiento popular, sobre la constitucionalidad de la convocatoria a un referéndum, plebiscito o a una Asamblea Constituyente, solo en caso de vicios de procedimiento en su formación.",
          article: a2201,
          number: 5)

        puts 'creating subarticles for article 220'
        sa220006 = Subarticle.create!(content: "Conocer de la exequibilidad de [os Tratados Internacionales y de las leyes que los aprueben. Si la corte los declara constitucionales, el Gobierno podrá efectuar el canje de notas, de lo contrario, no serán ratificados. En caso de inexequibilidad de una o varias normas del Tratado multilateral, cabe la formulación de reserva.",
          article: a2201,
          number: 6)

        puts 'creating subarticles for article 220'
        sa220007 = Subarticle.create!(content: "Conocer de las querellas o denuncias que se presenten contra los magistrados de la Corte Suprema de Justicia, con sujeción a lo establecido en el artículo siguiente. La fase de investigación corresponde al Ministerio Público.",
          article: a2201,
          number: 7)

        puts 'creating subarticles for article 220'
        sa220008 = Subarticle.create!(content: "Revisar, en la forma que determine la Ley, las decisiones judiciales sobre [a acción de amparo de las garantías constitucionales fundamentales; atendiendo la excepción contenida en el artículo 207. Las decisiones del Tribunal Constitucional, en el ejercicio de las atribuciones señaladas en esta Constitución, son finales, definitivas, obligatorias y deben publicarse en la Gaceta Oficial.",
          article: a2201,
          number: 8)

    puts 'creating article 221'
    a221 = Article.create!(content: 'Para ser Procurador General de la Nación y Procurador de la Administración se necesitan los mismos requisitos que para ser Magistrado de la Corte Suprema de Justicia. Ambos serán nombrados por un período de diez años.',
      chapter: c721,
      number: 221,
      new: false)


    puts 'creating article 222'
    a222 = Article.create!(content: 'Son funciones especiales del Procurador General de la Nación:',
      chapter: c72,
      number: 222,
      new: false)

      puts 'creating subarticles for article 222'
      sa222001 = Subarticle.create!(content: "Acusar ante la Corte Suprema de Justicia a los funcionarios públicos cuyo juzgamiento corresponda a esta Corporación.",
        article: a222,
        number: 1)

      puts 'creating subarticles for article 222'
      sa222002 = Subarticle.create!(content: "Velar por que los demás Agentes del Ministerio Público desempeñen fielmente su cargo, y que se les exija responsabilidad por falta o delitos que cometan.",
        article: a222,
        number: 2)

      puts 'creating metadata for article 222'
      m222 = Metadatum.create!(content: "Son funciones especiales del Procurador General de la Nación:",
        article: a222)

      puts 'creating metadata subarticles for article 222'
      msa222001 = MetadatumSubarticle.create!(content: "El ejercicio de la acción penal ante la Corte Suprema de Justicia y el Tribunal Constitucional contra a los funcionarios públicos cuyo juzgamiento corresponda a estas corporaciones.",
        metadatum: m222,
        number: 1)

      puts 'creating metadata subarticles for article 222'
      msa222002 = MetadatumSubarticle.create!(content: "Velar por que los demás Agentes del Ministerio Público desempeñen fielmente su cargo, y que se les exija responsabilidad por falta o delitos que cometan.",
        metadatum: m222,
        number: 2)

    puts 'creating article 223'
    a223 = Article.create!(content: 'Rigen respecto a los Agentes del Ministerio Público las mismas disposiciones que para los funcionarios judiciales establecen los artículos 205, 208, 210, 211, 212 y 216.',
      chapter: c721,
      number: 223,
      new: false)

    puts 'creating article 224'
    a224 = Article.create!(content: 'El Procurador General de la Nación y el Procurador de la Administración serán nombrados de acuerdo con los mismos requisitos y prohibiciones establecidos para los Magistrados de la Corte Suprema de Justicia. /n
    Las faltas temporales de alguno de los Procuradores serán cubiertas por un funcionario del Ministerio Público, en calidad de Procurador Encargado, que cumpla con los mismos requisitos para el cargo y quien será designado temporalmente por el respectivo Procurador. /n
    Los Fiscales y Personeros serán nombrados por sus superiores jerárquicos. El personal subalterno será nombrado por el Fiscal o Personero respectivo. Todos estos nombramientos serán hechos con arreglo a la Carrera Judicial.',
      chapter: c721,
      number: 224,
      new: false)

puts "creating title 8"
t8 = Title.create!(number: 8,
  description: "REGÍMENES MUNICIPAL Y PROVINCIALES",
  legislation: l,
  new: false)

# falta el codigo para un titulo modificado a REGÍMENES MUNICIPAL, PROVINCIAL Y COMARCAL

  puts 'creating chapter 1'
  c81 = Chapter.create!(number: 1,
    description: "Representantes de Corregimiento",
    title: t8,
    new: false)

    puts 'creating article 225'
    a225 = Article.create!(content: 'Cada Corregimiento elegirá un Representante y su suplente por votación popular directa, por un período de cinco años. Los Representantes de Corregimientos podrán ser reelegidos indefinidamente.',
      chapter: c81,
      number: 225,
      new: false)

    puts 'creating article 226'
    a226 = Article.create!(content: 'Para ser Representante de Corregimiento se requiere:',
      chapter: c81,
      number: 226,
      new: false)

      puts 'creating subarticles for article 226'
      sa226001 = Subarticle.create!(content: "Ser panameño por nacimiento o haber adquirido en forma definitiva la nacionalidad panameña diez años antes de la fecha de la elección.",
        article: a226,
        number: 1)

      puts 'creating subarticles for article 226'
      sa226002 = Subarticle.create!(content: "Haber cumplido dieciocho años de edad.",
        article: a226,
        number: 2)

      puts 'creating subarticles for article 226'
      sa226003 = Subarticle.create!(content: "No haber sido condenado por delito doloso con pena privativa de la libertad de cinco años o más, mediante sentencia ejecutoriada, proferida por un tribunal de justicia.",
        article: a226,
        number: 3)

      puts 'creating subarticles for article 226'
      sa226004 = Subarticle.create!(content: "Ser residente del corregimiento que representa, por lo menos, el año inmediatamente anterior a la elección.",
        article: a226,
        number: 4)

      puts 'creating metadata for article 226'
      m226 = Metadatum.create!(content: "Para ser Representante de Corregimiento se requiere:",
        article: a226)

      puts 'creating metadata subarticles for article 226'
      msa26001 = MetadatumSubarticle.create!(content: "Ser panameño por nacimiento o haber adquirido en forma definitiva la nacionalidad panameña diez años antes de la fecha de la elección.",
        metadatum: m226,
        number: 1)

      puts 'creating metadata subarticles for article 226'
      msa26002 = MetadatumSubarticle.create!(content: "Haber cumplido dieciocho años de edad.",
        metadatum: m226,
        number: 2)

      puts 'creating metadata subarticles for article 226'
      msa26003 = MetadatumSubarticle.create!(content: "No haber sido condenado por delito doloso, mediante sentencia ejecutoriada, proferida por un tribunal de justicia.",
        metadatum: m226,
        number: 3)

      puts 'creating metadata subarticles for article 226'
      msa26004 = MetadatumSubarticle.create!(content: "Ser residente del corregimiento que representa, por lo menos, el año inmediatamente anterior a la elección.",
        metadatum: m226,
        number: 4)

    puts 'creating article 227'
    a227 = Article.create!(content: 'La representación se perderá por las siguientes causas:',
      chapter: c81,
      number: 227,
      new: false)

      puts 'creating subarticles for article 227'
      sa227001 = Subarticle.create!(content: "El cambio voluntario de residencia a otro Corregimiento.",
        article: a227,
        number: 1)

      puts 'creating subarticles for article 227'
      sa227002 = Subarticle.create!(content: "La condena judicial fundada en delito.",
        article: a227,
        number: 2)

      puts 'creating subarticles for article 227'
      sa227003 = Subarticle.create!(content: "La revocatoria de mandato, conforme lo reglamenta la Ley.",
        article: a227,
        number: 3)

    puts 'creating article 228'
    a228 = Article.create!(content: 'En caso de vacante temporal o absoluta de la representación principal del Corregimiento, se encargará el Representante suplente. Cuando se produzca vacante absoluta del principal y del suplente, deberán celebrarse elecciones dentro de los seis meses siguientes para elegir un nuevo Representante y su respectivo suplente.',
      chapter: c81,
      number: 228,
      new: false)

      puts 'creating metadata for article 228'
      m228 = Metadatum.create!(content: "En caso de vacante temporal o absoluta de la representación principal del Corregimiento, se encargará el Representante suplente. Cuando se produzca vacante absoluta del principal y del suplente, deberán celebrarse elecciones dentro de los seis meses siguientes para elegir un nuevo Representante y su respectivo suplente. El Representante suplente no podrá ser el cónyuge o pariente dentro del cuarto grado de consanguinidad o segundo de afinidad de su principal.",
        article: a228)

    puts 'creating article 229'
    a229 = Article.create!(content: 'Los Representantes de Corregimientos no podrán ser nombrados para cargos públicos remunerados por el respectivo Municipio. La infracción de este precepto vicia de nulidad el nombramiento. /n
    Produce vacante absoluta del cargo de Representante de Corregimiento el nombramiento en el Órgano Judicial, en el Ministerio Público o en el Tribunal Electoral; y transitoria, la designación para Ministro de Estado, Jefe de Institución Autónoma o Semiautónoma, de Misión Diplomática y Gobernador de la Provincia.',
      chapter: c81,
      number: 229,
      new: false)

    puts 'creating article 230'
    a230 = Article.create!(content: 'Los Representantes de Corregimiento no son legalmente responsables por las opiniones que emitan en el ejercicio de su cargo, como miembros del Concejo Provincial.',
      chapter: c81,
      number: 230,
      new: false)

    puts 'creating article 231'
    a231 = Article.create!(content: 'Los Representantes de Corregimiento devengarán una remuneración que será pagada por el Tesoro Nacional o Municipal, según determine la Ley.',
      chapter: c81,
      number: 231,
      new: false)


  puts 'creating chapter 2'
  c82 = Chapter.create!(number: 2,
    description: "El Régimen Municipal",
    title: t8)

    puts 'creating article 232'
    a232 = Article.create!(content: 'El Municipio es la organización política autónoma de la comunidad establecida en un Distrito. /n
    La organización municipal será democrática y responderá al carácter esencialmente administrativo del gobierno local.',
      chapter: c82,
      number: 232,
      new: false)

    puts 'creating article 233'
    a233 = Article.create!(content: 'Al Municipio, como entidad fundamental de la división político administrativa del Estado, con gobierno propio, democrático y autónomo, le corresponde prestar los servicios públicos y construir las obras públicas que determine la Ley, ordenar el desarrollo de su territorio, promover la participación ciudadana, así como el mejoramiento social y cultural de sus habitantes y cumplir las demás funciones que le asigne la Constitución y la Ley. /n
    El Órgano Ejecutivo garantizará el cumplimiento de estos fines, dentro del proceso de descentralización de la competencia y función pública que el Estado panameño promoverá y realizará en base a los principios de autonomía, subsidiaridad, equidad, igualdad, sostenibilidad y eficiencia, y considerando la territorialidad, población y necesidades básicas de las municipalidades. /n
    La Ley establecerá cómo se descentralizará la Administración Pública y el traslado de competencia y la transferencia de recursos para el cumplimiento de esta norma.',
      chapter: c82,
      number: 233,
      new: false)

    puts 'creating article 234'
    a234 = Article.create!(content: 'Las autoridades municipales tienen el deber de cumplir y hacer cumplir la Constitución y Leyes de la República, los decretos y órdenes del Ejecutivo y las resoluciones de los tribunales de la justicia ordinaria y administrativa.',
      chapter: c82,
      number: 234,
      new: false)

    puts 'creating article 235'
    a235 = Article.create!(content: 'Ningún servidor público municipal podrá ser suspendido ni destituido por las autoridades administrativas nacionales.',
      chapter: c82,
      number: 235,
      new: false)

    puts 'creating article 236'
    a236 = Article.create!(content: 'El Estado complementará la gestión municipal, cuando ésta sea insuficiente, en casos de epidemia, grave alteración del orden público u otros motivos de interés general, en la forma que determine la Ley.',
      chapter: c82,
      number: 236,
      new: false)

    puts 'creating article 237'
    a237 = Article.create!(content: 'En cada Distrito habrá una corporación que se denominará Concejo Municipal, integrada por todos los Representantes de Corregimientos que hayan sido elegidos dentro del Distrito. Si en algún Distrito existieren menos de cinco Corregimientos, se elegirán por votación popular directa, según el procedimiento y el sistema de representación proporcional que establezca la Ley, los Concejales para que, en tal caso, el número de integrantes del Concejo Municipal sea de cinco.  /n
    El Concejo designará un Presidente y un Vicepresidente de su seno. Este último reemplazará al primero en sus ausencias.',
      chapter: c82,
      number: 237,
      new: false)

    puts 'creating article 238'
    a238 = Article.create!(content: 'Por iniciativa popular y mediante el voto de los Concejos, pueden dos o más Municipios solicitar su fusión en uno o asociarse para fines de beneficio común. La Ley establecerá el procedimiento correspondiente. /n
    Con iguales requisitos pueden los Municipios de una Provincia unificar su régimen estableciendo un tesoro y una administración fiscal comunes. En este caso podrá crearse un Concejo intermunicipal cuya composición determinará la Ley.',
      chapter: c82,
      number: 238,
      new: false)

    puts 'creating article 239'
    a239 = Article.create!(content: 'Los ciudadanos tienen el derecho de iniciativa y de referéndum en los asuntos atribuidos a los Concejos.',
      chapter: c82,
      number: 239,
      new: false)

    puts 'creating article 240'
    a240 = Article.create!(content: 'La Ley podrá disponer de acuerdo con la capacidad económica y recursos humanos de los Municipios, cuales se regirán por el sistema de síndicos especializados para prestar los servicios que aquélla establezca.',
      chapter: c82,
      number: 240,
      new: false)

    puts 'creating article 241'
    a241 = Article.create!(content: 'Habrá en cada distrito un Alcalde, Jefe de la Administración Municipal, y un Vicealcalde, electos por votación popular directa para un periodo de cinco años.',
      chapter: c82,
      number: 241,
      new: false)

      puts 'creating metadata for article 241'
      m241 = Metadatum.create!(content: "Habrá en cada distrito un Alcalde, Jefe de la Administración Municipal, y un  Vicealcalde, electos por votación popular directa para un periodo de cinco años.  /n
      El Vicealcalde no podrá ser el cónyuge o pariente dentro del cuarto grado de consanguinidad o segundo de afinidad de su principal.",
        article: a241)

    puts 'creating article 242'
    a242 = Article.create!(content: 'Es función del Concejo Municipal, sin perjuicio de otras que la Ley señale, expedir, modificar, reformar y derogar acuerdos y resoluciones municipales, en lo referente a:',
      chapter: c82,
      number: 242,
      new: false)

      puts 'creating subarticles for article 242'
      sa242001 = Subarticle.create!(content: "La aprobación o el rechazo del Presupuesto de Rentas y Gastos Municipal que formule la Alcaldía.",
        article: a242,
        number: 1)

      puts 'creating subarticles for article 242'
      sa242002 = Subarticle.create!(content: "La determinación de la estructura de la Administración Municipal que proponga el Alcalde.",
        article: a242,
        number: 2)

      puts 'creating subarticles for article 242'
      sa242003 = Subarticle.create!(content: "La fiscalización de la Administración Municipal.",
        article: a242,
        number: 3)

      puts 'creating subarticles for article 242'
      sa242004 = Subarticle.create!(content: "La aprobación o el rechazo de la celebración de contratos sobre concesiones y otros modos de prestación de servicios públicos, y lo relativo a la construcción de obras públicas municipales.",
        article: a242,
        number: 4)

      puts 'creating subarticles for article 242'
      sa242005 = Subarticle.create!(content: "La aprobación o la eliminación de impuestos, contribuciones, derechos y tasas, conforme a la Ley.",
        article: a242,
        number: 5)

      puts 'creating subarticles for article 242'
      sa242006 = Subarticle.create!(content: "La creación o la eliminación de la prestación de servicios públicos municipales.",
        article: a242,
        number: 6)

      puts 'creating subarticles for article 242'
      sa242007 = Subarticle.create!(content: "El nombramiento, la suspensión y remoción de los funcionarios municipales que laboran en el Concejo Municipal.",
        article: a242,
        number: 7)

      puts 'creating subarticles for article 242'
      sa242008 = Subarticle.create!(content: "La ratificación del nombramiento del Tesorero Municipal que haga el Alcalde.",
        article: a242,
        number: 8)

      puts 'creating subarticles for article 242'
      sa242009 = Subarticle.create!(content: "Las materias vinculadas a las competencias del municipio, según la Ley. Los acuerdos municipales tienen fuerza de Ley dentro del respectivo municipio.",
        article: a242,
        number: 9)

    puts 'creating article 243'
    a243 = Article.create!(content: 'Los Alcaldes tendrán las atribuciones siguientes:',
      chapter: c82,
      number: 243,
      new: false)

      puts 'creating subarticles for article 243'
      sa243001 = Subarticle.create!(content: "Presentar proyectos de acuerdos, especialmente el de Presupuesto de Rentas y Gastos.",
        article: a243,
        number: 1)

      puts 'creating subarticles for article 243'
      sa243002 = Subarticle.create!(content: "Ordenar los gastos de la administración local, ajustándose al Presupuesto y a los reglamentos de contabilidad.",
        article: a243,
        number: 2)

      puts 'creating subarticles for article 243'
      sa243003 = Subarticle.create!(content: "Nombrar y remover a los funcionarios públicos municipales, cuya designación no corresponda a otra autoridad, con sujeción a lo que dispone el Título XI.",
        article: a243,
        number: 3)

      puts 'creating subarticles for article 243'
      sa243004 = Subarticle.create!(content: "Promover el progreso de la comunidad municipal y velar por el cumplimiento de los deberes de sus funcionarios públicos.",
        article: a243,
        number: 4)

      puts 'creating subarticles for article 243'
      sa243005 = Subarticle.create!(content: "Ejercer las otras atribuciones que le asigne la Ley.",
        article: a243,
        number: 5)

    puts 'creating article 244'
    a244 = Article.create!(content: 'Los Alcaldes recibirán una remuneración por sus servicios, que será pagada por el Tesoro Nacional o Municipal, según lo determine la Ley.',
      chapter: c82,
      number: 244,
      new: false)

    puts 'creating article 245'
    a245 = Article.create!(content: 'Son municipales los impuestos que no tengan incidencia fuera del Distrito, pero la Ley podrá establecer excepciones para que determinados impuestos sean municipales a pesar de tener esa incidencia. Partiendo de esa base, la Ley establecerá con la debida separación las rentas y gastos nacionales y los municipales.',
      chapter: c82,
      number: 245,
      new: false)

    puts 'creating article 246'
    a246 = Article.create!(content: 'Serán fuentes de ingreso municipal, además de las que señale la Ley conforme al artículo anterior, las siguientes:',
      chapter: c82,
      number: 246,
      new: false)

      puts 'creating subarticles for article 246'
      sa246001 = Subarticle.create!(content: "El producto de sus áreas o ejidos lo mismo que de sus bienes propios.",
        article: a246,
        number: 1)

      puts 'creating subarticles for article 246'
      sa246002 = Subarticle.create!(content: "Las tasas por el uso de sus bienes o servicios.",
        article: a246,
        number: 2)

      puts 'creating subarticles for article 246'
      sa246003 = Subarticle.create!(content: "Los derechos sobre espectáculos públicos.",
        article: a246,
        number: 3)

      puts 'creating subarticles for article 246'
      sa246004 = Subarticle.create!(content: "Los impuestos sobre expendio de bebidas alcohólicas.",
        article: a246,
        number: 4)

      puts 'creating subarticles for article 246'
      sa246005 = Subarticle.create!(content: "Los derechos, determinados por la Ley, sobre extracción de arena, piedra de cantera, tosca, arcilla, coral, cascajo y piedra caliza.",
        article: a246,
        number: 5)

      puts 'creating subarticles for article 246'
      sa246006 = Subarticle.create!(content: "Las multas que impongan las autoridades municipales.",
        article: a246,
        number: 6)

      puts 'creating subarticles for article 246'
      sa246007 = Subarticle.create!(content: "Las subvenciones estatales y las donaciones.",
        article: a246,
        number: 7)

      puts 'creating subarticles for article 246'
      sa246008 = Subarticle.create!(content: "Los derechos sobre extracción de madera, explotación y tala de bosques.",
        article: a246,
        number: 8)

      puts 'creating subarticles for article 246'
      sa246009 = Subarticle.create!(content: "El impuesto de degüello de ganado vacuno y porcino que se pagará en el Municipio de donde proceda la res.",
        article: a246,
        number: 9)

    puts 'creating article 247'
    a247 = Article.create!(content: 'Los Municipios podrán crear empresas municipales o mixtas para la explotación de bienes o servicios.',
      chapter: c82,
      number: 247,
      new: false)

    puts 'creating article 248'
    a248 = Article.create!(content: 'El Estado no podrá conceder exenciones de derechos, tasas o impuestos municipales. Los Municipios sólo podrán hacerlo mediante acuerdo municipal.',
      chapter: c82,
      number: 248,
      new: false)

    puts 'creating article 249'
    a249 = Article.create!(content: 'Los Municipios podrán contratar empréstitos previa autorización del Órgano Ejecutivo. La Ley determinará el procedimiento.',
      chapter: c82,
      number: 249,
      new: false)

    puts 'creating article 250'
    a250 = Article.create!(content: 'En cada Corregimiento habrá una Junta Comunal que promoverá el desarrollo de la colectividad y velará por la solución de sus problemas. /n
    Las Juntas Comunales podrán ejercer funciones de conciliación voluntaria y otras que la Ley les señale.',
      chapter: c82,
      number: 250,
      new: false)

    puts 'creating article 251'
    a251 = Article.create!(content: 'La Junta Comunal estará compuesta por el Representante de Corregimiento, quien la presidirá, y cuatro ciudadanos residentes del corregimiento escogidos en la forma que determine la Ley.',
      chapter: c82,
      number: 251,
      new: false)


  # puts 'creating chapter 3'
  # c83 = Chapter.create!(number: 3,
  #   description: "El Régimen Municipal",
  #   title: t8)

    puts 'creating article 252'
    a252 = Article.create!(content: 'En cada Provincia habrá un Gobernador de libre nombramiento y remoción del Órgano Ejecutivo, quien será representante de éste en su circunscripción. Cada Gobernador tendrá un suplente designado también por el Órgano Ejecutivo. /n
      La Ley determinará las funciones y deberes de los Gobernadores.',
      chapter: c82,
      number: 252,
      new: false)

    puts 'creating article 253'
    a253 = Article.create!(content: 'Las Provincias tendrán el número de Distritos que la Ley disponga.',
      chapter: c82,
      number: 253,
      new: false)

    puts 'creating article 254'
    a254 = Article.create!(content: 'En cada Provincia funcionará un Concejo Provincial, integrado por todos los Representantes de Corregimientos de la respectiva Provincia y los demás miembros que la Ley determine al reglamentar su organización y funcionamiento, teniendo estos últimos únicamente derecho a voz. Cada Concejo Provincial elegirá su Presidente y su Junta Directiva, dentro de los respectivos Representantes de Corregimientos y dictará su reglamento interno. /n
    El Gobernador de la Provincia y los Alcaldes de Distritos asistirán con derecho a voz a las reuniones del Concejo Provincial.',
      chapter: c82,
      number: 254,
      new: false)

    puts 'creating article 255'
    a255 = Article.create!(content: 'Son funciones del Concejo Provincial, sin perjuicio de otras que la Ley señale, las siguientes:',
      chapter: c82,
      number: 255,
      new: false)

      puts 'creating subarticles for article 255'
      sa255001 = Subarticle.create!(content: "Actuar como órgano de consulta del Gobernador de la Provincia, de las autoridades provinciales y de las autoridades nacionales en general.",
        article: a255,
        number: 1)

      puts 'creating subarticles for article 255'
      sa255002 = Subarticle.create!(content: "Requerir informes de los funcionarios nacionales, provinciales y municipales en relación con asuntos concernientes a la Provincia. /n
      Para estos efectos, los funcionarios provinciales y municipales están obligados, cuando los Concejos Provinciales así lo soliciten, a comparecer personalmente ante éstos a rendir informes verbales. Los funcionarios nacionales pueden rendir sus informes por escrito.",
        article: a255,
        number: 2)

      puts 'creating subarticles for article 255'
      sa255003 = Subarticle.create!(content: "Preparar cada año, para la consideración del Órgano Ejecutivo, el plan de obras públicas, de inversiones y de servicios de la Provincia y fiscalizar su ejecución.",
        article: a255,
        number: 3)

      puts 'creating subarticles for article 255'
      sa255004 = Subarticle.create!(content: "Supervisar la marcha de los servicios públicos que se presten en su respectiva Provincia.",
        article: a255,
        number: 4)

      puts 'creating subarticles for article 255'
      sa255005 = Subarticle.create!(content: "Recomendar a la Asamblea Nacional los cambios que estime convenientes en las divisiones políticas de la Provincia.",
        article: a255,
        number: 5)

      puts 'creating subarticles for article 255'
      sa255006 = Subarticle.create!(content: "Solicitar a las autoridades nacionales y provinciales estudios y programas de interés provincial.",
        article: a255,
        number: 6)

    puts 'creating article 256'
    a256 = Article.create!(content: 'El Concejo Provincial se reunirá en sesiones ordinarias una vez al mes, en la capital de la Provincia que el Concejo determine, y en sesiones extraordinarias cuando lo convoque su Presidente o a solicitud no menos de la tercera parte de sus miembros.',
      chapter: c82,
      number: 256,
      new: false)



puts "creating title 9"
t9 = Title.create!(number: 9,
  description: "LA HACIENDA PÚBLICA",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c91 = Chapter.create!(number: 1,
    description: "Bienes y Derechos del Estado",
    title: t9)

    puts 'creating article 257'
    a257 = Article.create!(content: 'Pertenecen al Estado:',
      chapter: c91,
      number: 257,
      new: false)

      puts 'creating subarticles for article 257'
      sa257001 = Subarticle.create!(content: "Los bienes existentes en el territorio que pertenecieron a la República de Colombia.",
        article: a257,
        number: 1)

      puts 'creating subarticles for article 257'
      sa257002 = Subarticle.create!(content: "Los derechos y acciones que la República de Colombia poseyó como dueña, dentro o fuera del país, por razón de la soberanía que ejerció sobre el territorio del Istmo de Panamá.",
        article: a257,
        number: 2)

      puts 'creating subarticles for article 257'
      sa257003 = Subarticle.create!(content: "Los bienes, rentas, fincas, valores, derechos y acciones que pertenecieron al extinguido Departamento de Panamá.",
        article: a257,
        number: 3)

      puts 'creating subarticles for article 257'
      sa257004 = Subarticle.create!(content: "Las tierras baldías o indultadas.",
        article: a257,
        number: 4)

      puts 'creating subarticles for article 257'
      sa257005 = Subarticle.create!(content: "Las riquezas del subsuelo, que podrán ser explotadas por empresas estatales o mixtas o ser objeto de concesiones o contratos para su explotación según lo establezca la Ley. Los derechos mineros otorgados y no ejercidos dentro del término y condiciones que fije la Ley, revertirán al Estado.",
        article: a257,
        number: 5)

      puts 'creating subarticles for article 257'
      sa257006 = Subarticle.create!(content: "Las salinas, las minas, las aguas subterráneas y termales, depósitos de hidrocarburos, las canteras y los yacimientos de toda clase que no podrán ser objeto de apropiación privada, pero podrán ser explotados directamente por el Estado, mediante empresas estatales o mixtas, o ser objeto de concesión u otros contratos para su explotación, por empresas privadas. La Ley reglamentará todo lo concerniente a las distintas formas de explotación señaladas en este ordinal.",
        article: a257,
        number: 6)

      puts 'creating subarticles for article 257'
      sa257007 = Subarticle.create!(content: "Los monumentos históricos, documentos y otros bienes que son testimonio del pasado de la Nación. La Ley señalará el procedimiento por medio del cual revertirán al Estado tales bienes cuando se encuentren bajo la tenencia de particulares por cualquier título.",
        article: a257,
        number: 7)

      puts 'creating subarticles for article 257'
      sa257008 = Subarticle.create!(content: "Los sitios y objetos arqueológicos, cuya explotación, estudio y rescate serán regulados por la Ley.",
        article: a257,
        number: 8)

    puts 'creating article 258'
    a258 = Article.create!(content: 'Pertenecen al Estado y son de uso público y, por consiguiente, no pueden ser objeto de apropiación privada:',
      chapter: c91,
      number: 258,
      new: false)

      puts 'creating subarticles for article 258'
      sa258001 = Subarticle.create!(content: "El mar territorial y las aguas lacustres y fluviales, las playas y riberas de las mismas y de los ríos navegables, y los puertos y esteros. Todos estos bienes son de aprovechamiento libre y común, sujetos a la reglamentación que establezca la Ley.",
        article: a258,
        number: 1)

      puts 'creating subarticles for article 258'
      sa258002 = Subarticle.create!(content: "Las tierras y las aguas destinadas a servicios públicos y a toda clase de comunicaciones.",
        article: a258,
        number: 2)

      puts 'creating subarticles for article 258'
      sa258003 = Subarticle.create!(content: "Las tierras y las aguas destinadas o que el Estado destine a servicios públicos de irrigación, de producción hidroeléctrica, de desagües y de acueductos.",
        article: a258,
        number: 3)

      puts 'creating subarticles for article 258'
      sa258004 = Subarticle.create!(content: "El espacio aéreo, la plataforma continental submarina, el lecho y el subsuelo del mar territorial.",
        article: a258,
        number: 4)

      puts 'creating subarticles for article 258'
      sa258005 = Subarticle.create!(content: "Los demás bienes que la Ley defina como de uso público.",
        article: a258,
        number: 5)

      puts 'creating subarticles for article 258'
      sa258006 = Subarticle.create!(content: "En todos los casos en que los bienes de propiedad privada se conviertan por disposición legal en bienes de uso público, el dueño de ellos será indemnizado.",
        article: a258,
        number: 6)

    puts 'creating article 259'
    a259 = Article.create!(content: 'Las concesiones para la explotación del suelo, del subsuelo, de los bosques y para la utilización de agua, de medios de comunicación o transporte y de otras empresas de servicio público, se inspirarán en el bienestar social y el interés público.',
      chapter: c91,
      number: 259,
      new: false)

    puts 'creating article 260'
    a260 = Article.create!(content: 'La riqueza artística e histórica del país constituye el Patrimonio Cultural de la Nación y estará bajo la salvaguarda del Estado el cual prohibirá su destrucción, exportación o transmisión.',
      chapter: c91,
      number: 260,
      new: false)

    puts 'creating article 261'
    a261 = Article.create!(content: 'La facultad de emitir moneda pertenece al Estado, el cual podrá transferirla a bancos oficiales de emisión, en la forma que determine la Ley.',
      chapter: c91,
      number: 261,
      new: false)

    puts 'creating article 262'
    a262 = Article.create!(content: 'No habrá en la República papel moneda de curso forzoso.',
      chapter: c91,
      number: 262,
      new: false)

    puts 'creating article 263'
    a263 = Article.create!(content: 'La Ley creará y reglamentará bancos oficiales o semioficiales que funcionen como entidades autónomas vigiladas por el Estado y determinará las responsabilidades subsidiarias de éste con respecto a las obligaciones que esas instituciones contraigan. La Ley reglamentará el régimen bancario.',
      chapter: c91,
      number: 263,
      new: false)

    puts 'creating article 264'
    a264 = Article.create!(content: 'La Ley procurará, hasta donde sea posible, dentro de la necesidad de arbitrar fondos públicos y de proteger la producción nacional, que todo impuesto grave al contribuyente en proporción directa a su capacidad económica.',
      chapter: c91,
      number: 264,
      new: false)

    puts 'creating article 265'
    a265 = Article.create!(content: 'Podrán establecerse por la Ley, como arbitrio rentístico, monopolios oficiales sobre artículos importados o que no se produzcan en el país. /n
    Al establecer un monopolio en virtud del cual quede privada cualquier persona del ejercicio de una industria o negocio lícito, el Estado resarcirá previamente a las personas o empresas cuyo negocio haya sido expropiado en los términos a que se refiere este artículo.',
      chapter: c91,
      number: 265,
      new: false)

    puts 'creating article 266'
    a266 = Article.create!(content: 'La ejecución o reparación de obras nacionales, las compras que se efectúen con fondos del Estado, de sus entidades autónomas o semiautónomas o de los Municipios y la venta o arrendamiento de bienes pertenecientes a los mismos se harán, salvo las excepciones que determine la Ley, mediante licitación pública. /n
    La Ley establecerá las medidas que aseguren en toda licitación el mayor beneficio para el Estado y plena justicia en la adjudicación.',
      chapter: c91,
      number: 266,
      new: false)


  puts 'creating chapter 2'
  c92 = Chapter.create!(number: 2,
    description: "El Presupuesto General del Estado",
    title: t9)

    puts 'creating article 267'
    a267 = Article.create!(content: 'Corresponde al Órgano Ejecutivo la elaboración del proyecto de Presupuesto General del Estado y al Órgano Legislativo su examen, modificación, rechazo o aprobación.',
      chapter: c92,
      number: 267,
      new: false)

    puts 'creating article 268'
    a268 = Article.create!(content: 'El Presupuesto tendrá carácter anual y contendrá la totalidad de las inversiones, ingresos y egresos del sector público, que incluye a las entidades autónomas, semiautónomas y empresas estatales.',
      chapter: c92,
      number: 268,
      new: false)

      puts 'creating metadata for article 268'
      m268 = Metadatum.create!(content: "El Presupuesto tendrá carácter anual y contendrá la totalidad de las Inversiones, ingresos y gastos del sector público, que incluye a las entidades autónomas, semiautónomas y empresas estatales.",
        article: a268)

    puts 'creating article 269'
    a269 = Article.create!(content: 'El Órgano Ejecutivo celebrará consultas presupuestarias con las diferentes dependencias y entidades del Estado. /n
    La Comisión de Presupuesto de la Asamblea Nacional participará en dichas consultas.',
      chapter: c92,
      number: 269,
      new: false)

    puts 'creating article 269'
    a269 = Article.create!(content: 'El Órgano Ejecutivo celebrará consultas presupuestarias con las diferentes dependencias y entidades del Estado. /n
    La Comisión de Presupuesto de la Asamblea Nacional participará en dichas consultas.',
      chapter: c92,
      number: 269,
      new: false)

    puts 'creating article 270'
    a270 = Article.create!(content: 'En el Presupuesto elaborado por el Órgano Ejecutivo los egresos estarán equilibrados con los ingresos.',
      chapter: c92,
      number: 270,
      new: false)

    puts 'creating article 271'
    a271 = Article.create!(content: 'La Asamblea Nacional podrá eliminar o reducir las partidas de Los egresos previstos en el proyecto de Presupuesto, salvo las destinadas al Servicio de la deuda pública, al cumplimiento de las demás obligaciones Contractuales del Estado y al financiamiento de las inversiones públicas Previamente autorizadas por la Ley. /n
    La Asamblea Nacional no podrá aumentar ninguna de las erogaciones Previstas en el proyecto de Presupuesto o incluir una nueva erogación, sin la Aprobación del Consejo de Gabinete, ni aumentar el cálculo de los ingresos sin El concepto favorable del Contralor General de la República.  /n
    Si conforme a lo previsto en este artículo, se eleva el cálculo de los Ingresos o sise elimina o disminuye alguna de las partidas de egresos, la Asamblea Nacional podrá aplicar las cantidades así disponibles a otros gastos o inversiones, siempre que obtenga la aprobación del Consejo de Gabinete.',
      chapter: c92,
      number: 271,
      new: false)

    puts 'creating article 272'
    a272 = Article.create!(content: 'Si el proyecto de Presupuesto General del Estado no fuere votado a más tardar el primer día del año fiscal correspondiente, entrará en vigencia el proyecto propuesto por el Órgano Ejecutivo, el cual lo adoptará mediante decisión del Consejo de Gabinete.',
      chapter: c92,
      number: 272,
      new: false)

    puts 'creating article 273'
    a273 = Article.create!(content: 'Si la Asamblea Nacional rechaza el proyecto de Presupuesto General del Estado, se considerará automáticamente prorrogado el Presupuesto del ejercicio anterior hasta que se apruebe el nuevo Presupuesto y también automáticamente aprobadas las partidas previstas en el proyecto de Presupuesto rechazado respecto al servicio de la deuda pública, el cumplimiento de las demás obligaciones contractuales del Estado y el financiamiento de las inversiones públicas previamente autorizadas por la Ley.',
      chapter: c92,
      number: 273,
      new: false)

    puts 'creating article 274'
    a274 = Article.create!(content: 'Cualquier crédito suplementario o extraordinario referente al Presupuesto vigente, será solicitado por el Órgano Ejecutivo y aprobado por la Asamblea Nacional en la forma que señale la Ley.',
      chapter: c92,
      number: 274,
      new: false)

    puts 'creating article 275'
    a275 = Article.create!(content: 'Cuando en cualquier época del año, el Órgano Ejecutivo considere fundadamente que el total de los ingresos disponibles es inferior al total de los gastos autorizados en el Presupuesto General del Estado, adoptará un plan de ajuste del gasto, que será aprobado según lo establezca la Ley. /n
    Los ajustes a los presupuestos de los Órganos Legislativo y Judicial, del Ministerio Público, del Tribunal Electoral, la Defensoría del Pueblo y la Contraloría General de la República no serán porcentualmente superiores, en cada una de estas instituciones, al ajuste del Presupuesto General del Estado, y afectarán los renglones que estas determinen.',
      chapter: c92,
      number: 275,
      new: false)

    puts 'creating article 276'
    a276 = Article.create!(content: 'La Asamblea Nacional no podrá expedir Leyes que deroguen o modifiquen las que establezcan ingresos comprendidos en el Presupuesto, sin que al mismo tiempo establezca nuevas rentas sustitutivas o aumente las existentes, previo informe de la Contraloría General de la República sobre la efectividad fiscal de las mismas.',
      chapter: c92,
      number: 276,
      new: false)

    puts 'creating article 277'
    a277 = Article.create!(content: 'No podrá hacerse ningún gasto público que no haya sido autorizado de acuerdo con la Constitución o la Ley. Tampoco podrá transferirse ningún crédito a un objeto no previsto en el respectivo Presupuesto.',
      chapter: c92,
      number: 277,
      new: false)

    puts 'creating article 278'
    a278 = Article.create!(content: 'Todas las entradas y salidas de los tesoros públicos deben estar incluidas y autorizadas en el Presupuesto respectivo. No se percibirán entradas por impuestos que la Ley no haya establecido ni se pagarán gastos no previstos en el Presupuesto.',
      chapter: c92,
      number: 278,
      new: false)


  puts 'creating chapter 3'
  c93 = Chapter.create!(number: 3,
    description: "La Contraloría General de la República",
    title: t9)

    puts 'creating article 279'
    a279 = Article.create!(content: 'Habrá un organismo estatal independiente, denominado Contraloría General de la República, cuya dirección estará a cargo de un funcionario público que se denominará Contralor General, secundado por un Subcontralor, quienes serán nombrados para un periodo igual al del Presidente de la República, dentro del cual no podrán ser suspendidos ni removidos, sino por la Corte Suprema de Justicia, en virtud de causas definidas por la Ley. /n
    Ambos serán nombrados para que entren en funciones a partir del primero de enero después de iniciado cada periodo presidencial ordinario.  /n
    Para ser Contralor y Subcontralor de la República se requiere ser ciudadano panameño por nacimiento; tener título universitario y treinta y cinco años o más de edad, y no haber sido condenado por delito doloso con pena privativa de la libertad de cinco años o más, mediante sentencia ejecutoriada, proferida por un tribunal de justicia.',
      chapter: c93,
      number: 279,
      new: false)

    puts 'creating article 280'
    a280 = Article.create!(content: 'Son funciones de la Contraloría General de la República, además de las que señale la Ley, las siguientes:',
      chapter: c93,
      number: 280,
      new: false)

      puts 'creating subarticles for article 280'
      sa280001 = Subarticle.create!(content: "Efectuar las inscripciones de nacimientos, matrimonios, defunciones, naturalizaciones y demás hechos y actos jurídicos relacionados con el estado civil de las personas, y hacer las anotaciones procedentes en las respectivas inscripciones.",
        article: a280,
        number: 1)

      puts 'creating subarticles for article 280'
      sa280002 = Subarticle.create!(content: "Llevar las cuentas nacionales, incluso las referentes a las deudas interna y externa.",
        article: a280,
        number: 2)

      puts 'creating subarticles for article 280'
      sa280003 = Subarticle.create!(content: "Fiscalizar y regular, mediante el control previo o posterior, todos los actos de manejo de fondos y otros bienes públicos, a fin de que se realicen con corrección, según lo establecido en la Ley. La Contraloría determinará los casos en que ejercerá tanto el control previo como el posterior sobre los actos de manejo, al igual que aquellos en que solo ejercerá este último.",
        article: a280,
        number: 3)

      puts 'creating subarticles for article 280'
      sa280004 = Subarticle.create!(content: "Realizar inspecciones e investigaciones tendientes a determinar la corrección o incorrección de las operaciones que afecten patrimonios públicos y, en su caso, presentar las denuncias respectivas.",
        article: a280,
        number: 4)

      puts 'creating subarticles for article 280'
      sa280005 = Subarticle.create!(content: "Recabar de los funcionarios públicos correspondientes informes sobre la gestión fiscal de las dependencias públicas, nacionales, provinciales, municipales, autónomas o semiautónomas y de las empresas estatales.",
        article: a280,
        number: 5)

      puts 'creating subarticles for article 280'
      sa280006 = Subarticle.create!(content: "Establecer y promover la adopción de las medidas necesarias para que se hagan efectivos los créditos a favor de las entidades públicas.",
        article: a280,
        number: 6)

      puts 'creating subarticles for article 280'
      sa280007 = Subarticle.create!(content: "Demandar la declaratoria de inconstitucionalidad o de ilegalidad, según los casos, de las leyes y demás actos violatorios de la Constitución o de la Ley que afecten patrimonios públicos. ",
        article: a280,
        number: 7)

      puts 'creating subarticles for article 280'
      sa280008 = Subarticle.create!(content: "Establecer los métodos de contabilidad de las dependencias públicas señaladas en el numeral 5 de este artículo.",
        article: a280,
        number: 8)

      puts 'creating subarticles for article 280'
      sa280009 = Subarticle.create!(content: "Informar a la Asamblea Nacional y al Órgano Ejecutivo sobre el estado financiero de la Administración Pública y emitir concepto sobre la viabilidad y conveniencia de la expedición de créditos supleméntales o extraordinarios.",
        article: a280,
        number: 9)

      puts 'creating subarticles for article 280'
      sa2800010 = Subarticle.create!(content: "Dirigir y formar la estadística nacional.",
        article: a280,
        number: 10)

      puts 'creating subarticles for article 280'
      sa2800011 = Subarticle.create!(content: "Nombrar a los empleados de sus departamentos de acuerdo con esta Constitución y la Ley.",
        article: a280,
        number: 11)

      puts 'creating subarticles for article 280'
      sa2800012 = Subarticle.create!(content: "Presentar al Órgano Ejecutivo y a la Asamblea Nacional el informe anual de sus actividades.",
        article: a280,
        number: 12)

      puts 'creating subarticles for article 280'
      sa2800013 = Subarticle.create!(content: "Presentar para su juzgamiento, a través del Tribunal de Cuentas, las cuentas de los agentes y servidores públicos de manejo cuando surjan reparos por razón de supuestas irregularidades.",
        article: a280,
        number: 13)


  puts 'creating chapter 1'
  c94 = Chapter.create!(number: 1,
    description: "Tribunal de Cuentas",
    title: t9)

    puts 'creating article 281'
    a281 = Article.create!(content: 'Se establece la Jurisdicción de Cuentas, con competencia y jurisdicción nacional, para juzgar las cuentas de los agentes y empleados de manejo, cuando surjan reparos de estas por razón de supuestas irregularidades. /n
    El Tribunal de Cuentas se compondrá de tres Magistrados, los cuales serán designados para un periodo de diez años así: uno por el Órgano Legislativo, otro por el Órgano Ejecutivo y el tercero por la Corte Suprema de Justicia.  /n
    La Ley determinará la creación y funcionamiento del Tribunal de Cuentas.',
      chapter: c94,
      number: 281,
      new: false)



puts "creating title 10"
t10 = Title.create!(number: 10,
  description: "LA ECONOMÍA NACIONAL",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c101 = Chapter.create!(number: 0,
    description: "xxx",
    title: t10)

    puts 'creating article 282'
    a282 = Article.create!(content: 'El ejercicio de las actividades económicas corresponde primordialmente a los particulares; pero el Estado las orientará, dirigirá, reglamentará, reemplazará o creará, según las necesidades sociales y dentro de las normas del presente Título, con el fin de acrecentar la riqueza nacional y de asegurar sus beneficios para el mayor número posible de los habitantes del país.  /n
    El Estado planificará el desarrollo económico y social, mediante organismos o departamentos especializados cuya organización y funcionamiento determinará la Ley.',
      chapter: c101,
      number: 282,
      new: false)

    puts 'creating article 283'
    a283 = Article.create!(content: 'Para realizar los fines de que trata el artículo anterior, la Ley dispondrá que se tomen las medidas siguientes:',
      chapter: c101,
      number: 283,
      new: false)

      puts 'creating subarticles for article 283'
      sa283001 = Subarticle.create!(content: "Crear comisiones de técnicos o de especialistas para que estudien las condiciones y posibilidades en todo tipo de actividades económicas y formulen recomendaciones para desarrollarlas.",
        article: a283,
        number: 1)

      puts 'creating subarticles for article 283'
      sa283002 = Subarticle.create!(content: "Promover la creación de empresas particulares que funcionen de acuerdo con las recomendaciones mencionadas en el aparte anterior, establecer empresas estatales e impulsar la creación de las mixtas, en las cuales participará el Estado, y podrá crear las estatales, para atender las necesidades sociales y la seguridad e intereses públicos.",
        article: a283,
        number: 2)

      puts 'creating subarticles for article 283'
      sa283003 = Subarticle.create!(content: "Fundar instituciones de crédito y de fomento o establecer otros medios adecuados con el fin de dar facilidades a los que se dediquen a actividades económicas en pequeña escala.",
        article: a283,
        number: 3)

      puts 'creating subarticles for article 283'
      sa283004 = Subarticle.create!(content: "Establecer centros teórico-prácticos para la enseñanza del comercio, la agricultura, la ganadería y el turismo, los oficios y las artes, incluyendo en estas últimas las manuales, y para la formación de obreros y directores industriales especializados.",
        article: a283,
        number: 4)

    puts 'creating article 284'
    a284 = Article.create!(content: 'El Estado intervendrá en toda clase de empresas, dentro de la reglamentación que establezca la Ley, para hacer efectiva la justicia social a que se refiere la presente Constitución y, en especial, para los siguientes fines:',
      chapter: c101,
      number: 284,
      new: false)

      puts 'creating subarticles for article 284'
      sa284001 = Subarticle.create!(content: "Regular por medio de organismos especiales las tarifas, los servicios y los precios de los artículos de cualquier naturaleza, y especialmente los de primera necesidad.",
        article: a284,
        number: 1)

      puts 'creating subarticles for article 284'
      sa284002 = Subarticle.create!(content: "Exigir la debida eficacia en los servicios y la adecuada calidad de los artículos mencionados en el aparte anterior.",
        article: a284,
        number: 2)

      puts 'creating subarticles for article 284'
      sa284003 = Subarticle.create!(content: "Coordinar los servicios y la producción de artículos. La Ley definirá los artículos de primera necesidad.",
        article: a284,
        number: 3)

    puts 'creating article 285'
    a285 = Article.create!(content: 'La mayor parte del capital de las empresas privadas de utilidad pública que funcionen en el país, deberá ser panameña, salvo las excepciones que establezca la Ley, que también deberá definirlas.',
      chapter: c101,
      number: 285,
      new: false)

    puts 'creating article 286'
    a286 = Article.create!(content: 'El Estado creará por medio de entidades autónomas o semiautónomas o por otros medios adecuados, empresas de utilidad pública. En igual forma asumirá, cuando así fuere necesario al bienestar colectivo y mediante expropiación e indemnización, el dominio de las empresas de utilidad pública pertenecientes a particulares, si en cada caso lo autoriza la Ley.',
      chapter: c101,
      number: 286,
      new: false)

    puts 'creating article 287'
    a287 = Article.create!(content: 'El Estado podrá crear en las áreas o regiones cuyo grado de desarrollo social y económico lo requiera instituciones autónomas o semiautónomas, nacionales, regionales o municipales, que promuevan el desarrollo integral del sector o región y que podrán coordinar los programas estatales y municipales en cooperación con los Concejos Municipales o Intermunicipales. La Ley reglamentará la organización, jurisdicción, financiamiento y fiscalización de dichas entidades de desarrollo.',
      chapter: c101,
      number: 287,
      new: false)

    puts 'creating article 288'
    a288 = Article.create!(content: 'Es deber del Estado el fomento y fiscalización de las cooperativas y para tales fines creará las instituciones necesarias. La Ley establecerá un régimen especial para su organización, funcionamiento, reconocimiento e inscripción, que será gratuita.',
      chapter: c101,
      number: 288,
      new: false)

    puts 'creating article 289'
    a289 = Article.create!(content: 'El Estado regulará la adecuada utilización de la tierra de conformidad con su uso potencial y los programas nacionales de desarrollo, con el fin de garantizar su aprovechamiento óptimo.',
      chapter: c101,
      number: 289,
      new: false)

    puts 'creating article 290'
    a290 = Article.create!(content: 'Ningún gobierno extranjero ni entidad o institución oficial o semioficial extranjera podrán adquirir el dominio sobre ninguna parte del territorio nacional, salvo cuando se trate de las sedes de embajadas de conformidad con lo que disponga la Ley.',
      chapter: c101,
      number: 290,
      new: false)

    puts 'creating article 291'
    a291 = Article.create!(content: 'Las personas naturales o jurídicas extranjeras y las nacionales cuyo capital sea extranjero, en todo o en parte, no podrán adquirir la propiedad de tierras nacionales o particulares situadas a menos de diez kilómetros de las fronteras. /n
      El territorio insular sólo podrá enajenarse para fines específicos de desarrollo del país y bajo las siguientes condiciones:',
      chapter: c101,
      number: 291,
      new: false)

      puts 'creating subarticles for article 291'
      sa291001 = Subarticle.create!(content: "Cuando no sea considerado área estratégica o reservada para programas gubernamentales.",
        article: a291,
        number: 1)

      puts 'creating subarticles for article 291'
      sa291002 = Subarticle.create!(content: "Cuando sea declarado área de desarrollo especial y se haya dictado legislación sobre su aprovechamiento, siempre que se garantice la Seguridad Nacional.",
        article: a291,
        number: 2)

      puts 'creating subarticles for article 291'
      sa00291 = Subarticle.create!(content: "La enajenación del territorio insular no afecta la propiedad del Estado sobre los bienes de uso público. En los casos anteriores se respetarán los derechos legítimamente adquiridos al entrar a regir esta Constitución; pero los bienes correspondientes podrán ser expropiados en cualquier tiempo, mediante pago de la indemnización adecuada.",
        article: a291,
        number: 2000)

    puts 'creating article 292'
    a292 = Article.create!(content: 'No habrá bienes que no sean de libre enajenación ni obligaciones irredimibles, salvo lo dispuesto en los artículos 62 y 127. Sin embargo valdrán hasta un término máximo de veinte años las limitaciones temporales al derecho de enajenar y las condiciones o modalidades que suspendan o retarden la redención de las obligaciones.',
      chapter: c101,
      number: 292,
      new: false)

    puts 'creating article 293'
    a293 = Article.create!(content: 'Sólo podrán ejercer el comercio al por menor:',
      chapter: c101,
      number: 293,
      new: false)

      puts 'creating subarticles for article 293'
      sa293001 = Subarticle.create!(content: "Los panameños por nacimiento.",
        article: a293,
        number: 1)

      puts 'creating subarticles for article 293'
      sa293002 = Subarticle.create!(content: "Los individuos que al entrar en vigencia esta Constitución estén naturalizados y sean casados con nacional panameño o panameña o tengan hijos con nacional panameño o panameña.",
        article: a293,
        number: 2)

      puts 'creating subarticles for article 293'
      sa293003 = Subarticle.create!(content: "Los panameños por naturalización que no se encuentren en el caso anterior, después de tres años de la fecha en que hubieren obtenido su carta definitiva.",
        article: a293,
        number: 3)

      puts 'creating subarticles for article 293'
      sa293004 = Subarticle.create!(content: "Las personas jurídicas nacionales o extranjeras y las naturales extranjeras que a la fecha de la vigencia de esta Constitución estuvieron ejerciendo el comercio al por menor de acuerdo con la Ley.",
        article: a293,
        number: 4)

      puts 'creating subarticles for article 293'
      sa293005 = Subarticle.create!(content: "Las personas jurídicas formadas por panameños o por extranjeros facultados para ejercerlo individualmente de acuerdo con este artículo, y también las que, sin estar constituidas en la forma aquí expresadas, ejerzan el comercio al por menor en el momento de entrar en vigencia esta Constitución. Los extranjeros no autorizados para ejercer el comercio al por menor podrán, sin embargo, tener participación en aquellas compañías que vendan productos manufacturados por ellas mismas.",
        article: a293,
        number: 5)

      puts 'creating subarticles for article 293'
      sa00293 = Subarticle.create!(content: "Ejercer el comercio al por menor significa dedicarse a la venta al consumidor o la representación o agencia de empresas productoras o mercantiles o cualquiera otra actividad que la Ley clasifique como perteneciente a dicho comercio.",
        article: a293,
        number: 2000)

      puts 'creating subarticles for article 293'
      sa00293 = Subarticle.create!(content: "Se exceptúan de esta regla los casos en que el agricultor o fabricante de industrias manuales vendan sus propios productos. La Ley establecerá un sistema de vigilancia y sanciones para impedir que quienes de acuerdo con este artículo no puedan ejercer el comercio al por menor, lo hagan por medio de interpuesta persona o en cualquier otra forma fraudulenta.",
        article: a293,
        number: 2001)

    puts 'creating article 294'
    a294 = Article.create!(content: 'Se entiende por comercio al por mayor el que no está comprendido en la disposición anterior, y podrá ejercerlo toda persona natural o jurídica.  /n
    La Ley podrá, sin embargo, cuando exista la necesidad de proteger el comercio al por mayor ejercido por panameños, restringir el ejercicio de dicho comercio por los extranjeros. Pero las restricciones no perjudicarán en ningún caso a los extranjeros que se encuentren ejerciendo legalmente el comercio al por mayor al entrar en vigor las correspondientes disposiciones.',
      chapter: c101,
      number: 294,
      new: false)

    puts 'creating article 295'
    a295 = Article.create!(content: 'Es prohibido en el comercio y en la industria toda combinación, contrato o acción cualquiera que tienda a restringir o imposibilitar el libre comercio y la competencia y que tenga efectos de monopolio en perjuicio del público.  /n
    Pertenece a este género la práctica de explotar una sola persona natural o jurídica, series o cadenas de establecimientos mercantiles al por menor en forma que haga ruinosa o tienda a eliminar la competencia del pequeño comerciante o industrial.  /n
    Habrá acción popular para impugnar ante los tribunales la celebración de cualquier combinación, contrato o acción que tenga por objeto el establecimiento de prácticas monopolizadoras, la Ley regulará esta materia.',
      chapter: c101,
      number: 295,
      new: false)

    puts 'creating article 296'
    a296 = Article.create!(content: 'La Ley reglamentará la caza, la pesca y el aprovechamiento de los bosques, de modo que permita asegurar su renovación y la permanencia de sus beneficios.',
      chapter: c101,
      number: 296,
      new: false)

    puts 'creating article 297'
    a297 = Article.create!(content: 'La explotación de juegos de suerte y azar y de actividades que originen apuestas, sólo podrán efectuarse por el Estado.  /n
    La Ley reglamentará los juegos, así como toda actividad que origine apuestas, cualquiera que sea el sistema de ellas.',
      chapter: c101,
      number: 297,
      new: false)

    puts 'creating article 298'
    a298 = Article.create!(content: 'El Estado velará por la libre competencia económica y la libre concurrencia en los mercados.  /n
    Las leyes fijarán las modalidades y condiciones que garanticen estos principios.',
      chapter: c101,
      number: 298,
      new: false)



puts "creating title 11"
t11 = Title.create!(number: 11,
  description: "LOS SERVIDORES PÚBLICOS",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c111 = Chapter.create!(number: 1,
    description: "Disposiciones Fundamentales",
    title: t11,
    new: false)

    puts 'creating article 299'
    a299 = Article.create!(content: 'Son servidores públicos las personas nombradas temporal o permanentemente en cargos del Órgano Ejecutivo, Legislativo y Judicial, de los Municipios, entidades autónomas o semiautónomas; y en general, las que perciban remuneración del Estado.',
      chapter: c111,
      number: 299,
      new: false)

    puts 'creating article 300'
    a300 = Article.create!(content: 'Los servidores públicos serán de nacionalidad panameña sin discriminación de raza, sexo, religión o creencia y militancia política. Su nombramiento y remoción no será potestad absoluta y discrecional de ninguna autoridad, salvo lo que al respecto dispone esta Constitución.  /n
    Los servidores públicos se regirán por el sistema de méritos; y la estabilidad en sus cargos estará condicionada a su competencia, lealtad y moralidad en el servicio.',
      chapter: c111,
      number: 300,
      new: false)

    puts 'creating article 301'
    a301 = Article.create!(content: 'Los estudiantes y egresados de instituciones educativas prestarán servicios temporales a la comunidad antes de ejercer libremente su profesión u oficio por razón de Servicio Civil obligatorio instituido por la presente Constitución. La Ley reglamentará esta materia.',
      chapter: c111,
      number: 301,
      new: false)


  puts 'creating chapter 2'
  c112 = Chapter.create!(number: 2,
    description: "Principios Básicos de la Administración de Personal",
    title: t11,
    new: false)

    puts 'creating article 302'
    a302 = Article.create!(content: 'Los deberes y derechos de los servidores públicos, así como los principios para los nombramientos, ascensos, suspensiones, traslados, destituciones, cesantía y jubilaciones serán determinados por la Ley.  /n
    Los nombramientos que recaigan en el personal de carrera se harán con base en el sistema de mérito.  /n
    Los servidores públicos están obligados a desempeñar personalmente sus funciones a las que dedicarán el máximo de sus capacidades y percibirán por las mismas una remuneración justa.',
      chapter: c112,
      number: 302,
      new: false)

    puts 'creating article 303'
    a303 = Article.create!(content: 'Los servidores públicos no podrán percibir dos o más sueldos pagados por el Estado, salvo los casos especiales que determine la Ley, ni desempeñar puestos con jornadas simultáneas de trabajo.  /n
    Las jubilaciones de los servidores públicos se fundarán en estudios actuariales y proporciones presupuestarias razonables',
      chapter: c112,
      number: 303,
      new: false)

    puts 'creating article 304'
    a304 = Article.create!(content: 'El Presidente y el Vicepresidente de la República, los Magistrados de la Corte Suprema de Justicia, de los Tribunales Ordinarios y Especiales, el Procurador General de la Nación y el de la Administración, los Jueces, los Ministros de Estado, el Contralor General de la República, el Presidente de la Asamblea Nacional, los Magistrados del Tribunal Electoral, los Magistrados del Tribunal de Cuentas, el Fiscal General Electoral, el Defensor del Pueblo, los Directores Generales, Gerentes o Jefes de Entidades Autónomas, los Directores Nacionales y Provinciales de los Servicios de Policía, empleados o funcionarios públicos de manejo conforme al Código Fiscal, deben presentar al inicio y al término de sus funciones una declaración jurada de su estado patrimonial, la cual deberán hacer mediante escritura pública, en un término de diez días hábiles a partir de la toma de posesión del cargo y diez días hábiles a partir de la separación.  /n
    El Notario realizará esta diligencia sin costo alguno. /n
    Esta disposición tiene efectos inmediatos, sin perjuicio de su reglamentación por medio de la Ley.',
      chapter: c112,
      number: 304,
      new: false)

      puts 'creating metadata for article 304'
      m304 = Metadatum.create!(content: "El Presidente y el Vicepresidente de la República, los Magistrados de la Corte Suprema de Justicia, los Magistrados del Tribunal Constitucional, de los Tribunales Ordinarios y Especiales, el Procurador General de la Nación y el de la Administración, los Jueces, los Ministros de Estado, el Contralor General de la República, el Presidente de la Asamblea Nacional, los Magistrados del Tribunal Electoral, los Magistrados del Tribunal de Cuentas, el Fiscal General Electoral, el Defensor del Pueblo, los Directores Generales, Gerentes o Jefes de Entidades Autónomas, los Directores Nacionales y Provinciales de los Servicios de Policía, empleados o funcionarios públicos de manejo conforme al Código Fiscal, deben presentar al inicio y al término de sus funciones una declaración jurada de su estado patrimonial, la cual deberán hacer mediante escritura pública, en un término de diez días hábiles a partir de la toma de posesión del cargo y diez días hábiles a partir de la separación.  /n
      El Notario realizará esta diligencia sin costo alguno.  /n
      Esta disposición tiene efectos inmediatos, sin perjuicio de su reglamentación por medio de ley. ",
        article: a304)


  puts 'creating chapter 3'
  c113 = Chapter.create!(number: 3,
    description: "Organización de la Administración de Personal",
    title: t11,
    new: false)

    puts 'creating article 305'
    a305 = Article.create!(content: 'Se instituyen las siguientes carreras en la función pública, conforme a los principios del sistema de méritos:',
      chapter: c113,
      number: 305,
      new: false)

      puts 'creating subarticles for article 305'
      sa305001 = Subarticle.create!(content: "La Carrera Administrativa.",
        article: a305,
        number: 1)

      puts 'creating subarticles for article 305'
      sa305002 = Subarticle.create!(content: "La Carrera Judicial.",
        article: a305,
        number: 2)

      puts 'creating subarticles for article 305'
      sa305003 = Subarticle.create!(content: "La Carrera Docente.",
        article: a305,
        number: 3)

      puts 'creating subarticles for article 305'
      sa305004 = Subarticle.create!(content: "La Carrera Diplomática y Consular.",
        article: a305,
        number: 4)

      puts 'creating subarticles for article 305'
      sa305005 = Subarticle.create!(content: "La Carrera de las Ciencias de la Salud.",
        article: a305,
        number: 5)

      puts 'creating subarticles for article 305'
      sa305006 = Subarticle.create!(content: "La Carrera Policial.",
        article: a305,
        number: 6)

      puts 'creating subarticles for article 305'
      sa305007 = Subarticle.create!(content: "La Carrera de las Ciencias Agropecuarias.",
        article: a305,
        number: 7)

      puts 'creating subarticles for article 305'
      sa305008 = Subarticle.create!(content: "La Carrera del Servicio Legislativo.",
        article: a305,
        number: 8)

      puts 'creating subarticles for article 305'
      sa305009 = Subarticle.create!(content: "Las otras que la Ley determine.",
        article: a305,
        number: 9)

      puts 'creating subarticles for article 305'
      sa00305 = Subarticle.create!(content: "La Ley regulará la estructura y organización de estas carreras de conformidad con las necesidades de la Administración.",
        article: a305,
        number: 2000)

    puts 'creating article 306'
    a306 = Article.create!(content: 'Las dependencias oficiales funcionarán a base de un Manual de Procedimientos y otro de Clasificación de Puestos.',
      chapter: c113,
      number: 306,
      new: false)

    puts 'creating article 307'
    a307 = Article.create!(content: 'No forman parte de las carreras públicas:',
      chapter: c113,
      number: 307,
      new: false)

      puts 'creating subarticles for article 307'
      sa307001 = Subarticle.create!(content: "Los servidores públicos cuyo nombramiento regula esta Constitución.",
        article: a307,
        number: 1)

      puts 'creating subarticles for article 307'
      sa307002 = Subarticle.create!(content: "Los Directores y Subdirectores Generales de entidades autónomas y semiautónomas, los servidores públicos nombrados por tiempo determinado o por periodos fijos establecidos por la Ley o los que sirvan cargos ad honorem.",
        article: a307,
        number: 2)

      puts 'creating subarticles for article 307'
      sa307003 = Subarticle.create!(content: "El personal de secretaría y de servicio inmediatamente adscrito a los servidores públicos que no forman parte de ninguna carrera.",
        article: a307,
        number: 3)

      puts 'creating subarticles for article 307'
      sa307004 = Subarticle.create!(content: "Los servidores públicos con mando y jurisdicción que no estén dentro de una carrera.",
        article: a307,
        number: 4)

      puts 'creating subarticles for article 307'
      sa307005 = Subarticle.create!(content: "Los profesionales, técnicos trabajadores manuales que se requieran para servicios temporales, interinos o transitorios en los Ministerios o en las instituciones autónomas y semiautónomas.",
        article: a307,
        number: 5)

      puts 'creating subarticles for article 307'
      sa307006 = Subarticle.create!(content: "Los servidores públicos cuyos cargos estén regulados por el Código de Trabajo.",
        article: a307,
        number: 6)

      puts 'creating subarticles for article 307'
      sa307007 = Subarticle.create!(content: "Los jefes de Misiones Diplomáticas que la Ley determine.",
        article: a307,
        number: 7)


  puts 'creating chapter 4'
  c114 = Chapter.create!(number: 4,
    description: "Disposiciones Generales",
    title: t11,
    new: false)

    puts 'creating article 308'
    a308 = Article.create!(content: 'Las disposiciones contenidas en los artículos 205, 208, 210, 211, 212 y 216, se aplicarán con arreglo a los preceptos establecidos en este Título.',
      chapter: c114,
      number: 308,
      new: false)

    puts 'creating article 309'
    a309 = Article.create!(content: 'Los servidores públicos no podrán celebrar por sí mismos o por interpuestas personas, contratos con la entidad u organismos en que trabajen cuando éstos sean lucrativos y de carácter ajeno al servicio que prestan.',
      chapter: c114,
      number: 309,
      new: false)



puts "creating title 12"
t12 = Title.create!(number: 12,
  description: "FUERZA PÚBLICA",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c121 = Chapter.create!(number: 0,
    description: "xxx",
    title: t12,
    new: false)

    puts 'creating article 310'
    a310 = Article.create!(content: 'La República de Panamá no tendrá ejército. /n
    Todos los panameños están obligados a tomar las armas para defender la independencia nacional y la integridad territorial del Estado.  /n
    Para la conservación del orden público, la protección de la vida, honra y bienes de quienes se encuentren bajo jurisdicción del Estado y para la prevención de hechos delictivos, la Ley organizará los servicios de policías necesarios, con mandos y escalafón separados.  /n
    Ante amenaza de agresión externa podrán organizarse temporalmente, en virtud de ley, servicios especiales de policía para la protección de las fronteras y espacios jurisdiccionales de la República. El Presidente de la República es el jefe de todos los servicios establecidos en el presente Título; y éstos, como agentes de la autoridad, estarán subordinados al poder civil; por tanto, acatarán las órdenes que emitan las autoridades nacionales, provinciales o municipales en el ejercicio de sus funciones legales.',
      chapter: c121,
      number: 310,
      new: false)

    puts 'creating article 311'
    a311 = Article.create!(content: 'Los servicios de policía no son deliberantes y sus miembros no podrán hacer manifestaciones o declaraciones políticas en forma individual o colectiva. Tampoco podrán intervenir en la política partidista, salvo la emisión del voto. El desacato a la presente norma será sancionado con la destitución inmediata del cargo, además de las sanciones que establezca la Ley.',
      chapter: c121,
      number: 311,
      new: false)

    puts 'creating article 312'
    a312 = Article.create!(content: 'Sólo el Gobierno podrá poseer armas y elementos de guerra. Para su fabricación y exportación, se requerirá permiso previo del Ejecutivo. La Ley definirá las armas que no deban considerarse como de guerra y reglamentará su importación, la fabricación y uso.',
      chapter: c121,
      number: 312,
      new: false)



puts "creating title 13"
t13 = Title.create!(number: 13,
  description: "REFORMA DE LA CONSTITUCIÓN",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c131 = Chapter.create!(number: 0,
    description: "xxx",
    title: t13,
    new: false)

    puts 'creating article 313'
    a313 = Article.create!(content: 'La iniciativa para proponer reformas constitucionales corresponde a la Asamblea Nacional, al Consejo de Gabinete o a la Corte Suprema de Justicia. Dichas reformas deberán ser aprobadas por uno de los siguientes procedimientos:',
      chapter: c131,
      number: 313,
      new: false)

      puts 'creating subarticles for article 313'
      sa313001 = Subarticle.create!(content: "Por un Acto Constitucional aprobado en tres debates por la mayoría absoluta de los miembros de la Asamblea Nacional, el cual debe ser publicado en la Gaceta Oficial y transmitido por el Órgano Ejecutivo a dicha Asamblea, dentro de los primeros cinco días de las sesiones ordinarias siguientes a la instalación de la Asamblea Nacional electa en las últimas elecciones generales, a efecto de que en su primera legislatura sea debatido y aprobado sin modificación, en un solo debate, por la mayoría absoluta de los miembros que la integran.",
        article: a313,
        number: 1)

      puts 'creating subarticles for article 313'
      sa313002 = Subarticle.create!(content: "Por un Acto Constitucional aprobado en tres debates por la mayoría absoluta de los miembros de la Asamblea Nacional, en una legislatura, y aprobado, igualmente, en tres debates, por mayoría absoluta de los miembros de la mencionada Asamblea, en la legislatura inmediatamente siguiente. En esta se podrá modificar el texto aprobado en la legislatura anterior. El Acto Constitucional aprobado de esta forma deberá ser publicado en la Gaceta Oficial y sometido a consulta popular directa mediante referéndum que se celebrará en la fecha que señale la Asamblea Nacional, dentro de un plazo que no podrá ser menor de tres meses ni exceder de seis meses, contados desde la aprobación del Acto Constitucional por la segunda legislatura.",
        article: a313,
        number: 2)

      puts 'creating metadata for article 313'
      m313 = Metadatum.create!(content: "La iniciativa para proponer reformas constitucionales corresponde a la Asamblea Nacional, al Consejo de Gabinete, a la Corte Suprema de Justicia o al Tribunal Constitucional. Dichas reformas deberán ser aprobadas por uno de los siguientes procedimientos:",
        article: a313)

      puts 'creating metadata subarticles for article 313'
      msa313001 = MetadatumSubarticle.create!(content: "Por un Acto Constitucional aprobado en tres debates por la mayoría absoluta de los miembros de la Asamblea Nacional, el cual debe ser publicado en la Gaceta Oficial y transmitido por el Órgano Ejecutivo a dicha Asamblea, dentro de los primeros cinco días de las sesiones ordinarias siguientes a la instalación de la Asamblea Nacional electa en las últimas elecciones generales, a efecto de que en su primera legislatura sea debatido y aprobado sin modificación, en un solo debate, por la mayoría absoluta de los miembros que la integran.",
        metadatum: m313,
        number: 1)

      puts 'creating metadata subarticles for article 313'
      msa313002 = MetadatumSubarticle.create!(content: "Por un Acto Constitucional aprobado en tres debates por la mayoría absoluta de los miembros de la Asamblea Nacional, en una legislatura, y aprobado, igualmente, en tres debates, por mayoría absoluta de los miembros de la mencionada Asamblea, en la legislatura inmediatamente siguiente. En esta se podrá modificar el texto aprobado en la legislatura anterior. El Acto Constitucional aprobado de esta forma deberá ser publicado en la Gaceta Oficial y sometido a consulta popular directa mediante referéndum que se celebrará en la fecha que señale la Asamblea Nacional, dentro de un plazo que no podrá ser menor de tres meses ni exceder de seis meses, contados desde la aprobación del Acto Constitucional por la segunda legislatura.",
        metadatum: m313,
        number: 2)

    puts 'creating article 314'
    a314 = Article.create!(content: 'Podrá adoptarse una nueva Constitución, a través de una Asamblea Constituyente Paralela, que podrá ser convocada por decisión del Órgano Ejecutivo, ratificada por la mayoría absoluta del Órgano Legislativo, o por el Órgano Legislativo con el voto favorable de dos terceras partes de sus miembros, o por iniciativa ciudadana, la cual deberá ser acompañada por las firmas de, por lo menos, el veinte por ciento de los integrantes del Registro Electoral correspondiente al 31 de diciembre del año anterior a la solicitud. En este caso, los peticionarios tendrán hasta seis meses para cumplir con este requisito de conformidad con el reglamento que al efecto expida el Tribunal Electoral.  /n
    Le corresponderá al Tribunal Electoral acoger la iniciativa propuesta y hacer la convocatoria a la elección de constituyentes, en un término no menor de tres meses ni mayor de seis meses desde la formalización de la solicitud de convocatoria. Realizada la elección, la Asamblea Constituyente Paralela se instalará formalmente e iniciará sus deliberaciones por derecho propio, tan pronto el Tribunal Electoral entregue las credenciales respectivas a sus integrantes. /n
    La Asamblea Constituyente Paralela estará integrada por sesenta constituyentes, quienes deberán representar proporcionalmente a los panameños de todas las provincias y comarcas, de acuerdo con la población electoral, y se permitirá, además de la postulación partidaria, la libre postulación. Para estos efectos, el Tribunal Electoral deberá establecer en la convocatoria el sistema electoral aplicable a la elección de constituyentes.  /n
    La Asamblea Constituyente Paralela podrá reformar la actual Constitución de forma total o parcial, pero en ningún caso las decisiones que adopte tendrán efectos retroactivos, ni podrán alterar los periodos de los funcionarios electos o designados, que estén ejerciendo su cargo al momento en que entre en vigencia la nueva Constitución. La Asamblea Constituyente Paralela tendrá un periodo no menor de seis meses ni mayor de nueve meses, para cumplir con su labor y entregar al Tribunal Electoral el texto de la Nueva Constitución Política aprobada, la cual será publicada de inmediato en el Boletín del Tribunal Electoral.  /n
    El nuevo Acto Constitucional aprobado con arreglo a este método será sometido a referéndum convocado por el Tribunal Electoral en un periodo no menor de tres meses, ni mayor de seis meses, contado a partir de la fecha de su publicación en el Boletín del Tribunal Electoral.  /n
    El Acto Constitucional aprobado con arreglo a cualquiera de los procedimientos señalados en este artículo y en el artículo anterior, empezará a regir desde su publicación en la Gaceta Oficial, la cual deberá hacerse por el Órgano Ejecutivo, dentro de los diez días hábiles que siguen a su ratificación por la Asamblea Nacional, o dentro de los treinta días hábiles siguientes a su aprobación mediante referéndum, según fuere el caso, sin que la publicación posterior a dichos plazos sea causa de inconstitucionalidad.',
      chapter: c131,
      number: 314,
      new: false)



puts "creating title 14"
t14 = Title.create!(number: 14,
  description: "EL CANAL DE PANAMÁ",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c141 = Chapter.create!(number: 0,
    description: "xxx",
    title: t14,
    new: false)

    puts 'creating article 315'
    a315 = Article.create!(content: 'El Canal de Panamá constituye un patrimonio inalienable de la Nación panameña; permanecerá abierto al tránsito pacifico e ininterrumpido de las naves de todas las naciones y su uso estará sujeto a los requisitos y condiciones que establezcan esta Constitución, la Ley y su Administración.',
      chapter: c141,
      number: 315,
      new: false)

    puts 'creating article 316'
    a316 = Article.create!(content: 'Se crea una persona jurídica autónoma de Derecho Público, que se denominará Autoridad del Canal de Panamá, a la que corresponderá privativamente la administración, funcionamiento, conservación, mantenimiento y modernización del Canal de Panamá y sus actividades conexas, con arreglo a las normas constitucionales y legales vigentes, a fin de que funcione de manera segura, continua, eficiente y rentable. Tendrá patrimonio propio y derecho de administrarlo.  /n
    A la Autoridad del Canal de Panamá corresponde la responsabilidad por la administración, mantenimiento, uso y conservación de los recursos hídricos de la cuenca hidrográfica del Canal de Panamá, constituidos por el agua de los lagos y sus corrientes tributarias, en coordinación con los organismos estatales que la Ley determine. Los planes de construcción, uso de las aguas, utilización, expansión, desarrollo de los puertos y de cualquiera otra obra o construcción en las riberas del Canal de Panamá, requerirán la aprobación previa de la Autoridad del Canal de Panamá. /n
    La Autoridad del Canal de Panamá no estará sujeta al pago de impuestos, derechos, tasas, cargos, contribuciones o tributos, de carácter nacional o municipal, con excepción de las cuotas de seguridad social, el seguro educativo, los riesgos profesionales y las tasas por servicios públicos, salvo lo dispuesto en el artículo 321.',
      chapter: c141,
      number: 316,
      new: false)

    puts 'creating article 317'
    a317 = Article.create!(content: 'La Autoridad del Canal de Panamá y todas aquellas instituciones y autoridades de la República vinculadas al sector marítimo, formarán parte de la estrategia marítima nacional.  /n
    El Órgano Ejecutivo propondrá al Órgano Legislativo la Ley que coordine todas estas instituciones para promover el desarrollo socioeconómico del país.',
      chapter: c141,
      number: 317,
      new: false)

    puts 'creating article 318'
    a318 = Article.create!(content: 'La administración de la Autoridad del Canal de Panamá estará a cargo de una Junta Directiva compuesta por once directores, nombrados así:',
      chapter: c141,
      number: 318,
      new: false)

      puts 'creating subarticles for article 318'
      sa318001 = Subarticle.create!(content: "Un director designado por el Presidente de la República, quien presidirá la Junta Directiva y tendrá la condición de Ministro de Estado para Asuntos del Canal.",
        article: a318,
        number: 1)

      puts 'creating subarticles for article 318'
      sa318002 = Subarticle.create!(content: "Un director asignado por el Órgano Legislativo que será de su libre nombramiento y remoción.",
        article: a318,
        number: 2)

      puts 'creating subarticles for article 318'
      sa318003 = Subarticle.create!(content: "Nueve directores nombrados por el Presidente de la República, con acuerdo del Consejo de Gabinete y ratificados por el Órgano Legislativo, por mayoría absoluta de sus miembros. La Ley establecerá los requisitos para ocupar el cargo de director, garantizando la renovación escalonada de los directores señalados en el numeral 3 de este artículo, en grupos de tres y cada tres años. A partir de la primera renovación, el período de todos los directores será de nueve años.",
        article: a318,
        number: 3)

    puts 'creating article 319'
    a319 = Article.create!(content: 'La junta Directiva tendrá las siguientes facultades y atribuciones, sin perjuicio de otras que la Constitución y la Ley determinen:',
      chapter: c141,
      number: 319,
      new: false)

      puts 'creating subarticles for article 319'
      sa319001 = Subarticle.create!(content: "Nombrar y remover al Administrador y al Subadministrador del Canal y determinar sus atribuciones, de acuerdo con la Ley.",
        article: a319,
        number: 1)

      puts 'creating subarticles for article 319'
      sa319002 = Subarticle.create!(content: "Fijar los peajes, tasas y derechos por el uso del Canal, sus servicios conexos, sujetos a la aprobación final del Consejo de Gabinete.",
        article: a319,
        number: 2)

      puts 'creating subarticles for article 319'
      sa319003 = Subarticle.create!(content: "Contratar empréstitos, previa aprobación del Consejo de Gabinete y dentro de los límites establecidos en la Ley.",
        article: a319,
        number: 3)

      puts 'creating subarticles for article 319'
      sa319004 = Subarticle.create!(content: "Otorgar concesiones para la prestación de servicios a la Autoridad del Canal de Panamá y a las naves que lo transiten.",
        article: a319,
        number: 4)

      puts 'creating subarticles for article 319'
      sa319005 = Subarticle.create!(content: "Proponer los límites de la cuenca hidrográfica del Canal para la aprobación del Consejo de Gabinete y la Asamblea Nacional.",
        article: a319,
        number: 5)

      puts 'creating subarticles for article 319'
      sa319006 = Subarticle.create!(content: "Aprobar privativamente los reglamentos que desarrollen las normas generales que dicte el Órgano Legislativo a propuesta del Órgano Ejecutivo, sobre el régimen de contratación, compras y todas las materias necesarias para el mejor funcionamiento, mantenimiento, conservación y modernización del Canal, dentro de la estrategia marítima nacional.",
        article: a319,
        number: 6)

      puts 'creating subarticles for article 319'
      sa319007 = Subarticle.create!(content: "Ejercer todas aquellas que establezcan esta Constitución y la Ley.",
        article: a319,
        number: 7)

    puts 'creating article 320'
    a320 = Article.create!(content: 'La Autoridad del Canal de Panamá adoptará un sistema de planificación y administración financiera trienal conforme al cual aprobará, mediante resolución motivada, su proyecto de presupuesto anual, que no formará parte del Presupuesto General del Estado.  /n
    La Autoridad del Canal de Panamá presentará su proyecto de Presupuesto al Consejo de Gabinete, que a su vez, lo someterá a la consideración de la Asamblea Nacional para su examen, aprobación o rechazo, según lo dispuesto en el Capítulo 2º, Título IX de esta Constitución.  /n
    En el Presupuesto se establecerán las contribuciones a la seguridad social y los pagos de las tasas por servicios públicos prestados, así como el traspaso de los excedentes económicos al Tesoro Nacional, una vez cubiertos los costos de operación, inversión, funcionamiento, mantenimiento, modernización, ampliación del Canal y las reservas necesarias para contingencias, previstas de acuerdo a la Ley y su Administración.  /n
    La ejecución del presupuesto estará a cargo del Administrador del Canal y será fiscalizada por la Junta Directiva, o quien ésta designe, y solamente mediante control posterior, por la Contraloría General de la República.',
      chapter: c141,
      number: 320,
      new: false)

    puts 'creating article 321'
    a321 = Article.create!(content: 'La Autoridad del Canal de Panamá pagará anualmente al Tesoro Nacional derechos por tonelada neta del Canal de Panamá, o su equivalente, cobrados a las naves sujetas al pago de peajes que transiten por el Canal de Panamá. Estos derechos serán fijados por la Autoridad del Canal de Panamá y no serán inferiores a los que deberá percibir la República de Panamá por igual concepto al 31 de diciembre de 1999.  /n
    Por razón de su tránsito por el Canal de Panamá, las naves, su carga o pasajeros, sus propietarios, armadores o su funcionamiento, así como la Autoridad del Canal de Panamá, no serán sujeto de ningún otro gravamen nacional o municipal.',
      chapter: c141,
      number: 321,
      new: false)

    puts 'creating article 322'
    a322 = Article.create!(content: 'La Autoridad del Canal de Panamá estará sujeta a un régimen laboral especial basado en un sistema de méritos y adoptará un Plan General de Empleo que mantendrá como mínimo, las condiciones y derechos laborales similares a los existentes al 31 de diciembre de 1999. A los Trabajadores y aquellos que deban acogerse a la jubilación especial en ese año cuyas posiciones se determinen necesarias de acuerdo a las normas aplicables, se les garantizará la contratación con beneficios y condiciones iguales a los que les correspondan hasta esa fecha.  /n
    La Autoridad del Canal de Panamá contratará, preferentemente, a nacionales panameños. La Ley Orgánica regulará la contratación de empleados extranjeros garantizando que no rebajen las condiciones o normas de vida del empleado panameño. En consideración al servicio público internacional esencial que presta el Canal, su funcionamiento no podrá interrumpirse por causa alguna. Los conflictos laborales entre los trabajadores del Canal de Panamá y su Administración serán resueltos entre los trabajadores o los sindicatos y la Administración, siguiendo los mecanismos de dirimencia que se establezcan en la Ley. El arbitraje constituirá la última instancia administrativa.',
      chapter: c141,
      number: 322,
      new: false)

    puts 'creating article 323'
    a323 = Article.create!(content: 'El régimen contenido en este Título solo podrá ser desarrollado por Leyes que establezcan normas generales. La Autoridad del Canal de Panamá podrá reglamentar estas materias y enviará copia de todos los reglamentos que expida en el ejercicio de esta facultad al Órgano Legislativo, en un término no mayor de quince días calendarios.',
      chapter: c141,
      number: 323,
      new: false)



puts "creating title 15"
t15 = Title.create!(number: 15,
  description: "DISPOSICIONES FINALES Y TRANSITORIAS",
  legislation: l,
  new: false)


  puts 'creating chapter 1'
  c151 = Chapter.create!(number: 1,
    description: "Disposiciones Finales",
    title: t15,
    new: false)

    puts 'creating article 324'
    a324 = Article.create!(content: 'Esta Constitución entrará en vigencia a partir del 11 de octubre de 1972.',
      chapter: c151,
      number: 324,
      new: false)

    puts 'creating article 325'
    a325 = Article.create!(content: 'Los tratados o convenios internacionales que celebre el Órgano Ejecutivo sobre el Canal de esclusas, su zona adyacente y la protección de dicho Canal, así como la construcción de un Canal a nivel del mar o de un tercer juego de esclusas, deberán ser aprobados por el Órgano Legislativo y, luego de su aprobación, serán sometidos a referéndum nacional, que no podrá celebrarse antes de los tres meses siguientes a la aprobación legislativa.  /n
    Ninguna enmienda, reserva o entendimiento que se refiera a dichos tratados o convenios tendrá validez, si no cumple con los requisitos de que trata el inciso anterior.  /n
    Esta disposición se aplicará también a cualquier propuesta de construcción de un tercer juego de esclusas o de un canal a nivel del mar por la ruta existente, que proponga realizar la Autoridad del Canal de Panamá, ya sea por administración o mediante contratos celebrados con alguna empresa o empresas privadas o pertenecientes a otro Estado u otros Estados. En estos casos, se someterá a referéndum la propuesta de construcción, la cual deberá ser aprobada previamente por el Órgano Ejecutivo y sometida al Órgano Legislativo para su aprobación o rechazo. También será sometido a referéndum cualquier proyecto sobre la construcción de un nuevo Canal.',
      chapter: c151,
      number: 325,
      new: false)

    puts 'creating article 326'
    a326 = Article.create!(content: 'Quedan derogadas todas las Leyes y demás normas jurídicas que sean contrarias a esta Constitución, salvo las relativas a la patria potestad y alimentos, las cuales seguirán vigentes en las partes que sean contrarias a esta Constitución por un término no mayor de doce meses a partir de su vigencia.',
      chapter: c151,
      number: 326,
      new: false)


  puts 'creating chapter 2'
  c152 = Chapter.create!(number: 2,
    description: "Disposiciones Finales",
    title: t15,
    new: false)

    puts 'creating article 327'
    a327 = Article.create!(content: 'Se adoptan las siguientes disposiciones transitorias referentes a las modificaciones introducidas por el Acto Legislativo de 2004:',
      chapter: c152,
      number: 327,
      new: false)

      puts 'creating subarticles for article 327'
      sa327001 = Subarticle.create!(content: "Por regla general, las disposiciones de la presente reforma constitucional tienen vigencia inmediata, a partir de su promulgación, excepto en los siguientes casos:",
        article: a327,
        number: 1)

        puts 'creating subsubarticles for subarticle 1 article 327'
        ssa3270011 = Subsubarticle.create!(content: "Que alguna regla transitoria señale una fecha distinta para que se inicie dicha vigencia.",
          subarticle: sa327001,
          number: 1)

        puts 'creating subsubarticles for subarticle 1 article 327'
        ssa3270012 = Subsubarticle.create!(content: "Que se mantenga temporalmente la vigencia de títulos o artículos específicos de la Constitución de 1972 que quedarán sustituidos o reformados.",
          subarticle: sa327001,
          number: 2)

      puts 'creating subarticles for article 327'
      sa327002 = Subarticle.create!(content: "Los cambios referidos al inicio y terminación de las legislaturas ordinarias, entrarán en vigencia a partir del primero de julio de 2009.",
        article: a327,
        number: 2)

      puts 'creating subarticles for article 327'
      sa327003 = Subarticle.create!(content: "Los Magistrados del Tribunal Electoral que se escojan al vencimiento del periodo de los actuales Magistrados, se designarán por los siguientes términos: el designado por el Órgano Judicial, por un periodo de seis años; el designado por el Órgano Ejecutivo, por un periodo de ocho años; y el designado por el Órgano Legislativo, por un periodo de diez años, a efecto de establecer el sistema de nombramientos escalonados de los Magistrados del Tribunal Electoral.",
        article: a327,
        number: 3)

      puts 'creating subarticles for article 327'
      sa327004 = Subarticle.create!(content: "Hasta tanto no se dicte y entre en vigencia la Ley que regule el Tribunal de Cuentas, continuarán vigentes todas las normas y procedimientos existentes sobre jurisdicción de cuentas. Una vez el Tribunal de Cuentas entre en función, todos los procesos que se siguen ante la Dirección de Responsabilidad Patrimonial de la Contraloría General, pasarán a ser de competencia de dicho Tribunal. Para asegurar el nombramiento escalonado, los primeros Magistrados que conformen el Tribunal de Cuentas serán nombrados así: el designado por el Órgano Judicial, por un periodo de seis años; el designado por el Órgano Ejecutivo, por un periodo de ocho años; y el designado por el Órgano Legislativo, por un periodo de diez años.",
        article: a327,
        number: 4)

      puts 'creating subarticles for article 327'
      sa327005 = Subarticle.create!(content: "Los funcionarios de elección popular electos para el periodo 2004-2009, concluirán su periodo el 30 de junio de 2009.",
        article: a327,
        number: 5)

      puts 'creating subarticles for article 327'
      sa327006 = Subarticle.create!(content: "El Órgano Legislativo nombrará una Comisión de Estilo para ordenar los artículos de la Constitución, junto a sus modificaciones, en una numeración corrida, la cual velará por la concordancia de dicha numeración con los números de los artículos a los que haga referencia alguna norma constitucional.",
        article: a327,
        number: 6)

      puts 'creating subarticles for article 327'
      sa327007 = Subarticle.create!(content: "Este Acto Legislativo del año 2004, empezará a regir desde su publicación en la Gaceta Oficial, la cual deberá hacer el Órgano Ejecutivo, dentro de los diez días hábiles que siguen a su ratificación por la Asamblea Nacional.",
        article: a327,
        number: 7)

      puts 'creating subarticles for article 327'
      sa327008 = Subarticle.create!(content: "La eliminación de los cargos de elección popular que se señalan en esta reforma constitucional tendrán vigencia a partir de las elecciones generales de 2009.",
        article: a327,
        number: 8)

      puts 'creating subarticles for article 327'
      sa327009 = Subarticle.create!(content: "Los funcionarios públicos cuyos nombramientos son contemplados en esta Constitución y que se encuentren en funciones al momento de entrada en vigencia de estas reformas, ejercerán sus cargos hasta cuando venza el periodo para el cual fueron nombrados.",
        article: a327,
        number: 9)

    puts 'creating article 328'
    Article.create!(content: 'En lo que no contradiga lo dispuesto en esta Constitución la Autoridad del Canal de Panamá integrará a su organización la estructura administrativa y operacional existente en la Comisión del Canal de Panamá al 31 de diciembre de 1999, incluyendo sus departamentos, oficinas, posiciones, normas vigentes, reglamentos y convenciones colectivas vigentes, hasta que sean modificados de acuerdo a la Ley.  /n
    “Dada en la ciudad de Panamá, a los 11 días del mes de octubre de 1972, reformada por los Actos Reformatorios Nº 1 y Nº 2 de 5 y 25 de octubre de 1978, respectivamente; por el Acto Constitucional aprobado el 24 de abril de 1983; por los Actos Legislativos Nº 1 de 1993 y Nº 2 de 1994; y por el Acto Legislativo Nº 1 de 2004”.',
      chapter: c152,
      number: 328,
      new: false)

    # articulo nuevo 8. debe venir despues del 328 con ese titulo
    puts 'creating article 328'
    Article.create!(content: "Todos los casos en materia constitucional que se encuentren pendientes en el Pleno de la Corte Suprema de Justicia, se adjudicarán al Tribunal Constitucional, excepto aquellos que ya estén en lectura o con proyectos de fallo.",
      chapter: c152,
      number: 328.8,
      new: true)

    # articulo nuevo 9. debe venir despues del 328 con ese titulo
    puts 'creating article 328'
    Article.create!(content: "En vista de que las presentes reformas constitucionales modifican y eliminan artículos de la Constitución de 1972, e introducen en ella artículos nuevos, quedando numerosos artículos sin modificar, se faculta al Órgano Ejecutivo para que, de ser aprobadas estas reformas constitucionales, elabore una ordenación sistemática de las disposiciones no reformadas y de las nuevas disposiciones en forma de texto único, que tenga una numeración corrida de artículos, comenzando con el número uno, con las debidas menciones de artículos puestas en orden, eliminando o reemplazando aquellos términos o expresiones que contravengan las nuevas disposiciones, y que se publique este texto único de la Constitución en la Gaceta Oficial, en el término de veinte (20) días calendarios, contados a partir de la fecha de aprobación del Acto Constitucional. El mismo texto único se ubicará en un folleto de edición oficial, para los fines de su amplia difusión.",
      chapter: c152,
      number: 328.9,
      new: true)




















#       # subarticulos
#       puts 'creating subarticles for article 165'
#       sa165 = Subarticle.create!(content: "Cuando sean orgánicas:",
#         article: a165,
#         number: 1)


#       # listas
#       puts 'creating subarticles for article 126'
#       sa126 = Subarticle.create!(content: "Efectuar las inscripciones de nacimientos, matrimonios, defunciones, naturalizaciones y demás hechos y actos jurídicos relacionados con el estado civil de las personas, y hacer las anotaciones procedentes en las respectivas inscripciones.",
#         article: a126,
#         number: 1)

#   # capitulo
#   puts 'creating chapter 8'
#   c8 = Chapter.create!(number: 8,
#     description: "Régimen Agrario",
#     title: t3)

# # titulos
# puts "creating title 3"
# t3 = Title.create!(number: 1,
#   description: "DERECHOS Y DEBERES INDIVIDUALES Y SOCIALES",
#   legislation: l)

#       # continua parrafo del articulo
#       puts 'creating subarticles for article 63'
#       sa2000 = Subarticle.create!(content: "La Ley organizará y determinará el funcionamiento de la jurisdicción especial de menores la cual, entre otras funciones, conocerá sobre la investigación de la paternidad, el abandono de familia y los problemas de conducta juvenil.",
#         article: a63,
#         number: 2000)


#       # articulo modificado
#       puts 'creating metadata for article 1'
#       m1 = Metadatum.create!(content: "Las autoridades de la República están instituidas para proteger en su vida, honra y bienes a los nacionales dondequiera se encuentren y a los extranjeros que estén bajo su jurisdicción; asegurar la efectividad de los derechos y deberes individuales y sociales, y cumplir y hacer cumplir la Constitución y la Ley. /n
#         Los derechos y garantías que consagra esta Constitución, deben considerarse como mínimos y no excluyentes de otros que incidan sobre los derechos fundamentales y la dignidad de la persona.",
#         article: a1)




#     # Así luciría un artículo nuevo *new: true*
#     puts 'creating article 8'
#     a8 = Article.create!(content: "Son fines esenciales del Estado promover la vigencia, aplicación y respeto de los Derechos Humanos de todos los ciudadanos y la comunidad, promover la prosperidad general y garantizar la efectividad de los principios, derechos, garantías y deberes consagrados en la Constitución, Tratados y Convenios Internacionales; garantizar el ejercicio de la consulta libre previa informada; facilitar la participación en paridad de todas las personas en las decisiones que las afectan y en la vida económica, política, administrativa, ambiental y cultural de la nación; defender la independencia nacional, mantener la integridad territorial y asegurar la convivencia pacífica y la vigencia de un orden justo.",
#       chapter: c1,
#       number: 8,
#       new: true)

#     puts 'creating article 147'
#     a147 = Article.create!(content: "La Asamblea Nacional se compondrá de setenta y un Diputados que resulten elegidos de conformidad con la Ley y sujeto a lo que se dispone a continuación:",
#       chapter: c1,
#       number: 147,
#       new: false)

#       puts 'creating subarticles for article 147'
#       sa1 = Subarticle.create!(content: "Habrá circuitos uninominales y plurinominales, garantizándose el principio de representación proporcional. Integrará un solo circuito electoral todo distrito en donde se elija más de un Diputado, salvo el distrito de Panamá, donde habrá circuitos de tres o más Diputados.",
#         article: a147,
#         number: 1)

#       sa2 = Subarticle.create!(content: "Los circuitos se conformarán en proporción al número de electores que aparezca en el último Padrón Electoral.",
#         article: a147,
#         number: 2)

#       sa3 = Subarticle.create!(content: "A cada comarca y a la provincia de Darién les corresponderá elegir el número de Diputados con que cuentan al momento de entrar en vigencia la presente norma.",
#         article: a147,
#         number: 3)

#       # asi es como se quisiera modificar el articulo
#       puts 'creating metadata for article 147'
#       m3 = Metadatum.create!(content: "La Asamblea Nacional se compondrá de setenta y un (71) diputados elegidos de conformidad con la Ley y con sujeción a lo que se dispone a continuación:",
#         article: a147)

#       # esta es la lista para el articulo modificado
#       puts 'creating metadata subarticles for article 147'
#       msa1 = MetadatumSubarticle.create!(content: "Todos los diputados serán elegidos para un periodo de cinco años mediante el sistema de representación proporcional que determine la Ley, el mismo día en que se celebre la elección ordinaria de Presidente y Vicepresidente de la República.",
#         metadatum: m3,
#         number: 1)

#       msa2 = MetadatumSubarticle.create!(content: "Salvo las excepciones a que se refiere el numeral cinco (5) y seis (6), todos los circuitos electorales serán de postulación plurinominal, en los cuales se elegirán no menos de dos diputados.",
#         metadatum: m3,
#         number: 2)

# Esta sección se puede quedar igual. Lo unico a cambiar son las preguntas mismas.
# Las primeras dos preguntas tendran una escala del 1 - 5 como respuestas posibles.
# La ultima pregunta referirá a un Si/No sobre si el ciudadano quiere escribir alguna sugerencia.
puts 'Creating questions for each article'
Article.all.each do |article|
  Question.create!(content: "¿Tienes alguna sugerencia?", article: article, number: 3)
  Question.create!(content: "¿Piensas que este artículo beneficia a Panamá a largo plazo?", article: article, number: 2)
  Question.create!(content: "¿Sientes que este artículo representa tu opinión sobre este tema?", article: article, number: 1)
end
