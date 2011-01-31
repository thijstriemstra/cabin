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
		 * @example The following code demonstrates this method:
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
			var str:String;
			
			for ( cnt; cnt<key.length; cnt++ )
			{
				if ( key.substr( cnt, 2 ) == DELIMITER )
				{
					str = sub[ 0 ];
					
					if ( str == null )
					{
						str = "";
					}
					result += str;
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
		
		/**
		 * Turn string into capitalized version.
		 * 
		 * @param str
		 * @param limit How many times the method should be applied to the string. 0 means
		 *              every first letter of every word preceded by a space, including the
		 *              first char of the sentence.
		 * @return      Capatilized string.
		 */		
		public static function capitalize( input:String, limit:int=0 ):String
		{
			var word:String;
			var result:String = "";
			var words:Array = input.split(" ");
			var cnt:int = 0;
			
			if ( words.length > 0 )
			{
				for each ( word in words )
				{
					if ( limit == 0 || cnt <= limit )
					{
						if ( word.length > 1 )
						{
							word = word.charAt( 0 ).toUpperCase() +
								   word.substr( 1 ).toLowerCase();
						}
						else
						{
							word = word.toUpperCase();
						}
						cnt += 1;
					}
					result += word + " ";
				}
				
				result = result.substr( 0, result.length - 1 );
			}
			else
			{
				result = input;
			}
			
			return result; 
		}
		
	}	
}