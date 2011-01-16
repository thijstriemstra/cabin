﻿/*
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
	 * String utilities.
	 * 
	 * @author Thijs Triemstra
	 * 
	 * @langversion 3.0
 	 * @playerversion Flash 9
	 */	
	public class StringUtil
	{
		// ====================================
		// CONSTANTS
		// ====================================
		
		/**
		 * @private 
		 */		
		internal static const DELIMITER:String					= "%s";
		
		// ====================================
		// PUBLIC STATIC METHODS
		// ====================================

		/**
		 * Replace string using the <code>%s</code> delimiter.
		 * 
		 * @example The following code demonstrates replace:
		 * 
		 * <listing version="3.0">
		 * var input:String = "You've finished level %s, %s!";
		 * var output:String = StringUtil.replace( input, 1, 'Ruby' );
		 * trace( output ); // You've finished level 1, Ruby!</listing>
		 * 
		 * @param key
		 * @param params
		 * @return 
		 */		
		public static function replace( key:String, ...params:Array ):String
		{
			var result:String = "";
			var sub:Array = params.slice();
			var cnt:int = 0;
			
			for ( cnt; cnt<key.length; cnt++ )
			{
				if ( key.substr( cnt, 2 ) == DELIMITER )
				{
					result += sub[ 0 ];
					sub.shift();
					cnt++;
				}
				else
				{
					result += key.charAt( cnt );
				}
			}
			
			return result;
		}
		
	}	
}