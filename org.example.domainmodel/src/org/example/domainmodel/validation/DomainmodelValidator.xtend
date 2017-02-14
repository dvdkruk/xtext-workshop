/*
 * generated by Xtext 2.10.0
 */
package org.example.domainmodel.validation

import org.eclipse.xtext.validation.Check
import org.example.domainmodel.domainmodel.DomainmodelPackage
import org.example.domainmodel.domainmodel.Entity
import org.example.domainmodel.domainmodel.Feature

/**
 * This class contains custom validation rules. 
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class DomainmodelValidator extends AbstractDomainmodelValidator {
	
	public static val String ENITY_NAME_STARTS_WITH_CAPITOL = "enityNameStartsWithCapitol"
	public static val String FEATURE_NAME_IS_NOT_UNIQUE = "featureNameIsNotUnique"

	@Check
	def void checkNameStartsWithCapital(Entity entity) {
		if (!Character.isUpperCase(entity.name.charAt(0))) {
			warning("Name should start with a capital", DomainmodelPackage.Literals.TYPE__NAME, ENITY_NAME_STARTS_WITH_CAPITOL)
		}
	}

	@Check
	def void checkFeatureNameIsUnique(Feature f) {
		var superEntity = (f.eContainer as Entity).superType
		while (superEntity !== null) {
			for (other : superEntity.features) {
				if (f.name === other.name) {
					error("Feature names have to be unique", DomainmodelPackage.Literals.FEATURE__NAME, FEATURE_NAME_IS_NOT_UNIQUE)
					return
				}
			}
			superEntity = superEntity.getSuperType();
		}
	}
}