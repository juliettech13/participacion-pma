# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "deleting general feedbacks"
GeneralFeedback.destroy_all

puts 'deleting all answers'
Answer.destroy_all

puts 'deleting all questions'
Question.destroy_all

puts 'deleting metadata'
Metadatum.destroy_all

puts 'deleting subclasses'
Subclause.destroy_all

puts 'deleting all clauses'
Clause.destroy_all

puts 'deleting all sections'
Section.destroy_all

puts 'deleting all consultation'
Consultation.destroy_all

puts 'deleting all legislation'
Legislation.destroy_all

puts 'destroy admin users'
AdminUser.destroy_all

puts 'deleting all users'
User.destroy_all

puts "creating user"
user = User.create!(email: "bobstevens@charitize.com", password: 123456)
User.create!(email: "user2@charitize.com", password: 123456)
User.create!(email: "user3@charitize.com", password: 123456)
User.create!(email: "user4@charitize.com", password: 123456)
User.create!(email: "user5@charitize.com", password: 123456)
User.create!(email: "user6@charitize.com", password: 123456)

puts "creating admin user"
AdminUser.create!(email:"admin@charitize.com", password: 123456)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

puts "creating legislation"
l = Legislation.create!(
title: 'Nigeria ICT Innovation and Entrepreneurship Vision',
introduction: "The National Information Technology Development Agency (NITDA) was established in 2001 to regulate the IT sector in general. Section 6 (i & l) of the NITDA act empowers it to make policy recommendations to develop technology in Nigeria. To foster the growth of the technology ecosystem, NITDA created its subsidiary, Office for ICT Innovation and Entrepreneurship (OIIE) to drive the innovation and entrepreneurship mandate of the agency.
The mandates for the establishment of OIIE include: develop, establish, support and incentivise ICT innovation hubs, information technology parks and community enterprise hubs across Nigeria; and, collaborate with private sector, development partners and MDAs at both federal and state levels on policies and programs that support ICT entrepreneurship and commercialisation.
NITDA through OIIE has been listening to stakeholders and as a result, there is a need to reposition as agile facilitators to create an enabling environment for technology entrepreneurship to thrive. In this regard, NITDA plans to influence government policies by sharing findings from stakeholder engagements and research findings from similar markets to Nigeria.
This document, the Nigeria ICT Innovation and Entrepreneurship Vision (NIIEV), comprises policy recommendations and incentives designed to strengthen the Nigerian technology entrepreneurship ecosystem. It consists of the following sections: Digital Infrastructure; Education Reform, Skills Development and R&D; and, Supporting the Ecosystem for Innovative Entrepreneurship. The document is also accompanied with an information note that provides additional background information on each vision statement.",
user_id: user.id)


puts "creating consultation"
Consultation.create!(legislation: l, user: user)


puts "creating sections"

puts "creating section 1"
s1 = Section.create(title: 'Digital Infrastructure',
description: "Nigeria will significantly increase access to ICT and provide universal and affordable access to
the Internet. By 2025, 95% of the population will have access to broadband internet.",
legislation: l)

puts "creating clauses for section 1 with questions and metadata"

cl1 = Clause.create!(content: 'Incentivise telecommunication infrastructure sharing to achieve the economies of scale necessary for universal affordable access. Government will support private sector providers to merge their infrastructure.',
  section: s1)

  Question.create!(content: 'How well does this represent your views?', clause: cl1)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl1)
  Question.create!(content: 'Please provide your suggested revision', clause: cl1)

  Metadatum.create!(
    agency: 'Nigerian Communications Commission (NCC)',
    rationale: 'This would bring down the cost and ensure affordable access.',
    status: 'NCC published guidelines on collocation and infrastructure sharing on Rights of Way, Masts, Poles, Antenna and tower-structures, Ducts, Trenches, Electric power. In the guidelines, each operator (licensee) is expected to publish standard price list, this is not regulated by NCC which could be exploited by the operators. NCC maintains a list of operators on its website, this includes the name of the company, address, start and expiry dates. This list may not be conclusive as there are operators that are not listed there but in previous published lists. The issue with the guidelines is that it is only for passive sharing, there is no guidelines on active sharing. However, NCC is working on a framework on active sharing but this is yet to be published.
The Nigerian National Broadband Plan 2013 - 2018 is aimed at  “connecting communities with high speed internet and broadband access to facilitate faster socioeconomic advancement of the nation and its people”. To achieve this, the government, through NCC require Infrastructure Companies (Infracos) to bid for license to provide broadband infrastructure on an open access, non-discriminatory, price regulated basis to the six geopolitical zones and Lagos. Licenses have been awarded for Lagos, North Central, South East, North East. The license for North West, South South and South West have purportedly been awarded. The network and services infrastructure is divided into 3 layers; Passive Infrastructure Layer, Wholesale layer, Retail Service Providers (RSP). The main challenge telecommunication companies face is security, to this end, NCC and Nigerian Security and Civil Defence Corps (NSCDC) signed an MOU to protect the infrastructure. This will go a long way in alleviating this challenge which will in turn increase access to affordable broadband. Furthermore, the government plans to lay 18,000KM of fibre in the country in its effort to achieve and surpass the 30% broadband penetration target of 2018.',
    clause: cl1
    )

cl2 = Clause.create!(content: 'Drop Right of Way charges for fibre distribution to reduce capital requirements for expanding digital infrastructure, thereby reducing the costs passed on to consumers. ', section: s1)
  Question.create!(content: 'How well does this represent your views?', clause: cl2)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl2)
  Question.create!(content: 'Please provide your suggested revision', clause: cl2)

  Metadatum.create!(
    agency: 'Federal Inland Revenue Services (FIRS), Federal Ministry of Power, Works and Housing, State Inland Revenue Board, Local Government Authority, Nigerian Communications Commission (NCC).',
    rationale: 'Lack of harmonised Right of Way (RoW) across Federal, State and LGA and multiple taxation increases the cost of service delivery which is passed on to the consumers. Elimination of such charges will encourage investments and reduce the cost of service delivery.',
    status: "Harmonisation and reduction of RoW charges is already under review.
Currently, there is a guideline for the grant and access RoW to ICT services on Federal roads by the Federal Ministry of Power, Works and Housing. The charges are N145 per linear meter for ducts and cables and N20 per linear metre annual maintenance fees subject to change every 5 years. States and Local Governments have different charges and this varies from state to state. The lack of uniform charges is one of the challenges telcos face which affects the supply of services. To address this challenge, NEC approved a policy on harmonisation of right of way charges across LG, States and Federal highways. The NEC RoW guideline still maintains the amount of N145 per meter for laying fibre for all parts of the country. Also, NCC made a case to the Governors Forum to ensure on the need to adhere to the NEC’s resolutions. RoW is included in the NCC’s Guidelines on Collocation and Infrastructure Sharing, this provides a means of bringing down the cost of broadband as shown in Vision 1.",
    clause: cl2
    )

cl3 = Clause.create!(content: 'Adopt a “dig once” policy, so that any traditional infrastructure investment--roads, electricity, water and so on--must be accompanied by fibre optic cables, where none already exist.', section: s1)
  Question.create!(content: 'How well does this represent your views?', clause: cl3)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl3)
  Question.create!(content: 'Please provide your suggested revision', clause: cl3)

  Metadatum.create!(
    agency: "Federal Ministry of Power, Works and Housing, Federal Ministry of Environment, Nigerian Communications Commission (NCC).",
    rationale: "Implementing “dig once” policy will ensure the protection of the environment, increase broadband penetration and affordable access.",
    status: "Anambra State included the implementation of Dig Once policy as part of its smart city initiative.",
    clause: cl3
  )

cl4 = Clause.create!(content: 'Build a national data framework and harmonise e-Governance to enable innovation, improve efficiency, transparency, accountability and citizen participation in government:', section: s1)
  Question.create!(content: 'How well does this represent your views?', clause: cl4)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl4)
  Question.create!(content: 'Please provide your suggested revision', clause: cl4)

  Subclause.create!(clause: cl4, content: 'Build a single digital platform that aligns access to government datasets and to electronically process Freedom of Information (FOI) requests for every MDA;')
  Subclause.create!(clause: cl4, content: 'Amend the FOI Act to strengthen enforcement and compliance;')
  Subclause.create!(clause: cl4, content: 'Harmonise e-Governance by using a Whole of Government (WoG) approach to rationalise and simplify access to government services.')

  Metadatum.create!(
    agency: "National Information Technology Development Agency (NITDA), Federal Ministry of Communications, Federal Ministry of Justice, National Bureau of Statistics (NBS), National eGovernment Strategies (NeGSt), National Identity Management Commission (NIMC) and all MDAs.",
    rationale: "Data is vital for any economy to progress, its availability to policy makers, businesses and citizens has direct impact on how government delivers services. Simplified access to government services will improve transparency of common processes, data integrity and reduce the time and cost associated with accessing information.",
    status: "The enactment of the FOI Act in 2011 has made public records and information more freely available and accessible to Nigerians. Several government agencies have set up compliance structures that now enable them to respond to requests for information within the ambit of the law. However, several issues such as:
    (a) Low awareness, skills and knowledge of the FOI Act provisions and processes by citizens and public/civil servants;
    (b) Lack of designated officers responsible for Freedom of Information in most public Institutions;
    (c) Lack of sanctions against public institutions and FOI responsible officers who do not respond to FOI requests or/and report to FMoJ annually;
    (d) Lack of Infrastructure to support digital collection and management of information, to facilitate timely retrieval of requested information.
    This policy vision seeks to expand upon best-practice, ensure compliance and
    (a) Build a single digital platform that aligns access to government datasets and to electronically process FOI requests for every MDA,
    (b) Amend the FOI Act to strengthen enforcement and compliance,
    (c) Harmonise e-Governance by using a Whole of Government (WoG) approach to rationalise and simplify access to government services.
    National Identity Management Commission (NIMC) is working on harmonising biometric data across several agencies in a single database. This is expected to be completed by 2020.
    The Bureau of Public Service Reform (BPSR) has adopted a unique electronic FOI platform on its website that gives real-time information to citizens and also encourages voluntary disclosure. This policy seeks to expand this best-practice and provide a single electronic portal for FOI requests that can be forwarded to each MDA and tracked. This will not only increase awareness but improve information sharing.
    NeGSt was created to “facilitate, drive and implement” eGovernment programmes using a Public Private Partnership (PPP) model. They provide MDAs with support in terms of deployment of eGovernment services and solutions. NITDA recently published the Nigerian e-Government Interoperability Framework (Ne-GIF) which adopts a  Whole-of-Government approach which will lead to Government Digital Transformation. The purpose of this framework is to ease data collection and sharing among MDAs and promote interactions between government, businesses and citizens.",
    clause: cl4
  )

cl5 = Clause.create!(section: s1, content: 'Support renewable energy through expanded subsidies and tax incentives for local production of renewable energy technology.', section: s1)
  Question.create!(content: 'How well does this represent your views?', clause: cl5)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl5)
  Question.create!(content: 'Please provide your suggested revision', clause: cl5)

  Metadatum.create!(
    agency: 'Federal Ministry of Environment (Renewable Energy Programme), Federal Ministry of Power, Works and Housing, Rural Electrification Agency (REA), Energy Commission of Nigeria (ECN), National Electricity Regulatory Agency (NERC), Electricity Distribution Companies (DisCos), Power Generating Companies (GenCos),  Federal Inland Revenue Services (FIRS), Nigeria Investment Promotion Commission (NIPC).',
    rationale: 'One of the barriers to entry for business in Nigeria is the lack of stable electricity. Providing support for renewable energy can alleviate this problem and promote investments in the sector which in turn will lead to job creation and economic growth.',
    status: 'The Nigerian Renewable Energy and Energy Efficiency Policy (NREEEP) commits 20% of power supply to be generated from renewable sources by 2030 which translates to 23,000MW. The policy projected 12,500MW of self-generation including off-grid generation in 2030. Proposed incentives in the policy include:
    (a) Power Production Tax Credit (PTC)
    (b) Generation Disclosure Requirement (GDR)
    (c) Tax incentives to manufacturers of renewable energy and energy efficient equipment and their accessories
    (c.1) Five year tax holiday for manufacturers from date of commencement of manufacturing
    (c.2) Five year tax holiday on dividend incomes from investments on domestic renewable energy sources
    (d) Incentives for importers
    (d.1) Exemption from excise duty and sales tax
    (d.2) Free custom duty for two years on the importation of equipment and materials used in renewable energy and energy efficiency projects
    (d.3) Soft loans and special low interest loans from power sector development fund for renewable energy supply and energy efficiency projects
    (e)Tax credits for homeowners who install energy efficient appliances and lighting
    (f) Tax credits to companies who produce energy efficient appliances and fixtures',
    clause: cl5
    )

puts "creating section 2"

s2 = Section.create!(title: 'Education Reform, Skills Development and R+D',
description: "Nigeria will have a globally competitive workforce. By 2025, achieve digital literacy rates of 75% of the total population. Public and privately funded R&D will surpass 1% of GDP.",
legislation: l)

puts "creating clauses for section 2"

cl6 = Clause.create!(section: s2, content: 'Reform the national education system and curricula:')
  Subclause.create!(clause: cl6,
    content: 'Incorporate problem solving, critical thinking and digital literacy skills from Early Childhood Development curriculum')
  Subclause.create!(clause: cl6,
    content: 'Provide training and funding for innovative indigenous e-learning applications and games;')
  Subclause.create!(clause: cl6,
    content: 'Transform all libraries from information repositories into information hubs with free internet access, e-learning tools, massive online open courses (MOOCs), and space for student groups to meet')
  Subclause.create!(clause: cl6,
    content: 'Provide continuing education trainings for teachers that emphasises technological change and new e-learning tools;')
  Subclause.create!(clause: cl6,
    content: 'Create a single portal to access all government scholarships and loans for national and international education.')
  Question.create!(content: 'How well does this represent your views?', clause: cl6)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl6)
  Question.create!(content: 'Please provide your suggested revision', clause: cl6)

  Metadatum.create!(
    agency: 'Federal Ministry of Education (FME), Universal Basic Education Commission (UBEC), National University Commission (NUC), National Educational Research and Development Council (NERDC), National Commission for Colleges of Education (NCCE), National Board for Technical Education (NBTE), National Teachers’ Institute (NTI).',
    rationale: 'Although the Law already supports the integration of Information Technology into the educational sector, it is not being implemented fully.',
    status: 'Section 4 (19b) (ix) of the National Policy on Education states that the “curriculum for primary education shall include computer education’’ and Section 5 (30) (f) says “Government shall provide necessary infrastructure and training for the integration of ICT in the school system in recognition of the role of ICT in advancing knowledge and skills in the modern world”. The above Law has been truncated over the years as a result of the following reasons; lack of required telecommunications infrastructure capable of transporting multimedia messaging and absence of electric power grids in most parts of the country even in cases where there is adequate telecommunications coverage amongst others. Nigerian government is considering a new policy of graduates studying extra one year before NYSC to make them fit for employment.',
    clause: cl6)

cl7 = Clause.create!(section: s2, content: 'Improve digital literacy and technical skills amongst youth to encourage digital job creation and empowerment:')
  Subclause.create!(clause: cl7,
    content: 'Train interested corps members in digital literacy during NYSC. Create subsidised schemes for computer acquisition for corp members and other individuals;')
  Subclause.create!(clause: cl7,
    content: 'Deploy qualified and interested corp members to schools to support digital literacy education;')
  Subclause.create!(clause: cl7,
    content: 'Upgrade Technical and Vocational Education and Training (TVET) programs to include software and hardware development and maintenance. Ensure that all TVET programs are digitally enabled;')
  Subclause.create!(clause: cl7,
    content: 'Raise awareness about available facilities for digital capacity building and encourage MDAs to share infrastructure with other government and non-government organisations supporting digital literacy and skills.')
  Question.create!(content: 'How well does this represent your views?', clause: cl7)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl7)
  Question.create!(content: 'Please provide your suggested revision', clause: cl7)

  Metadatum.create!(
    agency: 'Federal Ministry of Youths, Sports and Development (FMYSD), National Youth Service Corp (NYSC), Ministry of Education (FME), National Board for Technical Education (NBTE), National Business and Technical Examinations Board (NABTEB).',
    rationale: 'This will reduce unemployment and increase the GDP.',
    status: '(a) Train interested corps members in digital literacy during NYSC. Create subsidised schemes for computer acquisition for corp members and other individuals.
(b) Deploy qualified and interested corps members to schools to support digital literacy education.
The NYSC was established by decree No. 24 of May 22, 1973 after the civil war “with a view to the proper encouragement and development of common ties among the youths of Nigeria and the promotion of national unity”. It is a one year program, established for university graduates under 30 which involve a 3-week orientation camp before deployment to places where they will work for the duration of 11 months. NYSC places special emphasis on rural postings in Agriculture, Health, Education and Infrastructure. NYSC, via its  Skill Acquisition and Entrepreneurship Development (SAED) program provides skills acquisition and entrepreneurship training to corp members at orientation camps.
(c) Upgrade Technical and Vocational Education and Training programs to include software and hardware development and maintenance. Ensure that all TVET programs are digitally enabled.
Technical and Vocational Education and Training (TVET) in Nigeria is under the National Board for Technical Education (NBTE). The institutions under it consist of Polytechnics, Monotechnics, Innovation Enterprise Institutions (IEIs), Vocational Enterprise Institutions (VEIs) and Technical Colleges. Research has shown that TVET is facing a lot of challenges ranging from lack of funding, poor infrastructure, lack of qualified teachers etc .
(d) Raise awareness about available facilities for digital capacity building and encourage MDAs to share infrastructure with other government and non-government organisations supporting digital literacy and skills.
Several MDAs have hubs which are not being fully utilised. These can be used as centres of excellence for the delivery and acquisition of skills.',
    clause: cl7)


cl8 = Clause.create!(section: s2,
  content: 'Support youth employment and participation in the private sector through tax incentives that will lower the gross cost to employ youth. ')
  Question.create!(content: 'How well does this represent your views?', clause: cl8)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl8)
  Question.create!(content: 'Please provide your suggested revision', clause: cl8)

  Metadatum.create!(
    agency: 'Federal Inland Revenue Services (FIRS), Federal Ministry of Youth, Sports and Development (FMYSD), Federal Ministry of Labour and Employment (FMLE), National Directorate of Employment (NDE).',
    rationale: 'This will encourage employment which in turn will reduce the unemployment rate of the country.',
    status: 'Currently, the tax incentives for employment of youth are Employment Tax Relief (ETR) and  Work Experience Acquisition Programme Relief (WEARP), these are under the Companies Income Tax (Exemption of Profits) Order 2012. For the ETR, companies with a minimum net employment 10 employees whose workforce consists of 60% of graduates without prior work experience and within 3 years of graduation are exempted from income tax on 5% of their assessable profit. This exemption is on gross salaries of the employees who must be Nigerians in first time employment of the companies. For the WEARP, the same is applicable but the minimum net employment is 5 new employees and they must be retained for a minimum of 2 years.',
    clause: cl8)


cl9 = Clause.create!(section: s2,
  content: 'Simplify immigration requirements for skilled professionals to start businesses in Nigeria in order to facilitate knowledge transfer.')
  Question.create!(content: 'How well does this represent your views?', clause: cl9)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl9)
  Question.create!(content: 'Please provide your suggested revision', clause: cl9)

  Metadatum.create!(
    agency: 'Nigerian Immigration Service (NIS), Federal Ministry of Interior (FMI), Ministry of Foreign Affairs (MoFA), Corporate Affairs Commission (CAC).',
    rationale: 'There is considerable merit in reducing the current visa system in Nigeria as such, the targeted investors/ tourist will be interested in coming down to the country which will have great impact on our GDP and facilitate knowledge transfer.',
    status: 'Executive Order 001 mandates the processing of tourist and business visas within 48 hours and the publishing of requirements for visa on arrival on websites of Nigerian embassies, high commissions and other immigration related agencies. In the same Executive Order, MDAs are mandated to publish the list and requirements with timeline, fees and mode of communication for obtaining their products and services.',
    clause: cl9)


cl10 = Clause.create!(section: s2,
  content: 'Establish inclusive public procurement policies for startups, this way the Government can directly seed fund pre-commercial private sector R&D.')
  Question.create!(content: 'How well does this represent your views?', clause: cl10)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl10)
  Question.create!(content: 'Please provide your suggested revision', clause: cl10)

  Metadatum.create!(
    agency: 'Bureau for Public Procurement (BPP)',
    rationale: 'This not only benefits citizens, but also enhances the overall functioning of government, by creating new opportunities to partner with other agencies, non-profit organisations and businesses. It will also incentivise local talent and be a strategy for implementing Executive Orders 003 and 005.',
    status: 'BPP is set to introduce electronic Public Procurement, e-PP, into Nigeria’s public procurement system. It has made available, on its website the Procurement Procedures Manual for public procurement describing how public procurement should be planned and implemented, the policies on public procurement are defined in the relevant laws and regulations governing procurement in Nigeria. Executive Order 003 mandated MDAs to give preference to local content in procurement, which includes ICT, while Executive Order 005 promotes support for SMEs in procurement.',
    clause: cl10)


cl11 = Clause.create!(section: s2,
  content: 'Expand Research and Development by simplifying tax incentives.')
  Question.create!(content: 'How well does this represent your views?', clause: cl11)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl11)
  Question.create!(content: 'Please provide your suggested revision', clause: cl11)

  Metadatum.create!(
    agency: 'Federal Ministry of Science and Technology (FMST) Tertiary Education Trust Fund (tetfund), National Information Technology Development Agency (NITDA), Petroleum Technology Development Fund (PTDF), National Automotive Design and Development Council (NADDC) Fund, Universal Service Provision Fund (USPF), Ecological Fund, Federal Inland Revenue Service (FIRS), National Agency for Science and Engineering Infrastructure (NASENI), Federal Institute of Industrial Research Oshodi (FIIRO), Raw Materials Research and Development Council (RMRDC).',
    rationale: 'R&D is essentially the first step in developing a country’s local content product or service, as such, it is the R&D function that provides a platform for creativity and innovation to flourish.',
    status: 'Section 26 of  Companies Income Tax Act allows 20% investment tax credit.
    On the 20th March, 2018 Minister of Science & Technology commissioned Technology Orientation Center (TOC) at Idu Abuja built by the National Agency for Science and Engineering Infrastructure, (NASENI). The centre is a strategy to stimulate research and development and drive the new National Science, Technology and Innovation Roadmap (2017-2030) vital to the diversification of the Nigerian economy for sustainable growth.
    In 2017, a bill was passed by National Assembly on establishment of National Research and Innovation Council. Part of the governing board’s responsibilities is the establishment of the National Research and Innovation Fund. The fund is to support national research, innovation and development bodies and other functions of the council.',
    clause: cl11)


puts "creating section 3"

s3 = Section.create!(title: 'Supporting the Ecosystem for Innovative Entrepreneurship',
description: "By 2025, Nigeria will become a digital economy and ICT will contribute 25% to the national GDP.",
legislation: l)

puts 'clause 12'
cl12 = Clause.create!(section: s3,
  content: 'Facilitate startup growth by easing the business environment and simplifying access to opportunities for indigenous innovators:')
  Subclause.create!(clause: cl12, content: 'Simplify procedures for opening and closing a business;')
  Subclause.create!(clause: cl12, content: 'Ease cross-border trade by simplifying procedures and reviewing restrictions on both imports and exports;')
  Subclause.create!(clause: cl12, content: 'Simplify access to subsidised credit facilities for startups;')
  Subclause.create!(clause: cl12, content: 'Raise awareness about opportunities for digital entrepreneurship and skills acquisition.')
  Question.create!(content: 'How well does this represent your views?', clause: cl12)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl12)
  Question.create!(content: 'Please provide your suggested revision', clause: cl12)

  Metadatum.create!(clause: cl12,
    agency: 'Federal Inland Revenue Services (FIRS), National Insurance Commission (NIC), Corporate Affairs Commission (CAC), Nigerian Investment Promotion Commission (NIPC), Nigerian Port Authority (NPA), Nigeria Export Promotion Council (NEPC), Standard Organisation of Nigeria (SON) and Nigeria Custom Service (NCS), Central Bank of Nigeria (CBN), National Environmental Standards and Regulations Enforcement Agency (NESERA), Federal Ministry of Finance, Nigerian Financial Intelligence Unit (NFIU), National Bureau of Statistics (NBS), Nigeria Agricultural Quarantine Services (NAQS), National Agency for Food and Drug Administration and Control (NAFDAC), Raw Materials Research and Development Council (RMRDC), Bank of Industry (BOI), Development Bank of Nigeria (DBN), National Information Technology Development Agency (NITDA).',
    rationale: 'Encourage Techpreneurs to create more enterprises which will create more jobs for Nigeria youth and to attract both local and international investors.',
    status: 'Simplify procedures for opening and closing a business. Lowering the cost of business failure, encourages more enterprise and entrepreneurship.
    There are three ways of winding up companies; by the court, voluntarily or subject to the supervision of the court . A company can only be dissolved in Federal High Court within the area of jurisdiction where the registered office of the company is situated. For example if a company was registered with Abuja address, the company cannot be closed in a Lagos court it must be a court in Abuja. Therefore, the Lagos court has no power to hear the petition.
    Ease cross-border trade by simplifying the procedures and reviewing restrictions on both imports and exports.
    According to World Bank rating report (2018), Nigeria is one of the economies that showed significant improvement in doing business. NCS, through Nigeria Trade Hub provides a portal for accessing accurate information on imports and exports aimed at helping investors make informed decisions about doing business in Nigeria. NCS has also introduced the Authorized Economic Operator (AEO) scheme to fast track cargo clearance for trusted traders and give incentives for traders to increase compliance with clearance procedures.
    Nigeria has a Single Window Portal to facilitate trade project of 12 Nigerian Government agencies involved in the customs clearance process.  This portal  allows traders to access customs regulations online, submit customs documents electronically, track transaction status online, and submit electronic payments.
    Simplify access to subsidised credit facilities for startups.
    BOI is the largest government body that provides business facilities. ICT is one of the sub-sectors given high priority for accessing BOI loan . Other SME and startup related loans includes SME Credit Guarantee Scheme (SMECGS), Agricultural/Small and Medium Enterprises Investment Scheme (AGSMEIS) and loan facilities from Development Bank of Nigeria (DBN). Most of the funds are complicated to access.
    Raise awareness about opportunities for digital entrepreneurship and skills acquisition.
    Recently, the Federal Government made a declaration to include technology startups and businesses in the pioneer list. Pioneer Status Incentives (PSI) allows companies to benefit from a tax holiday for three years renewable for additional two years, tax free dividends  during the tax holiday, capital allowances and tax losses. NITDA through Office for ICT Innovation and Entrepreneurship (OIIE) is working on developing guidelines for startups to raise awareness on the opportunities available and how to access them. Creating awareness will ensure that Nigerians are enlightened and benefit from the ICT ecosystem. This will in turn reduce the unemployment rate of the country.')

puts 'clause 13'
  cl13 = Clause.create!(section: s3,
    content: 'Provide support for hubs and linkages for nationwide collaborations:')
  Subclause.create!(clause: cl13,
    content: 'Provide trainings to build the capabilities of hubs to support entrepreneurs;')
  Subclause.create!(clause: cl3,
    content: 'Facilitate international collaborations and partnerships;')
  Subclause.create!(clause: cl13,
    content: 'Support innovation hubs through tax incentives, such as granting pioneer status;')
  Subclause.create!(clause: cl13,
    content: 'Provide tax rebates for any payments for internet and telephone;')
  Subclause.create!(clause: cl13,
    content: 'Partner with independent innovation hubs to support technology entrepreneurs.')
  Question.create!(content: 'How well does this represent your views?', clause: cl13)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl13)
  Question.create!(content: 'Please provide your suggested revision', clause: cl13)

  Metadatum.create!(clause: cl13,
    agency: 'National Information Technology Development Agency (NITDA), Federal Ministry of Science and Technology (FMST), Federal Ministry of Education (FME), Federal Inland Revenue Services (FIRS), Federal Ministry of Industry, Trade and Investment (FMITI), State and Local Government.',
    rationale: 'Innovation hubs are the engines of innovation and entrepreneurship through skills development, ideation and experimentation, technology transfer, and investor matchmaking. While Nigeria has over 50 hubs, it does not match the population and its not geographically well spread.',
    status: '(a) Provide trainings to build the capabilities of hubs to support entrepreneurs.
    (b) Facilitate international collaborations and partnerships.
    (c) Support innovation hubs through tax incentives, such as granting pioneer status.
    (d) Provide tax rebates for any payments for internet and telephone.
    (e) Partner with independent innovation hubs to support technology entrepreneurs.
    NITDA has 2 hubs, one in Oyo and the other in Katsina. The federal government in partnership with World Bank and Department for International Development (DFID) initiated the Growth and Employment (GEM) Project aimed at job creation and increased non-oil growth. The project was targeted at five sectors one of which is Information and Communication Technology (ICT). Part of the ICT sector is provision of support to established innovation hubs or establishment of new hubs in the six geo-political zones of the country. The Office of the Vice President published a report on Catalysing Growth through Regional Innovation which highlighted the opportunities and challenges for developing ICT innovation hubs .
    Federal Ministry of Science and Technology proposed a Framework for the Nigerian National System of Innovation for the purpose of “promoting successful innovation, and its implementation and diffusion in the country”.')

puts 'clause 14'
  cl14 = Clause.create!(section: s3,
    content: 'Incentivise venture capital and angel investment funds to invest in innovative entrepreneurship through simplified tax reductions.')
  Question.create!(content: 'How well does this represent your views?', clause: cl14)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl14)
  Question.create!(content: 'Please provide your suggested revision', clause: cl14)

  Metadatum.create!(clause: cl14,
    agency: 'Federal Inland Revenue Services (FIRS)',
    rationale: 'Angel investors are not supported by incentives like those in other markets. This will encourage venture capitalist and Angel investors to invest more in startups.',
    status: 'The Venture Capital Incentives Act is to provide for the grant of tax relief and other incentives on personal investments in the National Risk Fund, venture capital companies and venture capital projects and other matters related thereto.
    A venture capital company shall qualify as an investor under the National Risk Fund. FIRS shall certify that a venture capital project fulfils or is capable of fulfilling one or more of the objectives.Investment in the venture project shall not be less than 25 percent of the total capital required for the venture project some of the incentives are:-
    (a) Capital Allowances Incentives
    (a.1) 1st and 2nd year deduct 30%
    (a.2) 3rd year, 20%
    (a.3) 4th and 5th year, 10%
    (b) Capital Gain Incentives
    (b.1) for the disposal of capital within five years of investment, 100%
    (b.2) for the disposal of capital between six and ten years or investment, 75%
    (b.3) for the disposal of capital between eleven and fifteen years of investment, 25%
    (b.4) for the disposal of capital after fifteen years of investment, 0%
    (c) Withholding tax payable reduced by 50%
    (d) Pioneer Status Incentives
    (e) Export incentives
    All accreditation is done by FIRS.')

puts 'clause 15'
  cl15 = Clause.create!(section: s3,
    content: 'Re-brand Nigeria as a global hotspot for innovation through policy reform, messaging, and participation at global technology events.')
  Question.create!(content: 'How well does this represent your views?', clause: cl15)
  Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause: cl15)
  Question.create!(content: 'Please provide your suggested revision', clause: cl15)

  Metadatum.create!(clause: cl14,
    agency: 'National Information Technology Development Agency (NITDA)',
    rationale: 'This will promote investments in Nigeria which will boost the GDP, reduce unemployment and poverty.',
    status: 'Nigeria ranks 118 out of 126 economies in the Global Innovation Index 2018
    Various agencies promote Nigeria’s participation at global events in order to showcase Nigeria’s potential and attract Foreign Direct Investment (FDI). NITDA has been participating in the Gulf Information Technology Exhibition (GITEX) where it organises an African Investment Forum (AIF) with the view of promoting local techpreneurs and drawing the international body to invest in Nigeria.')



# puts "vision 6"
# Clause.create!(content: 'Build a national data infrastructure to enable innovation:
# a.  Ensure that an Open Data staff/unit responsible for opening up agency data and responding to Freedom of Information requests is operational within every MDA,
# b.  Amend the Freedom of Information Act to strengthen enforcement and compliance,
# c.  Build a single digital platform to electronically process FOI requests for every MDA,
# d.  Build a single national data platform that aligns access to government datasets
# e.  Launch a fund to procure API development from the indigenous technology community.', section: s1)

#   Question.create!(content: 'How well does this represent your views?', clause_id: 6)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 6)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 6)

#   Metadatum.create!(
#     agency: "National Information Technology Development Agency (NITDA), Federal Ministry of Justice, National Bureau of Statistics (NBS), and all MDAs",
#     rationale: "Data is vital for any economy to progress, its availability to policy makers, businesses and citizens has direct impact on how government delivers services.",
#     status: "The enactment of the FOI Act in 2011 has made public records and information more freely available and accessible to Nigerians. Several government agencies have set up compliance structures that now enable them to respond to requests for information within the ambit of the law. However, several issues such as:
# a. Low awareness, skills and knowledge of the FOI Act provisions and processes by citizens and
# public/civil servants.
# b. Lack of designated officers responsible for Freedom of Information in most public Institutions.
# c. Lack of sanctions against public institutions and FOI responsible officers who do not respond to
# FOI requests or/and report to FMoJ annually.
# d. Lack of Infrastructure to support digital collection and management of information, to facilitate
# timely retrieval of requested information.
# This policy vision seeks to expand upon best-practice, ensure compliance and
# a. Ensure that an Open Data staff/unit responsible for opening up agency data and responding to
# Freedom of Information requests is operational within every MDA,
# b. Amend the Freedom of Information Act to strengthen enforcement and compliance,
# c. Build a single digital platform to electronically process FOI requests for every MDA,
# The Bureau of Public Service Reform (BPSR) has adopted a unique electronic FOI platform on its
# website that gives real-time information to citizens and also encourages voluntary disclosure. This
# policy seeks to expand this best-practice and provide a single electronic portal for FOI requests that
# can be forwarded to each MDA and tracked. This will not only increase awareness
# d. Build a single national data platform that aligns access to government datasets
# e. Launch a fund to procure API development from the indigenous technology community.",
#     clause_id: 6
#     )

# puts "vision 7"

# Clause.create!(content: 'Support renewable energy through expanded subsidies and tax exemptions for importation of renewable energy technology.', section_id: 1)
#   Question.create!(content: 'How well does this represent your views?', clause_id: 7)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 7)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 7)

# Metadatum.create!(
#   agency: "Federal Ministry of Environment (Renewable Energy Programme), Federal Ministry of
# Power, Works and Housing, Rural Electrification Agency (REA), Energy Commission of Nigeria (ECN),
# National Electricity Regulatory Agency (NERC), Electricity Distribution Companies (DisCos), Power
# Generating Companies (GenCos), Federal Inland Revenue Services (FIRS), Nigeria Investment
# Promotion Commission (NIPC)",
#   rationale: " One of the barriers to entry for business in Nigeria is the lack of stable electricity. Providing
# support for renewable energy can alleviate this problem and promote investments in the sector which
# in turn will lead to job creation and economic growth.",
#   status: "The Nigerian Renewable Energy and Energy Efficiency Policy (NREEEP) commits 20% of
# power supply to be generated from renewable sources by 2030 which translates to 23,000MW23. The
# policy projected 12,500MW of self-generation including off-grid generation in 2030. Proposed
# incentives in the policy include
# a. Power Production Tax Credit (PTC)
# b. Generation Disclosure Requirement (GDR)
# c. Tax incentives to manufacturers of renewable energy and energy efficient equipment and their
# accessories
# i. Five year tax holiday for manufacturers from date of commencement of manufacturing
# ii. Five year tax holiday on dividend incomes from investments on domestic renewable
# energy sources
# d. Incentives for importers
# i. Exemption from excise duty and sales tax
# ii. Free custom duty for two years on the importation of equipment and materials used in
# renewable energy and energy efficiency projects
# iii. Soft loans and special low interest loans from power sector development fund for
# renewable energy supply and energy efficiency projects
# e. Tax credits for homeowners who install energy efficient appliances and lighting
# f. Tax credits to companies who produce energy efficient appliances and fixtures",
# clause_id: 7
#   )

# puts "creating section 2"

# Clause.create!(content: 'Transform the National Youth Service Corps to become a national digital training army:
# a.  Train corps members in digital literacy teaching pedagogy during camp,
# b.  Equip every corps member with a tablet,
# c.  Deploy all corps members in primary schools to support digital literacy education,
# d.  Emphasize entrepreneurial values, such as critical thinking, experimentation, collaboration, accepting failure, and leadership skills, and
# e.  Discourage redeployment of corp members, to ensure cultural exchange during camp, fostering trust and empathy across ethnic, linguistic, religious and gender divides to build a cohesive and proud national identity.',
# section_id: 2)

#   Question.create!(content: 'How well does this represent your views?', clause_id: 8)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 8)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 8)

#   Metadatum.create!(
#   agency: "Federal Ministry of Youths, Sports and Development, National Youth Service Corp (NYSC).",
#   rationale: "The NYSC can be made as a national digital training army by partnering with relevant
# MDAs, ICT hubs, R&D-intensive multinational companies.",
#   status: "The NYSC was established by decree No. 24 of May 22, 1973 after the civil war “with a view to
# the proper encouragement and development of common ties among the youths of Nigeria and the
# promotion of national unity”. NYSC is a one year program, established for university graduates under
# 30 which involve a 3-week orientation camp before deployment to places where they will work for the
# duration of 11 months. NYSC places special emphasis on rural postings in Agriculture, Health,
# Education and Infrastructure24. NYSC, via its Skill Acquisition and Entrepreneurship Development
# (SAED) program provides skills acquisition and entrepreneurship training to corps members at
# orientation camps",
#   clause_id: 8
#     )


# Clause.create!(content: 'Redesign the national education system and curricula:
# a.  Incorporate critical thinking and digital literacy skills into Early Childhood Development curriculum,
# b.  Provide training, funding and a market for innovative, indigenous e-learning applications and games,
# c.  Transform all libraries from information repositories into information hubs with free internet access, e-learning tools, massive online open courses (MOOCs), and space for student groups to meet,
# d.  Provide continuing education trainings for teachers that emphasize technological change and new e-learning tools, and
# e.  Create a single portal to access all government scholarships and loans for national and international education.',
# section_id: 2)

#   Question.create!(content: 'How well does this represent your views?', clause_id: 9)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 9)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 9)

#  Metadatum.create!(
#   agency: "Federal Ministry of Education, Universal Basic Education Commission (UBEC), National
# University Commission (NUC), National Educational Research and Development Council (NERDC),
# National Commission for Colleges of Education (NCCE), National Board for Technical Education
# (NBTE)",
#   rationale: "Although the Law already supports the integration of Information Technology into the
# educational sector, it is not being implemented fully.",
#   status: " Section 4 (19b) (ix) of the National Policy on Education states that the “curriculum for primary
# education shall include computer education’’ and Section 5 (30) (f) says “Government shall provide
# necessary infrastructure and training for the integration of ICT in the school system in recognition of the
# role of ICT in advancing knowledge and skills in the modern world”. The above Law has been
# truncated over the years as a result of the following reasons; lack of required telecommunications
# infrastructure capable of transporting multimedia messaging and absence of electric power grids in
# most parts of the country even in cases where there is adequate telecommunications coverage amongst others. Nigerian government is considering a new policy of graduates studying extra one year
# before NYSC to make them fit for employment",
#   clause_id: 9
#     )



# Clause.create!(content: 'Upgrade Technical and Vocational Education and Training programs to include software and hardware development and maintenance. Furthermore, all TVET programs should be digitally enabled.',
# section_id: 2)

#   Question.create!(content: 'How well does this represent your views?', clause_id: 10)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 10)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 10)

#   Metadatum.create!(
#     agency: "Ministry of Education (FME), National Board for Technical Education (NBTE), National
# Business and Technical Examinations Board (NABTEB)",
#     status: "Currently, one of the major challenges faced in Nigeria is the high rate of unemployment and it
# has been increasing for years. Policies and practices implemented by the Federal Government of
# Nigeria could be very influencing factors to the issues. The curricula of TVET are adjudged to be too
# academic and overloaded with intellectual content in pure science and mathematics at the expense of
# basic engineering and technology.",
#     clause_id: 10,
#     rationale: " Four key uses of ICT in TVET include; flexible and blended learning, curriculum integration,
# assessment, meeting special learning needs. This is a major priority for Europe, UK, Austria, Sweden
# and Finland."

#     )

# Clause.create!(content: 'Support youth employment through tax incentives that will lower the gross cost to employ youth. Nigerian citizens under 26 years pay zero personal income tax up to N200,000/year, above this rate they pay the normal amount.',
# section_id: 2)

#   Question.create!(content: 'How well does this represent your views?', clause_id: 11)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 11)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 11)


# Metadatum.create!(
# agency: "Federal Inland Revenue Services (FIRS), Federal Ministry of Youth, Sports and
# Development, Federal Ministry of Labour and Employment, National Directorate of Employment.",
# rationale: "This will encourage employment which in turn will reduce the unemployment rate of the
# country.",
# status: "Currently, the tax incentives for employment of youth are Employment Tax Relief (ETR) and
# Work Experience Acquisition Programme Relief (WEARP), these are under the Companies Income
# Tax (Exemption of Profits) Order 201229. For the ETR, companies with minimum net employment of 10
# employees whose workforce consists of 60% of graduates without prior work experience and within 3
# years of graduation are exempted from income tax on 5% of their assessable profit. This exemption is
# on gross salaries of the employees who must be Nigerians in first time employment of the companies.
# For the WEARP, the same is applicable but the minimum net employment is 5 new employees and
# they must be retained for a minimum of 2 years.",
# clause_id: 11

#     )

# Clause.create!(content: 'Simplify immigration requirements for skilled professionals to start businesses in Nigeria and remove expatriate quotes to facilitate knowledge transfer.',
# section_id: 2)
#   Question.create!(content: 'How well does this represent your views?', clause_id: 12)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 12)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 12)


#   Metadatum.create!(
#     agency: "Nigerian Immigration Service (NIS), Federal Ministry of Interior (FMI), Ministry of Foreign
# Affairs (MoFA)",
# rationale: "There is considerable merit in reducing the current visa system in Nigeria as such, the
# targeted investors/ tourist will be interested in coming down to the country which will have great impact
# in our GDP and facilitate knowledge transfer.",
# status: "Executive Order 001 mandates the processing of tourist and business visas within 48 hours
# and the publishing of requirements for visa on arrival on websites of Nigerian embassies, high
# commissions and other immigration related agencies30. In the same Executive Order, MDAs are
# mandated to publish the list and requirements with timeline, fees and mode of communication for
# obtaining their products and services.
# The expatriate quota / Business permit to either a joint venture between a Nigerian company or fully
# owned requires the approval of interior minister and it is only issued to company registered with
# Corporate Affairs Commission (CAC). They are in two categories:
# a. The permanent until reviewed (PUR) only for chairman or Managing director of the company
# and;
# b. Temporary which is only issued to a Director or special expert with a designated job
# description.",
# clause_id: 12
# )


# Clause.create!(content: 'Launch a Public Procurement for Innovation tendering mechanism, using hackathons and innovation challenge methodologies to provide larger government services. In this way the Government can directly seed fund pre-commercial private sector R&D.',
# section_id: 2)
#   Question.create!(content: 'How well does this represent your views?', clause_id: 13)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 13)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 13)

#   Metadatum.create!(
#     agency: "Bureau for Public Procurement (BPP), Office of the Head of Civil Service)",
# rationale: "This not only benefits citizens, but also enhances the overall functioning of government, by
# creating new opportunities to partner with other agencies, non-profit organisations and businesses.
# Government can directly seed fund pre-commercial private sector R&D which will incentivise local
# talent and be a strategy for implement Executive Order 003 and 005",
# status: "The Bureau of Public Procurement is set to introduce electronic Public Procurement, e-PP, into
# Nigeria’s public procurement system. The Bureau Public of Procurement has made available on its website the Procurement Procedures
# Manual for public procurement describing how public procurement should be planned and
# implemented, the policies on public procurement are defined in the relevant laws and regulations
# governing procurement in Nigeria. Executive Order 003 mandated MDAs to give preference to local content in procurement, which includes ICT, while Executive Order 005 promotes support for SMEs in
# procurement.",
# clause_id: 13
# )

# Clause.create!(content: 'Expand funding for Research and Development.',
# section_id: 2)

#   Question.create!(content: 'How well does this represent your views?', clause_id: 14)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 14)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 14)

#    Metadatum.create!(
#     agency: "Tertiary Education Trust Fund (TETfund), National Information Technology Development
# Agency (NITDA), Federal Institute of Industrial Research Oshodi (FIIRO), Petroleum Technology
# Development Fund (PTDF), Raw Materials Research and Development Council (RMRDC), National
# Automotive Design and Development Council (NADDC) Fund, Universal Service Provision Fund
# (USPF), Ecological Fund.",
# rationale: "R&D is essentially the first step in developing a country’s local content product or service,
# as such, it is the R&D function that provides a platform for creativity and innovation to flourish.",
# status: "On 20th March 2018, Minister of Science & Technology commissioned Technology Orientation
# Center (TOC) at Idu Abuja built by the National Agency for Science and Engineering Infrastructure,
# (NASENI). The centre is a strategy to drive the new National Science, Technology and Innovation
# Roadmap (2017-2030) vital to the diversification of the Nigerian economy for sustainable growth.
# In 2017, a bill was passed by National Assembly on establishment of National Research and
# Innovation Council. Part of the governing board’s responsibilities is the establishment of the National
# Research and Innovation Fund. The fund is to support national research, innovation and development
# bodies and other functions of the council.
# ",
# clause_id: 14
# )

# puts "creating section 3"

# Clause.create!(content: 'Build innovation hubs in major population centers where none exist. It is important to avoid duplication, competition and also fragmentation of innovation communities as an innovation community’s strength lies in the dynamism and diversity of its members and its sharing culture.',
# section_id: 3)

#   Question.create!(content: 'How well does this represent your views?', clause_id: 15)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 15)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 15)

# Metadatum.create!(agency: "National Information Technology Development Agency (NITDA), Federal Ministry of Science and Technology (FMST), Federal Ministry of Education (FME), State and local government.",
#   rationale: "Innovation hubs are the engines of innovation and entrepreneurship through skills development, ideation and experimentation, technology transfer, and investor matchmaking. While Nigeria has over 50 hubs, it does not match the population and it is not geographically well spread.",
#   status: "NITDA has 2 hubs, one in Oyo and the other in Katsina but the Katsina hub is to be launched.
# In March 2017 the Nigeria government through the office of the vice president designed a framework
# for implementation and establishment of regional innovation hubs in Nigeria in partnership with the
# Growth and Employment (GEM) Project, a World Bank Group funded project implemented by the
# Nigerian Federal Ministry of Industry, Trade and Investment (FMITI). The government proposed one
# state in each geo-political zone, besides Lagos and Abuja which are considered automatic candidates
# due to the existing technology cluster in Lagos and potential for governance related innovation in
# Abuja. The proposed states are; Anambra (SE), Cross River (SS), Benue (NC), Kaduna (NW), Osun
# (SW), Adamawa (NE), Abuja, Lagos. The project is a PPP with existing hubs and first launch is the
# regional innovation hub in Yola, Adamawa state.",
# clause_id: 15 )

# Clause.create!(content: 'Provide direct training support for hubs and linkages for nationwide collaborations. The Government will develop a certification scheme for hubs and provide Training of Trainers to build the capabilities of hubs to support entrepreneurs.',
# section_id: 3)
#   Question.create!(content: 'How well does this represent your views?', clause_id: 16)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 16)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 16)

# Metadatum.create!(
# agency: "National Information Technology Development Agency (NITDA)" ,
# rationale: "Bridge the skills gap for incubation in Nigeria. Most hubs do not have the human capacity to
# adequately incubate technology ideas. The train the trainer approach will enable a multiplier approach." ,
# status: "This is a NITDA proposed incentive to support innovation hub and encourage collaboration
# within the ecosystem." ,
# clause_id: 16
#   )

# Clause.create!(content: 'Provide tax relief for innovation hubs, as they are providing valuable public services. Innovation hubs are the engines of innovation and entrepreneurship through skills development, ideation and experimentation, technology transfer, and investor matchmaking. Certified innovation hubs will pay zero income tax on revenue up to N10m/year and their employees will pay zero payroll tax on salaries up to N1m/year.  Innovation hubs will also receive tax rebates for any payments for internet and telephone.',
# section_id: 3)
#   Question.create!(content: 'How well does this represent your views?', clause_id: 17)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 17)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 17)


#   Metadatum.create!(
#     agency: "Federal Inland Revenue Services (FIRS), State Inland Revenue Boards.",
#     rationale: "This will encourage more private sector participation to invest in building hubs.",
#     status: "On FIRS website you can apply for your company stamp duty, TIN number, file for tax
# refund. The current tax incentives are; Pioneer status incentive, exemption of interest on loan,
# exemption tax free interest loan granted by a bank to a company, exemption on profits, 20% Income
# tax rate for companies with turnover less than ₦1 million (The incentives provide for a lower rate of tax
# of 20% payable by companies in the preferred sector of the economy such as agriculture,
# manufacturing, solid minerals or wholly export trade for the first 5 years of commencement of business,
# where the turnover is less than ₦1 million) and Tax exemption on proceeds reinvested. (Gains
# accruing to unit holders in a trust in respect of disposal of securities, shall not be chargeable on tax
# provided the proceeds are reinvested). Recently, the government made a declaration to include
# technology startups and businesses in the pioneer list",
#     clause_id: 17
#     )

# Clause.create!(content: 'Simplify procedures for closing a business. Lowering the cost of business failure, encourages more enterprise and entrepreneurship.',
# section_id: 3)
#   Question.create!(content: 'How well does this represent your views?', clause_id: 18)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 18)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 18)

#   Metadatum.create!(
#     agency: "Federal Inland Revenue Services (FIRS), National Insurance Commission (NIC), Corporate
# Affairs Commission (CAC) and Nigerian Investment Promotion Commission (NIPC).",
#     rationale: " Encourage Techpreneurs to create more enterprises which will create more jobs for Nigeria
# youth and to attract both local and international investors.",
#     status: "Presently only the federal high court has the power to close a company in Nigeria because
# companies and allied matters form part of the items under section 25(1), of 1999 constitution (as
# amended), which is exclusive of the court. Who wind-up depend on the mode of petition, any of the
# following persons may present or file a petition for closing up a business, that is, the company, a
# creditor, including a contingent or prospective creditor, the official receiver, contributory, trustee in
# bankruptcy to, personal representative of a creditor or contributory, Corporate Affairs Commission
# under sections 323,410(2)(d) of CAMA, receiver if authorized by the instrument under which he was
# appointed, and by all or any of the parties, together or separately. A company can only be dissolved in
# Federal High Court within the area of jurisdiction where the registered office of the company is situated.
# For example, if a company was registered with Abuja address, the company cannot be closed in a
# Lagos court it must be a court in Abuja. Therefore, the Lagos court has no power to hear the petition.",
# clause_id: 18
#     )

# Clause.create!(content: 'Ease cross-border trade by minimizing the procedures and restrictions on both imports and exports.',
# section_id: 3)
#   Question.create!(content: 'How well does this represent your views?', clause_id: 19)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 19)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 19)

#    Metadatum.create!(
#     agency: "Federal Inland Revenue Services (FIRS), Nigerian Port Authority (NPA), Nigeria Export
# Promotion Council (NEPC), Standard Organisation of Nigeria (SON) and Nigeria Custom Service
# (NCS), Central Bank of Nigeria (CBN), National Environmental Standards and Regulations
# Enforcement Agency (NESERA), Federal Ministry of Finance, Nigerian Financial Intelligence Unit
# (NFIU), National Bureau of Statistics (NBS), Nigeria Agricultural Quarantine Services (NAQS), National
# Agency for Food and Drug Administration and Control (NAFDAC), Raw Materials Research and
# Development Council (RMRDC), Nigerian Import Export Promotion Council (NEPC).",
#     rationale: "Enhancing government procedure, restriction and excess charges on importation and
# exportation that affect ease of doing business and distance frontiers in Nigeria; this will help in easy of
# cross border trade between Nigeria and other countries in the world.",
#     status: "According to World Bank rating report (2018)40, Nigeria is one of the economies that showed
# significant improvement in doing business. NCS, through Nigeria Trade Hub provides a portal for
# accessing accurate information on imports and exports aimed at helping investors make informed
# decisions about doing business in Nigeria. NCS has also introduced the Authorised Economic Operator
# (AEO) scheme to fast track cargo clearance for trusted traders and give incentives for traders to
# increase compliance with clearance procedures.
# Nigeria has a Single Window Portal to facilitate trade project of 12 Nigerian Government agencies
# involved in the customs clearance process. This portal allows traders to access customs regulations
# online, submit customs documents electronically, track transaction status online, and submit electronic
# payments.",
# clause_id: 19
#     )

# puts "creating section 4"

# Clause.create!(content: 'Support Startups development directly through tax breaks. Certified Startups will pay zero corporate tax for up to eight years under N10m/year. And, up to twenty employees will pay zero personal income tax up to N1m.',
# section_id: 3)
#   Question.create!(content: 'How well does this represent your views?', clause_id: 20)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 20)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 20)

#   Metadatum.create!(
# agency: "Federal Inland Revenue Services (FIRS), Nigerian Investment Promotion Commission
# (NIPC)",
# rationale: "To encourage and attract investments into the ICT sector of the economy." ,
# status: "The Pioneer Status Incentives (PSI) allows companies to benefit from tax holiday for three
# years renewable for additional two years, tax free dividends during the tax holiday, capital allowances
# and tax losses41. Recently, the Federal Government made a declaration to include technology startups
# and businesses in the pioneer list, to grant them tax holiday" ,
# clause_id: 20

#     )

# Clause.create!(content: 'Establish subsidized credit facilities for Startups.',
# section_id: 3)
#   Question.create!(content: 'How well does this represent your views?', clause_id: 21)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 21)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 21)

#   Metadatum.create!(
# agency: "Bank of Industry (BOI), Central Bank of Nigeria (CBN), Development Bank of Nigeria
# (DBN), National Information Technology Development Agency (NITDA)",
# rationale: "The goal is to provide subsidised funding for technology startup companies to grow. There
# is a need for NITDA to set aside a dedicated fund for ICT innovation from the NITDEF fund. This
# should be implemented in a PPP with an investment company that will be charged with getting
# matching funds and managing the fund.",
# status: " BOI is the largest government body that provides business facilities. ICT is one of the subsectors
# given high priority for accessing BOI loan 43. Other SME and startup related loans include SME Credit Guarantee Scheme (SMECGS)44, Agricultural/Small and Medium Enterprises Investment
# Scheme (AGSMEIS) and loan facilities from Development Bank of Nigeria (DBN). Most of the funds
# are complicated to access.",
# clause_id: 21
#     )

# Clause.create!(content: 'Incentivize Venture Capital and Angel Investment funds to fund innovative entrepreneurship through tax reductions. Investments in certified Startups will receive full exemptions on capital gains tax.',
# section_id: 3)
#   Question.create!(content: 'How well does this represent your views?', clause_id: 22)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 22)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 22)

#     Metadatum.create!(
# agency: "Federal Inland Revenue Services (FIRS)",
# rationale: "Angel investors are not supported by incentives like those in other markets. This will
# encourage venture capitalist and Angel investors to invest more in startups.",
# status: "The Venture Capital Incentives Act is to provide for the grant of tax relief and other incentives
# on personal investments in the National Risk Fund, venture capital companies and venture capital
# projects and other matters related thereto. A venture capital company shall qualify as an investor under the National Risk Fund. FIRS shall certify
# that a venture capital project fulfils or is capable of fulfilling one or more of the objectives. Investment in
# the venture project shall not be less than 25% of the total capital required for the venture project some
# of the incentives are:-
# a. Capital Allowances Incentives
# i. 1st and 2nd year deduct 30%
# ii. 3rd year, 20%
# iii. 4th and 5th year, 10%
# b. Capital Gain Incentives
# i. for the disposal of capital within five years of investment, 100%
# ii. for the disposal of capital between six and ten years or investment, 75%
# iii. for the disposal of capital between eleven and fifteen years of investment, 25%
# iv. for the disposal of capital after fifteen years of investment, 0%
# c. Withholding tax payable reduced by 50%
# d. Pioneer Status Incentives
# e. Export incentives
# All accreditation is done by FIRS.",
# clause_id: 22
#     )

# Clause.create!(content: 'Subsidize the acquisition of intellectual property protection for certified Startups. The Government will cover the legal and procedural costs for Startups to obtain intellectual property protection for their innovations.',
# section_id: 3)
#   Question.create!(content: 'How well does this represent your views?', clause_id: 23)
#   Question.create!(content: 'Does this strengthen the Nigerian technology entrepreneurship ecosystem?', clause_id: 23)
#   Question.create!(content: 'Please provide your suggested revision', clause_id: 23)

#     Metadatum.create!(
# agency: "Federal Ministry of Industry, Trade and Investment (FMITI), National Office for Technology
# Acquisition and Promotion (NOTAP)",
# rationale: " Intellectual property can support funding and investment opportunity for startups because it
# offers security to potential investors",
# status: "Intellectual Property can be filed in Nigeria electronically. Startups can file for copyrights
# directly by going to the e-registration portal of the Nigerian Copyrights Commission. The process
# requires a startup to conduct a search first to make sure the invention/idea has not already been
# patented yet or the trademark symbol has not been used. Applications are processed within 10 working
# days and the fees are published on the commissions website",
# clause_id: 23
#     )

# puts "we done!"


# puts "creating dummy general feedback"
# GeneralFeedback.create!(content: 'My custom feedback 1', legislation_id: 1)
# GeneralFeedback.create!(content: 'I really like it because...', legislation_id: 1)
# GeneralFeedback.create!(content: 'I totally disagree becasue', legislation_id: 1)
# GeneralFeedback.create!(content: 'My custom feedback 4', legislation_id: 1)
# GeneralFeedback.create!(content: 'My custom feedback 5', legislation_id: 1)
# GeneralFeedback.create!(content: 'My custom feedback xyz 6', legislation_id: 1)

# puts "creating dummy answers"
# Answer.create!(content: 'yes', question_id: 1, user_id: 1)
# Answer.create!(content: '1', question_id: 2, user_id: 1)
# Answer.create!(content: 'yes', question_id: 3, user_id: 1)
# Answer.create!(content: 'My custom revision content - clause 1 - User 1', question_id: 4, user_id: 1)

# Answer.create!(content: '1', question_id: 5, user_id: 1)
# Answer.create!(content: '1', question_id: 6, user_id: 1)
# Answer.create!(content: 'yes', question_id: 7, user_id: 1)
# Answer.create!(content: 'My custom feedback clause 2 - User 1', question_id: 8, user_id: 1)

# #feedback from another user

# Answer.create!(content: 'yes', question_id: 1, user_id: 2)
# Answer.create!(content: '2', question_id: 2, user_id: 2)
# Answer.create!(content: 'yes', question_id: 3, user_id: 2)
# Answer.create!(content: 'My custom revision content - clause 1 - User 2', question_id: 4, user_id: 2)

# Answer.create!(content: '1', question_id: 5, user_id: 2)
# Answer.create!(content: '1', question_id: 6, user_id: 2)
# Answer.create!(content: 'yes', question_id: 7, user_id: 2)
# Answer.create!(content: 'My custom feedback clause 2- User 2', question_id: 8, user_id: 2)

