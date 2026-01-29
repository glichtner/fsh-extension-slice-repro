Extension: MyExtension
Id: my-extension
Context: Element
* value[x] only string

Profile: Parent
Parent: ArtifactAssessment
Id: parent
* content
  * component
    * extension contains MyExtension named MyExtension 0..*

Profile: Child
Parent: Parent
Id: child
* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "type"
* content ^slicing.rules = #open
* content contains outcome 0..1
* content[outcome]
  * type 1..1