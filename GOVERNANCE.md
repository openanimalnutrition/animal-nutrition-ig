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

DVM Consulting pays the costs of the `openanimalnutrition.org` domain and of
hosting the reference checker, which runs in a dedicated AWS account in DVM
Consulting's AWS organization. It does so until a governance body decides how
the project is hosted and funded, and whether to accept transfer of that
account. The costs are listed in the checker's
[`docs/OPERATIONS.md`](https://github.com/openanimalnutrition/animal-nutrition-checker/blob/main/docs/OPERATIONS.md).

Sean Delaney, DVM, MS, DACVIM (Nutrition), who acts for the provisional steward,
is the lead co-editor and a co-author of *Applied Veterinary Clinical
Nutrition*, 2nd edition, and an author of two other works the reference checker
cites. Box 3.1 of that book gives the daily energy the checker uses for growing
puppies and kittens under the three AAFCO growth requirements, as AAFCO sets no
energy requirement; Delaney and Dzanis (2018) and Delaney (2015) are cited in
its notes on vitamin K and vitamin D2.

## Transfer intent
DVM Consulting intends to transfer stewardship of the canonical namespace
(`openanimalnutrition.org`), the GitHub organization, the AWS account that hosts
the reference checker, and editorial control of this guide to a neutral,
multi-stakeholder body.

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
3. **The adequacy interpretation rules**: how a nutrient's level and limits
   give its verdict (`deficient`, `adequate` or `excess`), including which
   minimums and maximums count as the applied standard's.

The proposed basis and rule (items 1 and 2) are published as the *Standardized
Nutrient Ranges | Dynamic Decile System Table*, an open template reviewed by
the provisional steward's advisory board and informally peer reviewed by a
group of more than 60 board-certified veterinary nutritionists and nutrition
residents. Those reviews were of Version 28SEP25 or earlier. Version 28SEP25
took in all the feedback received; no formal change request was raised after
25 September 2025. The later versions came from a review of the formulas and
requirement data with AI assistance. The guide's
[Decile Basis and Band Computation](input/pagecontent/band-computation.md)
page names the template version it follows, Version 21OCT26b, an error-fix
version of 21OCT26, the template's final feature version (frozen except for
error fixes). The changes made since those reviews, including new band tests,
new inputs and several changed limits, are listed in the template's History of
Change(s) tab. The code version, the
[checker](https://github.com/openanimalnutrition/animal-nutrition-checker),
reproduced the template's published test cases and has been the reference
since 24 October 2026, from its release 0.5.0. Its rules that differ from the
template's date from 23 and 24 October 2026; neither the advisory board nor
the group of nutritionists has reviewed them. They are listed with their
reasons in its
[changes document](https://github.com/openanimalnutrition/animal-nutrition-checker/blob/main/docs/changes-from-21OCT26b.md)
and can be challenged as described under
[Challenging a rule](#challenging-a-rule).

In the template, levels below the
minimum fall into four bands (under 25%, 25 to under 50%, 50 to under 75%, and
75 to under 100% of the minimum), and the span from the minimum to the range
high is divided into ten deciles. Each band runs from its lower edge up to, but
not including, the next band's lower edge, and values and edges are compared
at 7 decimal places (a rounding that is clinically insignificant and far beyond
any measurable precision). Where the applied standard sets no maximum, the
range high is four times the minimum, with documented exceptions (energy 1.55x,
sodium 7x, dietary fibers 6x, Ca:P 2x, the n-6:n-3 ratios 1x). For some nutrients the template sets
or computes the maximum instead, for example energy density (fixed at 6 kcal/g
DM, which is 1.5 times a typical 4 kcal/g DM), water (1416 g/Mcal) and
carbohydrate (derived from the protein and fat minimums), and it supplies some
minimums where no standard gives one. That page states the computation and the
rules that give each nutrient's verdict (item 3). These include the provisional
steward's own rules for a check under a caloric restriction, for minimums
raised by the AAFCO dry matter factor, for the arginine and large-breed puppy
calcium minimums, and for which kinds of
maximum can make a value `excess` (the maximum types). All of it is proposed
and pending ratification. The page also lists the points still open, and the
conflicts found in applying the standards' figures and the stated rules, in
use cases the standards' authors could not foresee: these are input for the governance body to refine or
resolve.
Template: https://docs.google.com/spreadsheets/d/1_NlceDeCp123h18wivMIScsy4GsCH7bRL-XOTqm_bLY

These three items are the governance body's standing first agenda.

## Challenging a rule
To challenge a rule of this standard or of its reference checker, or to report
a data error, use the issue forms in the checker's repository:
https://github.com/openanimalnutrition/animal-nutrition-checker/issues/new/choose. Everything in an
issue is public. Without a GitHub account, email admin+oan@dvmconsulting.com,
and the provisional steward files it as a public issue. The provisional steward
answers in the issue; once formed, the governance body decides.

## License
CC0 1.0 Universal.
