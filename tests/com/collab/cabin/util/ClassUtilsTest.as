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
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class ClassUtilsTest
	{		
		[Test]
		public function testClassName():void
		{
			assertThat( ClassUtils.className( this ), equalTo( "ClassUtilsTest" ));
		}
		
		[Test]
		public function testPackageName():void
		{
			assertThat( ClassUtils.packageName( this ), equalTo( "com.collab.cabin.util" ));
		}
		
		[Test]
		public function testSplit():void
		{
			assertThat( ClassUtils.split( this ), equalTo(
						["com.collab.cabin.util", "ClassUtilsTest"] ));
		}
	}
}