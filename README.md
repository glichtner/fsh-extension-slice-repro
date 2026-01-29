# SUSHI Inherited Extension Slice

Minimal reproduction case for a SUSHI issue where inherited extension slices incorrectly appear in a child profile's differential.

## Description

When a child profile:
1. Inherits from a parent that defines an extension slice (e.g., on `content.component.extension`)
2. Adds its own slicing on a parent element (e.g., `content` with an `outcome` slice)

The inherited extension slice incorrectly appears in the child's differential under the new slice path.

## Reproduction

1. Clone this repository
2. Run SUSHI:
   ```bash
   sushi .
   ```
3. Inspect `fsh-generated/resources/StructureDefinition-child.json`

### Expected

The Child profile's differential should only contain elements that were actually constrained in the Child profile.

### Actual

The differential incorrectly contains:
```json
{
  "id": "ArtifactAssessment.content:outcome.component.extension:MyExtension",
  "path": "ArtifactAssessment.content.component.extension",
  "sliceName": "MyExtension"
}
```

This element was inherited from the Parent profile and should not appear in the Child's differential.

## FSH Source

See [input/fsh/example.fsh](input/fsh/example.fsh) for the minimal FSH that reproduces this issue.


