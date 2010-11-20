package api.joystick.start
{
	import api.events.joystick.start.StartEvent;

	import api.joystick.Joystick;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_start.html Northcode Help Documentation
	*/
	public class Start extends Joystick
	{
		
		/**
		* Constructor for Joystick.Start()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_start.html Northcode Help Documentation
		*/
		public function Start(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_start.html Northcode Help Documentation
		*/
		public function start():void
		{
			ssCore.Joystick.start( {}
								  ,{callback:actionComplete, errorSTR:"startError", code:"24003"} );
		}
	}
}