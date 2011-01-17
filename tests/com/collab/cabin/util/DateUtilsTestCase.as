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
	import org.hamcrest.object.notNullValue;
	
	public class DateUtilsTestCase
	{
		private var lastThursday:Date;
		
		[Before]
		public function runBeforeEveryTest():void
		{
			lastThursday = new Date();
		}   
		
		[After]  
		public function runAfterEveryTest():void
		{
			lastThursday = null;
		}
		
		[Test]  
		public function create_timestamp():void
		{ 
			assertThat( DateUtils.createClientStamp(), notNullValue() );
		}
		
		[Test]  
		public function valid_timestamp():void
		{ 
			var ts:String = DateUtils.createClientStamp();
			var now_ts:String = lastThursday.toTimeString().substr( 0, 8 );
			
			assertThat( ts, equalTo( now_ts ));
		}
	}

}