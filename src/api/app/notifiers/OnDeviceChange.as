package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnDeviceChangeEvent;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.OnDeviceChange.Event.RESULT
	 */
	[Event(name="result", type="api.events.app.onDeviceChange.OnDeviceChangeEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
	 */
	public class OnDeviceChange extends App
	{
		// Results
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var action:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var device:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var drive:String = null;
		
		/**
		 * Constructor for App.OnDeviceChange()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
		 */
		public function OnDeviceChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_DEVICE_CHANGE} , {callback:actionComplete, errorSTR:"onDeviceChangeError", code:"8027"} );
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
			var __a:Array = r.result.split( "," );
			action = __a[ 1 ];
			device = __a[ 0 ];
			drive = __a[ 2 ];
			
			var e : OnDeviceChangeEvent = new OnDeviceChangeEvent( OnDeviceChangeEvent.RESULT );
			e.action = action;
			e.device = device;
			e.drive = drive;
			dispatchEvent( e );
		}
		
	}
}