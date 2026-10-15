# Governance

## Provisional steward
This standard is held provisionally by **DVM Consulting, Inc.**, a California
Certified B Corporation. The B Corp status is a mission-lock, not a marketing
line: it is part of why provisional single-party stewardship is acceptable as a
starting state. The `openanimalnutrition` GitHub organization and the
`openanimalnutrition.org` domain are held by DVM Consulting in this capacity.

## Disclosure of interest
DVM Consulting sells nutritional supplements under the Balance It brand and
offers free diet formulation software that implements this standard. The
standard models only the adequacy verdict. It does not reference, require, or
favor any product, ingredient, supplement, or vendor, and no change to it may
introduce such a reference.

## Transfer intent
DVM Consulting intends to transfer stewardship of the canonical namespace
(`openanimalnutrition.org`), the GitHub organization, and editorial control of
this guide to a neutral, multi-stakeholder body.

- **Recipient class:** an HL7 work group, an academic/professional consortium
  (e.g. involving VTSL and ACVIM Nutrition diplomates), or an equivalent neutral
  nonprofit.
- **Trigger:** on formation of a multi-stakeholder governance body, or on HL7
  adoption, whichever comes first.
- **Substance over signal:** the content is licensed CC0, so capture is already
  foreclosed regardless of who holds the domain; anyone may fork and republish.

## Normative decisions requiring ratification
These are the choices that carry the standard's neutrality and must be
surfaced, justified, and peer-blessed (not left implicit in an implementation):

1. **The common mathematical basis** for expressing nutrient levels across
   standards (the decile basis). This single choice underwrites everything.
2. **The derived-provisional maximum rule**: the disclosed function from
   minimum to ceiling for nutrients with no authoritative maximum, and its
   stated limitation (consistency/determinism, not toxicological calibration).

The proposed basis and rule for both are published as the *Standardized
Nutrient Ranges | Dynamic Decile System Table* (Version 28SEP25), an open
template reviewed by the DVM Consulting Advisory Board and informally peer
reviewed by a group of more than 60 board-certified veterinary nutritionists
and nutrition residents. In it, levels below the minimum fall into four bands (under 25%, 25 to under 50%,
50 to under 75%, and 75 to under 100% of the minimum), and the span from the
minimum to the range high is divided into ten deciles. Where no authoritative
maximum exists, the range high is four times the minimum, with documented
exceptions (energy 1.55x, sodium 7x, dietary fibers 6x, energy density 1.5x,
ratios 1x, and carbohydrate derived from the protein and fat minimums).
Template: https://docs.google.com/spreadsheets/d/1_NlceDeCp123h18wivMIScsy4GsCH7bRL-XOTqm_bLY

These two items are the governance body's standing first agenda.

## License
CC0 1.0 Universal.
