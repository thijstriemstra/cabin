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
	
	public class URLUtilsTest
	{	
		private var url	: String;
		
		[After]
		public function tearDown():void
		{
			url = null;
		}
		
		[Test]
		public function testCreateHyperlink():void
		{
			url = URLUtils.createHyperlink( 'http://google.com' );
			assertThat( url, equalTo( "<font color='#ff'><u><a href='http://google.com'>http://google.com</a></u></font>" ));
			
			url = URLUtils.createHyperlink( 'http://yahoo.com', 'Yahoo!' );
			assertThat( url, equalTo( "<font color='#ff'><u><a href='http://yahoo.com'>Yahoo!</a></u></font>" ));
			
			url = URLUtils.createHyperlink( 'http://twistedmatrix.com', 'Twisted', '_blank' );
			assertThat( url, equalTo( "<font color='#ff'><u><a href='http://twistedmatrix.com' target='_blank'>Twisted</a></u></font>" ));
			
			url = URLUtils.createHyperlink( 'http://pyamf.org', null, 'top' );
			assertThat( url, equalTo( "<font color='#ff'><u><a href='http://pyamf.org' target='top'>http://pyamf.org</a></u></font>" ));
		}
		
		[Test]
		[Ignore]
		public function testHiliteURLs():void
		{
			// XXX: deprecated
		}
	}
}