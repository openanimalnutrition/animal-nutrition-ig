// Open Animal Nutrition — CodeSystems & ValueSets (v0.1 SCAFFOLD, UNVALIDATED)
// All local stubs. TODO: map nutrients to SNOMED-vet / LOINC and bind species
// to an external animal-species value set where one exists.

CodeSystem: OANAssessmentCS
Id: oan-assessment-code
Title: "OAN Assessment Codes"
Description: "Codes for the kind of assessment an Open Animal Nutrition observation records."
* ^caseSensitive = true
* ^experimental = false
* #diet-adequacy "Diet nutrient adequacy assessment"

CodeSystem: RequirementStandardCS
Id: requirement-standard
Title: "Requirement Standards"
Description: "Published nutrient requirement standards an adequacy check can be run against."
* ^caseSensitive = true
* ^experimental = false
* #NRC "National Research Council"
* #AAFCO "Association of American Feed Control Officials"
* #FEDIAF "European Pet Food Industry Federation"

ValueSet: RequirementStandardVS
Id: requirement-standard-vs
Title: "Requirement Standards Value Set"
Description: "All codes in the Requirement Standards code system."
* ^experimental = false
* include codes from system RequirementStandardCS

CodeSystem: LifeStageCS
Id: life-stage
Title: "Life Stages"
Description: "Life stages for which requirement standards set nutrient requirements."
* ^caseSensitive = true
* ^experimental = false
* #growth "Growth"
* #gestation-lactation "Gestation / Lactation"
* #adult-maintenance "Adult maintenance"
* #all-life-stages "All life stages"

ValueSet: LifeStageVS
Id: life-stage-vs
Title: "Life Stages Value Set"
Description: "All codes in the Life Stages code system."
* ^experimental = false
* include codes from system LifeStageCS

CodeSystem: MaximumProvenanceCS
Id: maximum-provenance-code
Title: "Maximum Provenance Codes"
Description: "Whether a nutrient's maximum is set by the applied standard or derived from the minimum by a disclosed rule."
* ^caseSensitive = true
* ^experimental = false
* #authoritative "Authoritative (set by the applied standard)"
* #derived-provisional "Derived-provisional (computed from the minimum; revisable)"

ValueSet: MaximumProvenanceVS
Id: maximum-provenance-vs
Title: "Maximum Provenance Value Set"
Description: "All codes in the Maximum Provenance Codes code system."
* ^experimental = false
* include codes from system MaximumProvenanceCS

CodeSystem: AdequacyInterpretationCS
Id: adequacy-interpretation
Title: "Adequacy Interpretation"
Description: "Per-nutrient and overall interpretations of a diet's nutrient levels against the applied requirement standard. The rules for `deficient` and `excess` are stated, proposed and pending ratification, on the [Decile Basis and Band Computation](band-computation.html) page."
* ^caseSensitive = true
* ^experimental = false
* #adequate "Meets the requirement"
* #deficient "Below the minimum"
* #excess "Above the standard's maximum" "Above a maximum or safe upper limit set by the applied standard, and not below a minimum set by the applied standard, including one raised for a caloric restriction. Not used for derived-provisional ceilings. Proposed, pending ratification."
* #complete-balanced "Overall: complete and balanced"
* #not-complete-balanced "Overall: not complete and balanced"

ValueSet: AdequacyInterpretationVS
Id: adequacy-interpretation-vs
Title: "Adequacy Interpretation Value Set"
Description: "All codes in the Adequacy Interpretation code system."
* ^experimental = false
* include codes from system AdequacyInterpretationCS

CodeSystem: NutrientDecileCS
Id: nutrient-decile
Title: "Nutrient Decile Bands"
Description: "The 14 bands of the Dynamic Decile System: four bands below the requirement minimum, as a share of the minimum, and ten deciles from the minimum to the range high. Where an entry gets a band, a value above the range high is in range-d10 unless it is below the minimum. The computation is stated, proposed and pending ratification, on the [Decile Basis and Band Computation](band-computation.html) page."
* ^caseSensitive = true
* ^experimental = false
* #below-min-lt25 "Very Severely Restricted (<25% of Min)"
* #below-min-25-50 "Severely Restricted (25 to <50% of Min)"
* #below-min-50-75 "Moderately Restricted (50 to <75% of Min)"
* #below-min-75-100 "Slightly Restricted (75 to <100% of Min)"
* #range-d1 "Lowest/Just Above Min (Min to <10% of Range)"
* #range-d2 "Lower (10 to <20% of Range)"
* #range-d3 "Low (20 to <30% of Range)"
* #range-d4 "Low Moderate (30 to <40% of Range)"
* #range-d5 "Mid Moderate (40 to <50% of Range)"
* #range-d6 "High Moderate (50 to <60% of Range)"
* #range-d7 "High (60 to <70% of Range)"
* #range-d8 "Higher (70 to <80% of Range)"
* #range-d9 "Near Highest (80 to <90% of Range)"
* #range-d10 "Highest (90% of Range or Greater)"

ValueSet: NutrientDecileVS
Id: nutrient-decile-vs
Title: "Nutrient Decile Bands Value Set"
Description: "All codes in the Nutrient Decile Bands code system."
* ^experimental = false
* include codes from system NutrientDecileCS

CodeSystem: AnimalNutrientCS
Id: animal-nutrient
Title: "Animal Nutrients (STUB)"
Description: "STUB. Populate from the canonical nutrient list; map to SNOMED-vet / LOINC where possible. Ratio nutrients (e.g. Ca:P) need explicit handling, and non-linear ratios are excluded from the component model by design (see the [Animal Nutrient Adequacy Assessment](StructureDefinition-animal-nutrient-adequacy.html) profile). Which ratios count as non-linear is an open point on the [Decile Basis and Band Computation](band-computation.html) page."
* ^caseSensitive = true
* ^experimental = false
* #protein "Crude protein"
* #calcium "Calcium"
* #phosphorus "Phosphorus"
* #potassium "Potassium"
* #ca-p-ratio "Calcium:Phosphorus ratio"
* #vitamin-d "Vitamin D"

ValueSet: AnimalNutrientVS
Id: animal-nutrient-vs
Title: "Animal Nutrients Value Set"
Description: "All codes in the Animal Nutrients code system (a stub in v0.1)."
* ^experimental = false
* include codes from system AnimalNutrientCS

CodeSystem: AnimalSpeciesCS
Id: animal-species
Title: "Animal Species (STUB)"
Description: "STUB. v0.1 implemented coverage only. TODO: bind to an external species value set."
* ^caseSensitive = true
* ^experimental = false
* #canine "Dog (Canis lupus familiaris)"
* #feline "Cat (Felis catus)"

ValueSet: AnimalSpeciesVS
Id: animal-species-vs
Title: "Animal Species Value Set"
Description: "All codes in the Animal Species code system (a stub in v0.1)."
* ^experimental = false
* include codes from system AnimalSpeciesCS
