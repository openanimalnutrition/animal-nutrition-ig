// Open Animal Nutrition — Example (v0.1 SCAFFOLD, UNVALIDATED)
// Values below use AAFCO Dog Maintenance per 1,000 kcal ME.

Instance: ExampleCaninePatient
InstanceOf: Patient
Usage: #example
Title: "Example canine patient"
* active = true
* gender = #female
// Species: R5 dropped Patient.animal; the patient-animal extension is in the R5 extensions pack.
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/patient-animal"
* extension[=].extension[0].url = "species"
* extension[=].extension[=].valueCodeableConcept = AnimalSpeciesCS#canine

Instance: ExampleAdultMaintenanceAdequacy
InstanceOf: AnimalNutrientAdequacy
Usage: #example
Title: "Adult-maintenance adequacy, canine, vs AAFCO"
* status = #final
* extension[appliedStandard].valueCodeableConcept = RequirementStandardCS#AAFCO
* extension[lifeStage].valueCodeableConcept = LifeStageCS#adult-maintenance
* code = OANAssessmentCS#diet-adequacy
* subject = Reference(ExampleCaninePatient)
* effectiveDateTime = "2026-06-21"
* interpretation = AdequacyInterpretationCS#complete-balanced
// --- calcium: adequate; AUTHORITATIVE maximum (AAFCO 1.25 to 6.25 g/1000 kcal, i.e. g/Mcal) ---
* component[0].code = AnimalNutrientCS#calcium
* component[=].valueQuantity = 2.0 'g/Mcal'
* component[=].interpretation = AdequacyInterpretationCS#adequate
* component[=].referenceRange.low = 1.25 'g/Mcal'
* component[=].referenceRange.high = 6.25 'g/Mcal'
* component[=].extension[maxProvenance].valueCode = #authoritative
* component[=].extension[decile].valueInteger = 2       // 15% of min-to-max range
// --- potassium: adequate; DERIVED-PROVISIONAL ceiling (AAFCO sets no max; 4x min rule) ---
* component[+].code = AnimalNutrientCS#potassium
* component[=].valueQuantity = 2.5 'g/Mcal'
* component[=].interpretation = AdequacyInterpretationCS#adequate
* component[=].referenceRange.low = 1.5 'g/Mcal'
* component[=].referenceRange.high = 6.0 'g/Mcal'
* component[=].extension[maxProvenance].valueCode = #derived-provisional
* component[=].extension[decile].valueInteger = 3       // 22% of min-to-max range
