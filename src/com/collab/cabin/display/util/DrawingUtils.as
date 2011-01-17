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
package com.collab.cabin.display.util
{
	import flash.display.GradientType;
	import flash.display.LineScaleMode;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	/**
	 * Drawing utilities.
	 * 
	 * @author Thijs Triemstra
	 * 
	 * @langversion 3.0
 	 * @playerversion Flash 9
	 */	
	public class DrawingUtils
	{
		// ====================================
		// PRIVATE VARS
		// ====================================
		
		private static var background	: Sprite;
		
		// ====================================
		// PUBLIC METHODS
		// ====================================
		
		/**
		 * Draw a solid rounded rectangle.
		 * 
		 * @example The following code shows how to use this method:
		 * 
		 * <listing version="3.0">
		 * var width:Number = 200;
		 * var height:Number = 200;
		 * var cornerRadius:Number = 10;
		 * var color:uint = 0xFFFFFF;
		 * var fill:Sprite = DrawingUtils.drawFill( width, height, cornerRadius, color );
		 * addChild( fill );</listing>
		 * 
		 * @param width			Width of the shape.
		 * @param height		Height of the shape.
		 * @param cornerRadius	Rounded corner radius.
		 * @param color			Color of the shape.
		 * @param alpha			Alpha channel.
		 * @return 
		 */		
		public static function drawFill( width:Number, height:Number,
										 cornerRadius:Number=20,
										 color:uint=0xFFFFFF, alpha:Number=1 ):Sprite
		{
			background = new Sprite();
			background.alpha = alpha;
			background.graphics.beginFill( color, StyleDict.BACKGROUND_ALPHA );
			background.graphics.drawRoundRect( 0, 0, width, height, cornerRadius,
									           cornerRadius );
			background.graphics.endFill();
			
			return background;
		}
		
		/**
		 * Draw gradient fill with a corner radius.
		 * 
		 * @example The following code shows how to use this method:
		 * 
		 * <listing version="3.0">
		 * var width:int = 200;
		 * var height:int = 200;
		 * var cornerRadius:int = 10;
		 * var fill:Shape = DrawingUtils.drawGradientFill( width, height, cornerRadius );
		 * addChild( fill );</listing>
		 * 
		 * @param width		Width of the shape.
		 * @param height	Height of the shape.
		 * @param radius	Rounded corner radius.
		 * @return 
		 */		
		public static function drawGradientFill( width:int, height:int, radius:int ):Shape
		{
			var bg:Shape = new Shape();
			var matr:Matrix = new Matrix();
  			matr.createGradientBox( width, height, 300 );
			bg.graphics.lineStyle( .25, StyleDict.RED1, .2, true, LineScaleMode.NORMAL );
			bg.graphics.beginGradientFill( GradientType.LINEAR, StyleDict.COLORS,
										   StyleDict.ALPHAS, StyleDict.RATIOS, matr );
			bg.graphics.drawRoundRect( 0, 0, width, height, radius, radius );
			bg.graphics.endFill();
			
			return bg;
		}
		
		/**
		 * Draw a horizontal line.
		 * 
		 * @example The following code shows how to use this method:
		 * 
		 * <listing version="3.0">
		 * var width:int = 10;
		 * var color:uint = 0x0000FF;
		 * var line:Shape = DrawingUtils.drawHLine( width, color );
		 * addChild( line );</listing>
		 * 
		 * @param width
		 * @param color
		 * @param alpha
		 * @param thickness
		 * @return 
		 */		
		public static function drawHLine( width:int=10, color:uint=0xFFFFFF, alpha:Number=.2,
										  thickness:Number=.25 ):Shape
		{
			var shape:Shape = new Shape();
			shape.graphics.lineStyle( thickness, color, alpha );
			shape.graphics.lineTo( width, 0 );
			
			return shape;
		}
		
	}
}