# xtext-workshop
This is a workshop about Xtext for beginners. The goal of the workshop is that the student creates a grammar, code generation and validation for a domain-specific language (DSL) with Xtext. This workshop is based on the examples used in the [15 Minutes Tutorial](https://eclipse.org/Xtext/documentation/102_domainmodelwalkthrough.html) on the Xtext website. The workshop is designed to give to groups up to 15 persons.

## Preperation
The following tools need to be installed for the workshop:
* [JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) or higher
* [Eclipse IDE for Java and DSL Developers](http://www.eclipse.org/downloads/eclipse-packages/)

## Material
* [A presentation](https://github.com/dvdkruk/xtext-workshop/tree/master/org.example.domainmodel.exercises)
* [Exercise files](https://github.com/dvdkruk/xtext-workshop/tree/master/org.example.domainmodel.exercises/exercisefiles)
* [A possible implementation outcome of the workshop](https://github.com/dvdkruk/xtext-workshop)

## Projects
* org.example.domainmodel.exercises - Contains the presentation and exercise files
* org.example.domainmodel.ide, org.example.domainmodel.tests, org.example.domainmodel.ui.tests, org.example.domainmodel.ui & org.example.domainmodel - Forms a possible implementation outcome of the workshop

## Known Issues
1. The projects in Eclipse do not compile direclty after checking out this Git repository and importing the project.
  * Run the __1 Generate Xtext Artifacts__ on the __Domainmodel.xtext__ by going in Eclipse into project __org.example.domainmodel__ > __src__ > __org.example.domainmodel__ > __right click on__ the __Domainmodel.xtext__ file and __Run As__ > __click__ on __1 Generate Xtext Artifacts__.

Good luck and have fun!
