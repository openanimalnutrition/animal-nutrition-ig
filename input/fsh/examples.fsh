// Open Animal Nutrition — Examples (v0.1 SCAFFOLD, UNVALIDATED)
// Values below are per 1,000 kcal ME: AAFCO Dog Maintenance (2026 AAFCO), then
// NRC RA Dog Maintenance (2006 NRC) under a 25% caloric restriction, as in the
// source template, Version 21OCT26b.

Instance: ExampleCaninePatient
InstanceOf: Patient
Usage: #example
Title: "Example canine patient"
Description: "A dog, with species carried by the R5 patient-animal extension."
* active = true
* gender = #female
// Species: R5 dropped Patient.animal; the patient-animal extension is in the R5 extensions pack.
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/patient-animal"
* extension[=].extension[0].url = "species"
* extension[=].extension[=].valueCodeableConcept = AnimalSpeciesCS#canine

Instance: ExampleVeterinarian
InstanceOf: Practitioner
Usage: #example
Title: "Example veterinarian"
Description: "A placeholder veterinarian who ran or reviewed the check."
* active = true
* name.text = "Example Veterinarian"

Instance: ExampleAdequacyChecker
InstanceOf: Device
Usage: #example
Title: "Example checking software"
Description: "A placeholder for the software that computed the verdict, with its name and version."
* name.value = "Example Adequacy Checker"
* name.type = #user-friendly-name
* version.value = "1.0.0"

Instance: ExampleAdultMaintenanceAdequacy
InstanceOf: AnimalNutrientAdequacy
Usage: #example
Title: "Adult-maintenance adequacy, canine, vs AAFCO"
Description: "Adequacy of a canine adult-maintenance diet against AAFCO, with one nutrient under an authoritative maximum (calcium) and one under a derived-provisional ceiling (potassium). The overall verdict shown is illustrative: how it follows from the per-nutrient results is an open point on the [Decile Basis and Band Computation](band-computation.html) page."
* status = #final
* extension[appliedStandard].valueCodeableConcept = RequirementStandardCS#AAFCO-2026
* extension[lifeStage].valueCodeableConcept = LifeStageCS#adult-maintenance
* code = OANAssessmentCS#diet-adequacy
* subject = Reference(ExampleCaninePatient)
* effectiveDateTime = "2026-06-21"
* performer = Reference(ExampleVeterinarian)
* device = Reference(ExampleAdequacyChecker)
* interpretation = AdequacyInterpretationCS#complete-balanced
// --- calcium: adequate; AUTHORITATIVE maximum (AAFCO 1.25 to 6.25 g/1000 kcal, i.e. g/Mcal) ---
* component[0].code = AnimalNutrientCS#calcium
* component[=].valueQuantity = 2.0 'g/Mcal'
* component[=].interpretation = AdequacyInterpretationCS#adequate
* component[=].referenceRange.low = 1.25 'g/Mcal'
* component[=].referenceRange.high = 6.25 'g/Mcal'
* component[=].extension[maxProvenance].valueCode = #authoritative
* component[=].extension[decile].valueCode = #range-d2   // 15% of min-to-max range
// --- potassium: adequate; DERIVED-PROVISIONAL ceiling (AAFCO sets no max; 4x min rule) ---
* component[+].code = AnimalNutrientCS#potassium
* component[=].valueQuantity = 2.5 'g/Mcal'
* component[=].interpretation = AdequacyInterpretationCS#adequate
* component[=].referenceRange.low = 1.5 'g/Mcal'
* component[=].referenceRange.high = 6.0 'g/Mcal'
* component[=].extension[maxProvenance].valueCode = #derived-provisional
* component[=].extension[decile].valueCode = #range-d3   // 22% of min-to-max range

Instance: ExampleRestrictedMaintenanceAdequacy
InstanceOf: AnimalNutrientAdequacy
Usage: #example
Title: "Adult-maintenance adequacy under a 25% caloric restriction, canine, vs NRC"
Description: "A dog fed 25% less energy than it needs, checked against NRC's recommended allowances for adult dogs at maintenance, under the caloric-restriction rule proposed, pending ratification, on the [Decile Basis and Band Computation](band-computation.html) page. Calcium at 1.2 g/Mcal meets NRC's minimum of 1 g/Mcal, but the restriction raises the minimum to 4/3 g/Mcal (recorded as 1.3333333, at 7 decimal places), so calcium is deficient. The overall verdict shown is illustrative: how it follows from the per-nutrient results is an open point on that page."
* status = #final
* extension[appliedStandard].valueCodeableConcept = RequirementStandardCS#NRC-2006
* extension[lifeStage].valueCodeableConcept = LifeStageCS#adult-maintenance
* extension[caloricRestriction].valueQuantity = 25 '%'
* code = OANAssessmentCS#diet-adequacy
* subject = Reference(ExampleCaninePatient)
* effectiveDateTime = "2026-10-18"
* performer = Reference(ExampleVeterinarian)
* device = Reference(ExampleAdequacyChecker)
* interpretation = AdequacyInterpretationCS#not-complete-balanced
// --- calcium: deficient under the restriction; NRC minimum 1 g/Mcal multiplied by 1 ÷ (1 − 25 ÷ 100) ---
* component[0].code = AnimalNutrientCS#calcium
* component[=].valueQuantity = 1.2 'g/Mcal'
* component[=].interpretation = AdequacyInterpretationCS#deficient
* component[=].referenceRange.low = 1.3333333 'g/Mcal'
* component[=].referenceRange.high = 5.3333333 'g/Mcal'
* component[=].extension[maxProvenance].valueCode = #derived-provisional
* component[=].extension[decile].valueCode = #below-min-75-100   // 90% of the raised minimum
