/*
Cabin project.

Copyright (C) 2010-2011 Collab

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
	/**
	 * Utilities for manipulating file paths.
	 *  
	 * @author Thijs Triemstra
	 * 
	 * @langversion 3.0
 	 * @playerversion Flash 9
	 */	
	public class PathUtils
	{
		// ====================================
		// CONSTANTS
		// ====================================
		
		private static const FORWARD_SLASH	: String = "/";
		
		// ====================================
		// PUBLIC STATIC METHODS
		// ====================================
		
		/**
		 * Join a list of array elements into a forward-slash seperated path.
		 * 
		 * @param parts
		 * @return Path
		 */		
		public static function join( ...parts:Array ):String
		{
			var part:String;
			var validParts:Array = [];
			
			for each ( part in parts )
			{
				if ( part.length > 0 && part != null )
				{
					validParts.push( part );
				}
			}
			
			return validParts.join( FORWARD_SLASH );
		}
		
		/**
		 * Get filename from path.
		 *  
		 * @param path
		 * @return Filename
		 */		
		public static function basename( path:String ):String
		{
			var result:String;
			var parts:Array;
			
			try
			{
				parts = path.split( FORWARD_SLASH );
				if ( parts.length > 0 )
				{
					result = parts[ parts.length - 1 ];
				}
			}
			catch ( e:TypeError )
			{
				result = "?";
			}
			
			return result;
		}
		
	}
}