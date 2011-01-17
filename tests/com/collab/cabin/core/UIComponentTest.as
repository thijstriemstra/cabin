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
package com.collab.cabin.core
{
	import flash.events.Event;
	
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.hasProperties;
	
	public class UIComponentTest
	{	
		private var comp	: UIComponent;
		
		[Before(async,ui)]
		public function setUp():void
		{
			// default
			comp = new UIComponent();
			
			Async.proceedOnEvent( this, comp, Event.ADDED, 100 );
			UIImpersonator.addChild( comp );
		}
		
		[After(async,ui)]
		public function tearDown():void
		{
			UIImpersonator.removeChild( comp );
			comp = null;
		}
		
		[Test(async,ui)]
		public function visible():void
		{
			assertThat( comp.visible, equalTo( false ));
			
			comp.show();
			assertThat( comp.visible, equalTo( true ));
			
			comp.hide();
			assertThat( comp.visible, equalTo( false ));
		}
		
		[Test(async,ui)]
		public function loading():void
		{
			assertThat( comp.loading, equalTo( false ));
			
			comp.loading = true;
			assertThat( comp.loading, equalTo( true ));
		}
		
		[Test(async,ui)]
		public function interaction():void
		{
			assertThat( comp, hasProperties({
				mouseEnabled: equalTo( true ),
				mouseChildren: equalTo( true ),
				tabEnabled: equalTo( false )
			}));
			
			comp.disable();
			assertThat( comp, hasProperties({
				mouseEnabled: equalTo( false ),
				mouseChildren: equalTo( false )
			}));
			
			comp.enable();
			assertThat( comp, hasProperties({
				mouseEnabled: equalTo( true ),
				mouseChildren: equalTo( true )
			}));
		}
		
		[Test(async,ui)]
		public function dimensions():void
		{
			assertThat( comp, hasProperties({
				width: equalTo( 0 ),
				height: equalTo( 0 )
			}));
			
			comp.setSize( 100, 100 );
			
			assertThat( comp, hasProperties({
				width: equalTo( 0 ),
				height: equalTo( 0 )
			}));
		}
		
		[Test(async,ui)]
		public function position():void
		{
			assertThat( comp, hasProperties({
				x: equalTo( 0 ),
				y: equalTo( 0 )
			}));
			
			comp.move( 100, 100 );
			
			assertThat( comp, hasProperties({
				x: equalTo( 100 ),
				y: equalTo( 100 )
			}));
		}
		
	}
}