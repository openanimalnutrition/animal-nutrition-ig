// Open Animal Nutrition — CodeSystems & ValueSets (v0.1 SCAFFOLD, UNVALIDATED)
// All local stubs. TODO: map nutrients to SNOMED-vet / LOINC and bind species
// to an external animal-species value set where one exists.

CodeSystem: OANAssessmentCS
Id: oan-assessment-code
Title: "OAN Assessment Codes"
* ^caseSensitive = true
* #diet-adequacy "Diet nutrient adequacy assessment"

CodeSystem: RequirementStandardCS
Id: requirement-standard
Title: "Requirement Standards"
* ^caseSensitive = true
* #NRC "National Research Council"
* #AAFCO "Association of American Feed Control Officials"
* #FEDIAF "European Pet Food Industry Federation"

ValueSet: RequirementStandardVS
Id: requirement-standard-vs
Title: "Requirement Standards"
* include codes from system RequirementStandardCS

CodeSystem: LifeStageCS
Id: life-stage
Title: "Life Stages"
* ^caseSensitive = true
* #growth "Growth"
* #gestation-lactation "Gestation / Lactation"
* #adult-maintenance "Adult maintenance"
* #all-life-stages "All life stages"

ValueSet: LifeStageVS
Id: life-stage-vs
Title: "Life Stages"
* include codes from system LifeStageCS

CodeSystem: MaximumProvenanceCS
Id: maximum-provenance-code
Title: "Maximum Provenance"
* ^caseSensitive = true
* #authoritative "Authoritative (set by the applied standard)"
* #derived-provisional "Derived-provisional (computed from the minimum; revisable)"

ValueSet: MaximumProvenanceVS
Id: maximum-provenance-vs
Title: "Maximum Provenance"
* include codes from system MaximumProvenanceCS

CodeSystem: AdequacyInterpretationCS
Id: adequacy-interpretation
Title: "Adequacy Interpretation"
* ^caseSensitive = true
* #adequate "Meets the requirement"
* #deficient "Below the minimum"
* #excess "Above the maximum"
* #complete-balanced "Overall: complete and balanced"
* #not-complete-balanced "Overall: not complete and balanced"

ValueSet: AdequacyInterpretationVS
Id: adequacy-interpretation-vs
Title: "Adequacy Interpretation"
* include codes from system AdequacyInterpretationCS

CodeSystem: AnimalNutrientCS
Id: animal-nutrient
Title: "Animal Nutrients (STUB)"
Description: "STUB. Populate from the canonical nutrient list; map to SNOMED-vet / LOINC where possible. Ratio nutrients (e.g. Ca:P) need explicit handling and non-linear ratios are excluded per the conformance spec."
* ^caseSensitive = true
* #protein "Crude protein"
* #calcium "Calcium"
* #phosphorus "Phosphorus"
* #potassium "Potassium"
* #ca-p-ratio "Calcium:Phosphorus ratio"
* #vitamin-d "Vitamin D"

ValueSet: AnimalNutrientVS
Id: animal-nutrient-vs
Title: "Animal Nutrients"
* include codes from system AnimalNutrientCS

CodeSystem: AnimalSpeciesCS
Id: animal-species
Title: "Animal Species (STUB)"
Description: "STUB. v0.1 implemented coverage only. TODO: bind to an external species value set."
* ^caseSensitive = true
* #canine "Dog (Canis lupus familiaris)"
* #feline "Cat (Felis catus)"

ValueSet: AnimalSpeciesVS
Id: animal-species-vs
Title: "Animal Species"
* include codes from system AnimalSpeciesCS
