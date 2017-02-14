package org.example.domainmodel.generator

import com.google.inject.Inject
import org.eclipse.xtext.naming.IQualifiedNameProvider
import org.example.domainmodel.domainmodel.Entity
import org.example.domainmodel.domainmodel.Feature

class DomainmodelJavaGenerator {

	@Inject extension IQualifiedNameProvider

	def compile(Entity e) ''' 
		«IF e.eContainer.fullyQualifiedName !== null»
			package «e.eContainer.fullyQualifiedName»;
		«ENDIF»
		
		public class «e.name» «IF e.superType !== null»extends «e.superType.fullyQualifiedName» «ENDIF»{
		    «FOR f : e.features»
		    	«f.compile»
		    «ENDFOR»
		}
	'''

	def compile(Feature f) '''
		private «f.type.fullyQualifiedName» «f.name»;
		
		public «f.type.fullyQualifiedName» get«f.name.toFirstUpper»() {
		    return «f.name»;
		}
		
		public void set«f.name.toFirstUpper»(«f.type.fullyQualifiedName» «f.name») {
		    this.«f.name» = «f.name»;
		}
	'''
}
