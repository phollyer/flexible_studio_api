package api.joystick.start
{
	import flash.events.IEventDispatcher;
	import api.joystick.Joystick;

	[Bindable]
	public class Start extends Joystick
	{
		
		public function Start(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function start():void
		{
			ssCore.Joystick.start( {}
								  ,{callback:actionComplete, errorSTR:"startError", code:"24003"} );
		}
	}
}