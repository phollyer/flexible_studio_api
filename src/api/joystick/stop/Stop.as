package api.joystick.stop
{
	import api.events.joystick.stop.StopEvent;

	import api.joystick.Joystick;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_stop.html Northcode Help Documentation
	*/
	public class Stop extends Joystick
	{
		
		/**
		* Constructor for Joystick.Stop()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_stop.html Northcode Help Documentation
		*/
		public function Stop(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_stop.html Northcode Help Documentation
		*/
		public function stop():void
		{
			ssCore.Joystick.stop( {}
								 ,{callback:actionComplete, errorSTR:"stopError", code:"24004"} );
		}
	}
}