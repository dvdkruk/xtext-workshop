package org.example.domainmodel.generator

import org.example.domainmodel.domainmodel.Entity
import org.example.domainmodel.domainmodel.Feature

class DomainmodelCGenerator {
	def compileH(Entity e) '''
		typedef char *String;
		
		struct «e.name» {
			«FOR f : e.allFeatures»
				«f.compileC»
			«ENDFOR»
		};
		
		«e.initFunction»;
		«e.freeFunction»;
	'''

	def compileC(Entity e) '''
		#include "«e.name».h"
		
		«e.initFunction» {
			 «e.name» *«e.name.toLowerCase»;
			 «e.name.toLowerCase» = («e.name» *) malloc(sizeof(«e.name»));
			 return «e.name.toLowerCase»;
		}
		
		«e.freeFunction» {
			free(«e.name.toLowerCase»);
		}
	'''

	def initFunction(Entity e) '''«e.name» *init_«e.name»()'''

	def freeFunction(Entity e) '''void free_«e.name»(«e.name» *«e.name.toLowerCase»)'''

	def compileC(Feature f) '''«f.type.name» «f.name»;'''

	def getAllFeatures(Entity e) {
		val allFeatures = e.features.toList
		var superType = e.superType
		while (superType != null) {
			allFeatures.addAll(superType.features)
			superType = superType.superType
		}
		return allFeatures;
	}
}
