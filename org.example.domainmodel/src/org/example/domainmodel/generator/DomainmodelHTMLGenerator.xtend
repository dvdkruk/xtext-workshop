package org.example.domainmodel.generator

import java.util.Random
import org.example.domainmodel.domainmodel.Entity
import org.example.domainmodel.domainmodel.Feature

class DomainmodelHTMLGenerator {
	def compileHTML(Entity e) '''
		<!DOCTYPE html>
		<html>
			<head>
				<title>«e.name»</title>
				<style>
				table {
				    font-family: arial, sans-serif;
				    border-collapse: collapse;
				    width: 100%;
				}
				
				td, th {
				    border: 1px solid #dddddd;
				    text-align: left;
				    padding: 8px;
				}
				
				tr:nth-child(even) {
				    background-color: #dddddd;
				}
				</style>
			</head>
			<body>
				<h1>«e.name»</h1>
				<table>
					<thead>
						<tr>
							«FOR f : e.features»
								<th>«f.name.toFirstUpper»</th>
							«ENDFOR»
						</tr>
					</thead>
					<tbody>
						<tr>
							«FOR f : e.features»
								<td>«f.linkOrText»</td>
							«ENDFOR»
						</tr>
					</tbody>
				</table>
			</body>
		</html>
	'''

	def linkOrText(Feature f) {
		val type = f.type
		switch (type) {
			Entity: '''<a href="«type.name».html">Show «f.name.toLowerCase»</a>'''
			default: '''«f.name»_«randomString»'''
		}
	}

	def randomString() {
		val chars = "abcdefghijklmnopqrstuvwxyz".toCharArray()
		val sb = new StringBuilder()
		val random = new Random()
		for (var i = 0; i < 20; i++) {
			val c = chars.get(random.nextInt(chars.size))
			sb.append(c)
		}
		sb.toString()
	}
}
