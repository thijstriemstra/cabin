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
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.text.endsWith;
	
	public class PathUtilsTestCase
	{		
		[Test]
		public function testBasename():void
		{
			var pathA:String = PathUtils.basename( "abc/foo.bar" );
			var pathB:String = PathUtils.basename( "abc//foo.bar" );
			
			assertThat( pathA, endsWith( 'foo.bar' ));
			assertThat( pathB, endsWith( 'foo.bar' ));
		}
		
		[Test]
		public function testJoin():void
		{
			var filename:String = PathUtils.join( "images", "nature", "flower.png" );
			assertThat( filename, equalTo( "images/nature/flower.png" ));
		}
		
	}
}