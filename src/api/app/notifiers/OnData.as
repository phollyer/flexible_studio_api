package api.app.notifiers
{
	import api.app.App;

	import api.events.app.notifiers.OnDataEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.OnData.Event.RESULT
	 */
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.notifiers.OnDataEvent.RESULT
	 */
	[Event(name="result", type="api.events.app.onData.OnDataEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onData.html Northcode Help Documentation
	 */
	public class OnData extends App
	{
		// Results
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var data:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>new</code>
		 */
		public var dataStream:Array = new Array();
		
		/**
		 * Constructor for App.OnData()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
		 */
		/**
		 * Constructor for App.OnData()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onData.html Northcode Help Documentation
		 */
		public function OnData(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_DATA} , {callback:actionComplete, errorSTR:"onDataError", code:"8025"} );
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
			data = r.result;
			dataStream.push( data );
			
			var event : OnDataEvent = new OnDataEvent( OnDataEvent.RESULT );
			event.data = data;
			dispatchEvent( event );
		}
	}
}