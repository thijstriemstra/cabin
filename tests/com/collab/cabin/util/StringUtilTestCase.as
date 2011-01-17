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
	import org.hamcrest.text.emptyString;
	
	public class StringUtilTestCase
	{		
		[Test]
		public function testReplace():void
		{
			var input:String = "hello %s";
			var output:String = StringUtil.replace( input, 'world' );
			assertThat( output, equalTo( "hello world" ));
			
			input = "You've finished level %s, %s!";
			output = StringUtil.replace( input, 1, 'Ruby' );
			assertThat( output, equalTo( "You've finished level 1, Ruby!" ));
			
			input = "%s%s %s-%d";
			output = StringUtil.replace( input, 'T', 'oo', 'much' );
			assertThat( output, equalTo( "Too much-%d" ));
			
			input = "%s %s %s %s";
			output = StringUtil.replace( input, 'my', 'name', 'is' );
			assertThat( output, equalTo( "my name is " ));
			
			input = "%s%s";
			output = StringUtil.replace( input );
			assertThat( output, emptyString());
		}
		
	}
}