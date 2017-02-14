package org.example.domainmodel.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import org.example.domainmodel.domainmodel.Entity
import org.example.domainmodel.domainmodel.Feature
import org.eclipse.xtext.naming.IQualifiedNameProvider

import com.google.inject.Inject

class DomainmodelGenerator extends AbstractGenerator {

	@Inject extension IQualifiedNameProvider
	@Inject DomainmodelJavaGenerator javaGen
	@Inject DomainmodelCGenerator cGen
	@Inject DomainmodelHTMLGenerator htmlGen

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
		for (e : resource.allContents.toIterable.filter(Entity)) {
			fsa.generateFile("java/" + e.fullyQualifiedName.toString("/") + ".java", javaGen.compile(e))
			fsa.generateFile("c/" + e.name + ".h", cGen.compileH(e))
			fsa.generateFile("c/" + e.name + ".c", cGen.compileC(e))
			fsa.generateFile("html/" + e.name + ".html", htmlGen.compileHTML(e))
		}
	}

}
