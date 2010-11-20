package api.joystick.stop
{
	import flash.events.IEventDispatcher;
	import api.joystick.Joystick;

	[Bindable]
	public class Stop extends Joystick
	{
		
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function stop():void
		{
			ssCore.Joystick.stop( {}
								 ,{callback:actionComplete, errorSTR:"stopError", code:"24004"} );
		}
	}
}