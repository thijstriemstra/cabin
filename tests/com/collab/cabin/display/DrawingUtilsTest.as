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
	import com.collab.cabin.display.util.DrawingUtils;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import org.flexunit.async.Async;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.hasProperties;
	
	public class DrawingUtilsTest
	{	
		private var sprite	: Sprite;
		private var shape	: Shape;
		
		[After]
		public function tearDown():void
		{
			sprite = null;
			shape = null;
		}
		
		[Test(async,ui)]
		public function testDrawFill():void
		{
			// default
			sprite = DrawingUtils.drawFill( 200, 200 );
			
			Async.proceedOnEvent( this, sprite, Event.ADDED, 100 );
			UIImpersonator.addChild( sprite );
			
			assertThat( sprite, hasProperties({
				width: equalTo( 200 ),
				height: equalTo( 200 ),
				alpha: equalTo( 1 )
			}));
			
			UIImpersonator.removeChild( sprite );
		}
		
		[Test(async,ui)]
		public function testDrawGradientFill():void
		{
			shape = DrawingUtils.drawGradientFill( 200, 200, 5 );
			
			Async.proceedOnEvent( this, shape, Event.ADDED, 100 );
			UIImpersonator.addChild( shape );
			
			// default
			assertThat( shape, hasProperties({
				width: equalTo( 200 ),
				height: equalTo( 200 )
			}));
			
			UIImpersonator.removeChild( shape );
		}
		
		[Test(async,ui)]
		public function testDrawHLine():void
		{
			shape = DrawingUtils.drawHLine();
			
			Async.proceedOnEvent( this, shape, Event.ADDED, 100 );
			UIImpersonator.addChild( shape );
			
			// default
			assertThat( shape, hasProperties({
				width: equalTo( 10 ),
				height: equalTo( 0 )
			}));
			
			UIImpersonator.removeChild( shape );
		}
		
	}
}