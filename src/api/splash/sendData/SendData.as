package api.splash.sendData
{
	import api.events.splash.sendData.SendDataEvent;

	import api.splash.Splash;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>data</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_DATA
	*/
	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	/**
	* Send data from your main application to the splash screen.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_sendData.html Northcode Help Documentation
	*/
	public class SendData extends Splash
	{
		/**
		* Raw string data to be passed to the splash screen.
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Splash.SendData()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_sendData.html Northcode Help Documentation
		*/
		public function SendData(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Send data from your main application to the splash screen.
		*
		*
		* @param dataString
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_sendData.html Northcode Help Documentation
		*/
		public function sendData( dataString:String ):void
		{
			data = compareStrings( dataString , data );
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					ssCore.Splash.sendData( {data:data} , {callback:actionComplete, errorSTR:"sendDataError", code:"5002"} );
			}
		}
	}
}