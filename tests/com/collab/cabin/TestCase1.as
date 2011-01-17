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
package com.collab.cabin
{
	import org.flexunit.Assert;
	
	public class TestCase1
	{
		private var count:int = 0;		
		
		[Before]
		public function runBeforeEveryTest():void
		{   
			count = 10;
		}   
		
		[After]  
		public function runAfterEveryTest():void
		{   
			count = 0;  
		} 
		
		[Test]  
		public function subtraction():void
		{ 
			Assert.assertEquals(8, count-2);   
		}
	}

}