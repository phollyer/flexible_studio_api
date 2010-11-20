package api.joystick.setPeriod
{
	import api.events.joystick.setPeriod.SetPeriodEvent;

	import api.joystick.Joystick;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_setPeriod.html Northcode Help Documentation
	*/
	public class SetPeriod extends Joystick
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>50</code>
		*/
		public var milliseconds:Number = 50;
		
		/**
		* Constructor for Joystick.SetPeriod()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_setPeriod.html Northcode Help Documentation
		*/
		public function SetPeriod(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_setPeriod.html Northcode Help Documentation
		*/
		public function setPeriod():void
		{
			ssCore.Joystick.setPeriod( {milliseconds:milliseconds}
									  ,{callback:actionComplete, errorSTR:"setPeriodError", code:"24001"} );
		}
	}
}