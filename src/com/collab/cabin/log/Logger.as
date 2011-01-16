/*
Cabin project.

This program is free software: you can redistribute it and/or modifyon, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
package com.collab.cabin.log
{
	/**
	 * Logging utilities.
	 * 
	 * @author Thijs Triemstra
	 * 
	 * @langversion 3.0
 	 * @playerversion Flash 9
	 */	
	public class Logger
	{
		public static function debug( msg:Object ):void
		{
			log( msg );
		}
		
		public static function info( msg:Object ):void
		{
			log( msg );
		}
		
		public static function error( msg:Object ):void
		{
			log( msg );
		}
		
		private static function log( msg:Object ):void
		{
			trace( msg );
		}

	}
}