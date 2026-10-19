### Open Animal Nutrition — Adequacy Interoperability Guide

**Status: v0.1 draft (ci-build). Unvalidated scaffold.**

#### What this is

An open, FHIR-based way to represent and **verify** the nutritional adequacy of
an animal diet against published requirement standards (NRC, AAFCO, FEDIAF),
expressed on a common mathematical basis so the three can be compared like for
like.

It is a **conformance specification**, a shared referee for deciding whether a
diet meets a selected standard, not just a data format. Any diet (formulated,
hand-calculated, or commercial) can be assessed the same way and get the same
verdict.

#### What this is NOT

It does not model how a passing diet is produced. Ingredient selection,
fortification, and rounding are deliberately out of scope. The standard models
the **verdict**, which is vendor-agnostic; production is one vendor's business.

#### The provisional-maxima disclosure

Many nutrients have no maximum in the applied standard (NRC, AAFCO or FEDIAF).
For most of them, this guide carries a **derived-provisional** ceiling: the
minimum times a disclosed multiplier, 4 for most nutrients. For a few, the
proposed computation sets the ceiling another way, for example as a fixed value
or from other nutrients' limits. Derived-provisional ceilings prioritize
consistency and determinism, **not** toxicological calibration, and are
revisable by the governance body. A maximum is flagged `authoritative` (set by
the applied standard) or `derived-provisional` (computed from the minimum) so
consumers can see which is which; which flag fits a ceiling set another way is
an open point. The decile basis, the band computation and the adequacy
interpretation rules are stated, proposed and pending ratification, on the
[Decile Basis and Band Computation](band-computation.html) page.

#### Scope (v0.1)

Species-agnostic logic; implemented coverage limited to **canine and feline**.
Other species apply once their requirement value sets are bound and ratified.

#### Governance & license

Provisional steward: DVM Consulting, Inc. (a California Certified B Corp), with
documented intent to transfer to a neutral multi-stakeholder body. Content is
CC0; anyone may fork, implement, or build on it. See GOVERNANCE.md.

#### Dependencies

{% include dependency-table.xhtml %}

#### Intellectual property

{% include ip-statements.xhtml %}
