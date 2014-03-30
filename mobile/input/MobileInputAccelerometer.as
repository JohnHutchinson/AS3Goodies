package com.rubberduckygames.mobile.input
{
	import flash.events.AccelerometerEvent;
	import flash.sensors.Accelerometer;
	
	public class MobileInputAccelerometer
	{
		private static var accel:Accelerometer;
		private static var accelX:Number = 0;
		private static var accelY:Number = 0;
		private static var accelZ:Number = 0;
		
		public static const DEFAULT_UPDATES_PER_SECOND:int = -1;
		public static const RECOMMENDED_UPDATES_PER_SECOND:int = 30;
		
		private static var allowed:Boolean = true;
		private static var enabled:Boolean = false;
		
		/** @param updatesPerSecond don't set this too high or you'll drain the mobile device's battery too quickly **/
		public static function init(updatesPerSecond:int = DEFAULT_UPDATES_PER_SECOND):void
		{
			if (isSupported && isAllowed)
			{
				accel = new Accelerometer();
				accel.addEventListener(AccelerometerEvent.UPDATE, handleUpdate);
				
				if (updatesPerSecond != DEFAULT_UPDATES_PER_SECOND)
					setUpdateInterval(updatesPerSecond);
				
				enabled = true;
			}
		}
		
		public static function get isSupported():Boolean
		{
			return Accelerometer.isSupported;
		}
		
		public static function get isAllowed():Boolean
		{
			return allowed
		}
		
		public static function disallow():void
		{
			if (accel)
			{
				accel.removeEventListener(AccelerometerEvent.UPDATE, handleUpdate);
				accel = null;
			}
			allowed = false;
		}
		
		public static function reset():void
		{
			if (accel)
			{
				accel.removeEventListener(AccelerometerEvent.UPDATE, handleUpdate);
				accel = null;
			}
			allowed = true;
			enabled = false;
		}
		
		public static function allow():void
		{
			allowed = true;
		}
		
		public static function get isEnabled():Boolean
		{
			return enabled;
		}
		
		public static function setUpdateInterval(updatesPerSecond:Number):void
		{
			accel.setRequestedUpdateInterval(1000 / updatesPerSecond);  // in milliseconds per update
		}
		
		private static function handleUpdate(event:AccelerometerEvent):void
		{
			accelX = -event.accelerationX;
			accelY = event.accelerationY;
			accelZ = event.accelerationZ;
			
			//FlxG.log("accel x " + accelX);
		}
		
		public static function get x():Number
		{
			return accelX;
		}
		
		public static function get y():Number
		{
			return accelY;
		}
		
		public static function get z():Number
		{
			return accelZ;
		}
	}
}