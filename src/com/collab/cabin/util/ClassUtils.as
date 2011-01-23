/*
Cabin project.

Copyright (C) 2011 Collab

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
package com.collab.cabin.util
{
	import flash.utils.getQualifiedClassName;

	/**
	 * Class utilities.
	 * 
	 * @author Thijs Triemstra
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 9
	 */	
	public class ClassUtils
	{
		/**
		 * Get the class name from a getQualifiedClassName call, eg. 'ClassUtils'.
		 * 
		 * @param klass
		 * @return The class name.
		 */		
		public static function className( klass:Object ):String
		{
			var className:String;
			
			try
			{
				className = getQualifiedClassName( klass ).split( "::" )[ 1 ];
			}
			catch ( e:Error )
			{
				
			}
			
			return className;
		}
		
		/**
		 * Get the package name from a getQualifiedClassName call, eg. 'com.collab.cabin.util'.
		 * 
		 * @param klass
		 * @return The package name.
		 */		
		public static function packageName( klass:Object ):String
		{
			var packageName:String;
			
			try
			{
				packageName = getQualifiedClassName( klass ).split( "::" )[ 0 ];
			}
			catch ( e:Error )
			{
				
			}
			
			return packageName;
		}
		
	}
}