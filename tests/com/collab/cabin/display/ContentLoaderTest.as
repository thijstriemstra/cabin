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
package com.collab.cabin.display
{
	import com.collab.cabin.display.util.ContentLoader;
	
	public class ContentLoaderTest
	{		
		private var ldr	: ContentLoader;
		
		[Before(async)]
		public function setUp():void
		{
			ldr = new ContentLoader( "http://en.wikipedia.org/favicon.ico" );
		}
		
		[After(async)]
		public function tearDown():void
		{
			ldr = null;
		}
		
		[Test(async)]
		[Ignore]
		public function testLoad():void
		{
		}
		
	}
}