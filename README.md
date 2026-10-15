# Open Animal Nutrition — v0.1 scaffold

A FHIR R5 Implementation Guide for verifying animal-diet nutritional adequacy
against NRC / AAFCO / FEDIAF on a common basis. This guide models the
**verdict**, not diet production.

## ⚠️ Status: UNVALIDATED scaffold
This skeleton was hand-authored. It now compiles with SUSHI and builds with the
IG Publisher, but its content has not been validated. `TODO` markers flag what
remains open (component slicing, nutrient and species bindings).

## Locked configuration
- canonical: `https://openanimalnutrition.org/fhir/animal-nutrition`
- package id: `openanimalnutrition.fhir.animalnutrition`
- license: CC0-1.0
- FHIR version: 5.0.0 (migrate to R6 when tooling lands, ~late 2026)

## Build
Needs Java 17+, Node.js with SUSHI (`npm install -g fsh-sushi`), and Ruby with
Jekyll (the IG Publisher still renders pages with Jekyll).
```
# 1. compile FSH -> FHIR JSON (optional: the IG Publisher runs SUSHI itself)
sushi .

# 2. download or update the IG Publisher
./_updatePublisher.sh   # or _updatePublisher.bat on Windows

# 3. build + validate the full IG site; QA report at output/qa.html
./_genonce.sh           # or _genonce.bat on Windows
```

## Layout
```
sushi-config.yaml
input/
  fsh/
    profiles.fsh        # AnimalNutrientAdequacy (Observation profile)
    extensions.fsh      # appliedStandard, lifeStage, maxProvenance, decile
    terminology.fsh     # CodeSystems + ValueSets (stubs)
    examples.fsh        # canine adult-maintenance example
  pagecontent/
    index.md
GOVERNANCE.md
```

## Governance
See [GOVERNANCE.md](GOVERNANCE.md), including the steward's disclosure of interest.
