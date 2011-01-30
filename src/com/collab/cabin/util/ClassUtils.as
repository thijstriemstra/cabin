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
	import flash.net.registerClassAlias;
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
		 * @example The following code demonstrates how to use this method:
		 * 
		 * <listing version="3.0">
		 * import flash.display.Sprite;
		 * 
		 * var className:String = ClassUtils.className( Sprite );
		 * trace( className ); // Sprite</listing>
		 * 
		 * @param klass
		 * @return The class name.
		 * @see #packageName()
		 * @see flash.utils.getQualifiedClassName
		 */		
		public static function className( klass:Object ):String
		{
			var className:String;

			try
			{
				className = split( klass )[ 1 ];
			}
			catch ( e:Error )
			{
				
			}

			return className;
		}
		
		/**
		 * Get the package name from a getQualifiedClassName call, eg.
		 * 'com.collab.cabin.util'.
		 * 
		 * @example The following code demonstrates how to use this method:
		 * 
		 * <listing version="3.0">
		 * import flash.display.Sprite;
		 * 
		 * var packageName:String = ClassUtils.packageName( Sprite );
		 * trace( packageName ); // flash.display</listing>
		 * 
		 * @param klass
		 * @return The package name.
		 * @see #className()
		 * @see flash.utils.getQualifiedClassName
		 */		
		public static function packageName( klass:Object ):String
		{
			var packageName:String;

			try
			{
				packageName = split( klass )[ 0 ];
			}
			catch ( e:Error )
			{
				
			}

			return packageName;
		}
		
		/**
		 * Get an array containg the head and tail of the full class name, eg.
		 * ['com.collab.cabin.util', 'ClassUtils'].
		 * 
		 * @example The following code demonstrates how to use this method:
		 * 
		 * <listing version="3.0">
		 * import flash.display.Sprite;
		 * 
		 * var parts:String = ClassUtils.split( Sprite );
		 * trace( parts ); // flash.display,Sprite</listing>
		 * 
		 * @param klass
		 * @return An array containing 2 elements: the package name and class
		 *         name.
		 */		
		public static function split( klass:Object ):Array
		{
			var parts:Array;

			try
			{
				parts = getQualifiedClassName( klass ).split( "::" );
			}
			catch ( e:Error )
			{
				
			}

			return parts;
		}
		
		/**
		 * Register AMF class alias.
		 * 
		 * @param alias	Class alias name.
		 * @param klass Class to associate with the alias.
		 * @return The result string.
		 */		
		public static function registerAlias( alias:String, klass:Class ):String
		{
			var result:String;

			try
			{
				registerClassAlias( alias, klass );
				result = StringUtil.replace( "%s - %s", className( klass ), alias );
			}
			catch ( e:ArgumentError )
			{
				result = "ERROR: " + alias;
			}

			return result;
		}
		
	}
}