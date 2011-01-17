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
	import flash.system.Capabilities;
	
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;
	import org.hamcrest.text.containsString;
	
	public class AppContextMenuTest
	{		
		private var menu : AppContextMenu;
		
		[Before]
		public function setUp():void
		{
			menu = new AppContextMenu();
		}
		
		[After]
		public function tearDown():void
		{
			menu = null;
		}
		
		[Test]
		public function testGet_data():void
		{
			assertThat( menu.data, notNullValue() );
			assertThat( menu.data.customItems, arrayWithSize( 1 ));
		}
		
		[Test]
		public function testGet_playerVersion():void
		{
			assertThat( menu.playerVersion, containsString( Capabilities.version ));
			assertThat( menu.playerVersion, containsString( Capabilities.manufacturer ));
			assertThat( menu.playerVersion, containsString( Capabilities.playerType ));
		}
		
		[Test]
		public function testGet_title():void
		{
			assertThat( menu.title, equalTo( "Untitled App" ));
		}
	}
}