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
	import com.collab.cabin.containers.scrollpane.*;
	import com.collab.cabin.controls.*;
	import com.collab.cabin.controls.buttons.*;
	import com.collab.cabin.controls.menu.*;
	
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class ControlsSuite
	{
		public var t1	: MenuItemTest;
		public var t2 	: FlashColorPickerTest;
		public var t3   : MenuTest;
		public var t4   : LabelButtonTest;
		public var t5	: FlashButtonTest;
		public var t6	: FlashScrollPaneTest;
	}
}