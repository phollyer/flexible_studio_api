package api.joystick.getInfo
{
	import api.events.joystick.getInfo.GetInfoEvent;

	import api.joystick.Joystick;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.joystick.getInfo.GetInfoEvent.RESULT
	*/
	[Event(name="result", type="api.events.joystick.getInfo.GetInfoEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_getInfo.html Northcode Help Documentation
	*/
	public class GetInfo extends Joystick
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var xml:XML = null;
		
		/**
		* Constructor for Joystick.GetInfo()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_getInfo.html Northcode Help Documentation
		*/
		public function GetInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Joystick_getInfo.html Northcode Help Documentation
		*/
		public function getInfo():void
		{
			ssCore.Joystick.getInfo( {}
									,{callback:actionComplete, errorSTR:"getInfoError", code:"24000"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			xml = XML( r.result );
			
			var e : GetInfoEvent = new GetInfoEvent( GetInfoEvent.RESULT );
			e.info = xml;
			dispatchEvent( e );
		}
	}
}