package api.joystick.setThreshold
{
	import api.events.joystick.setThreshold.SetThresholdEvent;

	import api.joystick.Joystick;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_setThreshold.html Northcode Help Documentation
	*/
	public class SetThreshold extends Joystick
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>500</code>
		*/
		public var threshold:Number = 500;
		
		/**
		* Constructor for Joystick.SetThreshold()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_setThreshold.html Northcode Help Documentation
		*/
		public function SetThreshold(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_setThreshold.html Northcode Help Documentation
		*/
		public function setThreshold():void
		{
			ssCore.Joystick.setThreshold( {threshold:threshold}
									  	 ,{callback:actionComplete, errorSTR:"setThresholdError", code:"24002"} );
		}
	}
}