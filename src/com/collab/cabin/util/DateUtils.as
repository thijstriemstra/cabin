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
	 * Utilities for manipulating dates.
	 * 
	 * @author Thijs Triemstra
	 * 
	 * @langversion 3.0
 	 * @playerversion Flash 9
	 */	
	public class DateUtils
	{
		// ====================================
		// STATIC METHODS
		// ====================================
		
		/**
		 * Create a timestamp for the current date, eg. '23:01:40'.
		 * 
		 * @example The following code shows how to use this method:
		 * 
		 * <listing version="3.0">
		 * var now:String = DateUtils.createClientStamp();
		 * trace( now ); // 09:23:38</listing>
		 * 
		 * @return
		 */
		public static function createClientStamp():String
		{
			var my_date:Date = new Date();
			var theTime:Array = [my_date.getHours(), my_date.getMinutes(),
								 my_date.getSeconds()];
			var cnt:int = 0;
			
			for ( cnt; cnt<theTime.length; cnt++)
			{
				if (theTime[cnt] < 10)
				{
					theTime[cnt] = "0" + theTime[cnt];
				}
			}
			
			return StringUtil.replace( "%s:%s:%s", theTime[ 0 ], theTime[ 1 ],
				                       theTime[ 2 ]);
		}
		
	}
}