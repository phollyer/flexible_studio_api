package api.joystick.setThreshold
{
	import flash.events.IEventDispatcher;
	import api.joystick.Joystick;

	[Bindable]
	public class SetThreshold extends Joystick
	{
		// Optional
		public var threshold:Number = 500;
		
		public function SetThreshold(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setThreshold():void
		{
			ssCore.Joystick.setThreshold( {threshold:threshold}
									  	 ,{callback:actionComplete, errorSTR:"setThresholdError", code:"24002"} );
		}
	}
}