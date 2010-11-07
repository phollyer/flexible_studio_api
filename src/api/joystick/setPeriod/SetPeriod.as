package api.joystick.setPeriod
{
	import flash.events.IEventDispatcher;
	import api.joystick.Joystick;

	[Bindable]
	public class SetPeriod extends Joystick
	{
		// Optional
		public var milliseconds:Number = 50;
		
		public function SetPeriod(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function setPeriod():void
		{
			ssCore.Joystick.setPeriod( {milliseconds:milliseconds}
									  ,{callback:actionComplete, errorSTR:"setPeriodError", code:"24001"} );
		}
	}
}