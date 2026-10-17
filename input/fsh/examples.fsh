// Open Animal Nutrition — Example (v0.1 SCAFFOLD, UNVALIDATED)
// Values below use AAFCO Dog Maintenance per 1,000 kcal ME.

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
Description: "Adequacy of a canine adult-maintenance diet against AAFCO, with one nutrient under an authoritative maximum (calcium) and one under a derived-provisional ceiling (potassium)."
* status = #final
* extension[appliedStandard].valueCodeableConcept = RequirementStandardCS#AAFCO
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
