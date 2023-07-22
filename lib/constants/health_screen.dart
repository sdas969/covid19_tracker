import 'package:covid19_tracker/constants/assets.dart';
import 'package:covid19_tracker/models/description_model.dart';
import 'package:covid19_tracker/models/tab_model.dart';

final preventionTabsContentList = [
  DescriptionModel(
      description:
          '''Importance of Disinfection: Disinfecting frequently-touched surfaces is crucial to prevent the transmission of COVID-19. The virus can survive on various surfaces for hours to days, making regular disinfection essential to reduce the risk of infection.\n
Proper Disinfection Techniques: To effectively disinfect surfaces, follow these steps:
\t\t\tClean the surface with soap and water to remove dirt and debris.
\t\t\tUse an EPA-approved disinfectant or a diluted bleach solution.
\t\t\tApply the disinfectant and let it sit for the recommended contact time.
\t\t\tWipe down the surface with a clean cloth or paper towel.\n
Frequent Cleaning Routine: Incorporate disinfection into your regular cleaning routine, especially in shared spaces, high-traffic areas, and frequently-touched objects like doorknobs, light switches, handrails, and electronic devices.''',
      img: disinfectImg,
      title: 'Disinfect'),
  DescriptionModel(
      description:
          '''Handwashing Guidelines: Proper handwashing is a simple yet effective way to protect yourself and others from COVID-19. Follow these steps:\n
\t\t\tWet your hands with clean running water.
\t\t\tApply soap and lather well, including the backs of your hands, between your fingers, and under your nails.
\t\t\tScrub your hands for at least 20 seconds (sing "Happy Birthday" twice).
\t\t\tRinse thoroughly with running water.
\t\t\tDry your hands with a clean towel or air dry them.\n
Hand Sanitizers: When soap and water are not available, use hand sanitizers with at least 60% alcohol. Apply a sufficient amount to cover all surfaces of your hands, and rub until dry.\n
Hand Care: Frequent handwashing can lead to dry and cracked skin. After washing your hands, apply a moisturizer to keep your skin hydrated and healthy.''',
      img: handwashImg,
      title: 'Handwash'),
  DescriptionModel(
      description:
          '''Stay Home When Sick: If you feel unwell, especially if you experience symptoms such as fever, cough, shortness of breath, fatigue, or body aches, stay home and self-isolate to avoid spreading the virus to others.\n
Self-Quarantine Guidelines: If you have been in close contact with someone confirmed or suspected to have COVID-19, follow local health guidelines for self-quarantine. Stay home for the recommended period, monitor your health, and get tested if symptoms develop.\n
Working and Learning from Home: During the pandemic, many workplaces and educational institutions have adopted remote options. If possible, work and study from home to minimize potential exposure to the virus.''',
      img: homeImg,
      title: 'Stay Home'),
  DescriptionModel(
      description:
          '''Mask-Wearing Guidelines: Wear a mask that covers your nose and mouth in public settings, especially when it is difficult to maintain social distancing. Masks help prevent the spread of respiratory droplets that may contain the virus.\n
Mask Hygiene: Wash reusable masks after each use with soap and water or in the washing machine. Disposable masks should be discarded properly after use.\n
Mask Exemptions: Some individuals, such as children under a certain age or those with certain medical conditions, may be exempt from wearing masks. Respect these exemptions and be understanding of individual circumstances.''',
      img: maskImg,
      title: 'Wear a Mask'),
  DescriptionModel(
      description:
          '''What is Social Distancing: Social distancing involves maintaining a safe distance (usually 6 feet) from others, especially in public places, to reduce the risk of virus transmission.\n
Socializing Safely: Consider virtual gatherings, phone calls, or outdoor meetings with proper distancing to maintain social connections while reducing the risk of COVID-19 transmission.\n
Social Distancing in Different Settings: Adapt social distancing practices in various environments, such as workplaces, schools, stores, and public transportation. Follow guidelines provided by local health authorities.''',
      img: socialDistancingImg,
      title: 'Social Distancing'),
  DescriptionModel(
      description:
          '''COVID-19 Vaccines: COVID-19 vaccines have undergone rigorous testing and approval processes to ensure their safety and effectiveness. Vaccination is a crucial step in controlling the pandemic and protecting yourself and others.\n
Vaccine Safety: Vaccines are continually monitored for safety. Mild side effects like soreness at the injection site and mild fever are common and temporary. Severe reactions are rare but should be reported to healthcare providers.\n
Getting Vaccinated: Stay informed about vaccine availability, eligibility, and scheduling in your area. Follow local health department guidelines and get vaccinated as soon as you are eligible.''',
      img: vaccinationImg,
      title: 'Vaccinate')
];

final symptomsTabContentList = [
  DescriptionModel(
      description:
          '''Overview: Coughing is a common symptom of COVID-19 and can vary in intensity and duration. It is often a dry cough, meaning it does not produce mucus. While it may be mild for some, it can become persistent and bothersome for others. If you experience a persistent cough, especially when combined with other COVID-19 symptoms, it's essential to get tested and follow local health guidelines.\n
COVID-19 Related Cough: A COVID-19 cough might be different from a regular cough due to its persistent nature and the absence of phlegm. Some individuals may only experience a cough without other symptoms, making it crucial to be vigilant and seek testing if you suspect exposure to the virus.\n
Managing Cough: If you have a mild cough without severe symptoms, self-isolate to avoid spreading the virus to others. Stay hydrated and use over-the-counter cough medications following medical advice. If the cough worsens or is accompanied by difficulty breathing, chest pain, or other concerning symptoms, seek medical attention immediately.''',
      img: coughImg,
      title: 'Cough'),
  DescriptionModel(
      description:
          '''COVID-19 Fatigue: Fatigue and general tiredness are common symptoms of COVID-19. Many individuals experience fatigue even before other symptoms become apparent. This can make it challenging to distinguish from regular tiredness, so it's crucial to monitor for other COVID-19 symptoms and get tested if you suspect exposure.\n
Coping with Fatigue: Rest and sleep are vital for recovery. If you are experiencing fatigue, prioritize rest and avoid overexerting yourself. Maintain a balanced diet and stay hydrated to support your body's immune response. Consider light exercises or activities if your energy levels allow, but listen to your body and rest as needed.\n
Seeking Help: Fatigue can persist even after COVID-19 recovery. If you experience severe or prolonged fatigue, cognitive difficulties, or other post-COVID symptoms, consult your healthcare provider for evaluation and guidance.''',
      img: fatigueImg,
      title: 'Fatigue'),
  DescriptionModel(
      description:
          '''Understanding Fever: Fever is a common symptom of COVID-19 and is the body's natural response to fight off infections. It is essential to monitor your temperature regularly, as a fever can indicate an active infection.\n
Monitoring Fever: Use a digital thermometer to measure your temperature accurately. A fever is generally considered to be 100.4°F (38°C) or higher. If you have a fever, self-isolate, rest, and follow local health guidelines for testing and care.\n
Fever and COVID-19: Fever patterns may vary among individuals infected with COVID-19. Some may experience intermittent fevers, while others may have sustained high temperatures. If you have a fever lasting more than a few days or accompanied by severe symptoms, seek medical attention promptly.''',
      img: feverImg,
      title: 'Fever'),
  DescriptionModel(
      description:
          '''Headaches and COVID-19: Headaches can be a symptom of COVID-19, and they may occur alone or in combination with other signs of infection. COVID-19 headaches can range from mild to severe and might be accompanied by body aches, fatigue, and fever.\n
Home Remedies: Over-the-counter pain relievers, rest, and relaxation techniques may help alleviate mild headaches. However, it's essential to consider getting tested for COVID-19 if you develop a headache along with other symptoms.\n
Managing Headaches During Isolation: If you are in isolation or quarantine due to COVID-19, managing headaches becomes even more critical. Follow medical advice, stay hydrated, and maintain a quiet and comfortable environment to support your recovery.''',
      img: headacheImg,
      title: 'Headache'),
  DescriptionModel(
      description:
          '''Anosmia and COVID-19: Loss of smell, or anosmia, is a distinctive symptom of COVID-19. It often occurs early in the course of the infection and may be an essential indicator for testing, especially in the absence of other symptoms.\n
Coping with Anosmia: Anosmia can affect your quality of life, as it impacts your ability to taste food and detect odors. While there is no specific treatment for COVID-related anosmia, it is usually temporary and improves as you recover from the infection.\n
Recovery and Anosmia: The sense of smell typically returns gradually after COVID-19 recovery. If you notice any changes in your sense of smell or taste during the recovery period, give it time, and consult your healthcare provider if concerns persist.''',
      img: smellingImg,
      title: 'Loss of Smell'),
  DescriptionModel(
      description:
          '''Vomiting and COVID-19: Although vomiting is less common than other symptoms, it can occur in some COVID-19 cases. It may be accompanied by nausea, stomachache, and other gastrointestinal issues.\n
Hydration and Nutrition: If you experience vomiting, it's essential to stay hydrated. Take small sips of water, clear fluids, or oral rehydration solutions frequently. Avoid solid foods initially, and gradually reintroduce a bland diet as tolerated.\n
Seeking Medical Help: Vomiting can lead to dehydration, which can be dangerous, especially for vulnerable individuals. If you experience severe vomiting, persistent symptoms, or signs of dehydration (e.g., dizziness, dry mouth, decreased urine output), seek medical attention promptly.''',
      img: vomittingImg,
      title: 'Vomitting')
];

final List<TabModel> tabContentList = [
  TabModel(tabContentList: symptomsTabContentList, title: 'Symptoms'),
  TabModel(tabContentList: preventionTabsContentList, title: 'Preventions')
];
