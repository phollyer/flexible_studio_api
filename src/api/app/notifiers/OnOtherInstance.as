package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnOtherInstanceEvent;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.OnOtherInstance.Event.RESULT
	 */
	[Event(name="result", type="api.events.app.onOtherInstance.OnOtherInstanceEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
	 */
	public class OnOtherInstance extends App
	{
		// Result
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var commandLine:String = null;
		
		/**
		 * Constructor for App.OnOtherInstance()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
		 */
		public function OnOtherInstance(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_OTHER_INSTANCE} , {callback:actionComplete, errorSTR:"onOtherInstanceError", code:"8031"} );
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
			commandLine = r.result;
			var e : OnOtherInstanceEvent = new OnOtherInstanceEvent( OnOtherInstanceEvent.RESULT );
			e.commandLine = commandLine;
			dispatchEvent( e );
		}
	}
}