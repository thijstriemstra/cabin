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
package com.collab.cabin.log
{
	public class LoggerTest
	{		
		[Test]
		public function testDebug():void
		{
			Logger.debug( {foo: "bar"} );
			Logger.debug( "hello world" );
		}
		
		[Test]
		public function testInfo():void
		{
			Logger.info( {foo: "bar"} );
			Logger.info( "hello world" );
		}
		
		[Test]
		public function testError():void
		{
			Logger.error( {foo: "bar"} );
			Logger.error( "hello world" );
		}
		
	}
}