package api.app.sendData
{
	import api.app.App;

	import api.events.app.sendData.SendDataEvent;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_sendData.html Northcode Help Documentation
	 */
	public class SendData extends App
	{
		// Optional (?? not sure as at 30.6.09)
		/**
		 * 
		 *
		 * @defaultValue <code>false</code>
		 */
		public var broadcast:Boolean = false;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var data:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var hwnd:String = null;
		
		/**
		 * Constructor for App.SendData()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_sendData.html Northcode Help Documentation
		 */
		public function SendData(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_sendData.html Northcode Help Documentation
		 */
		public function sendData():void
		{
			ssCore.App.sendData( {broadcast:broadcast
								 ,data:data
								 ,hwnd:hwnd} , {callback:actionComplete, errorSTR:"sendDataError", code:"8014"} );
		}
	}
}