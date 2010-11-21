package api.app.notifiers
{
	import api.app.App;

	import api.events.app.notifiers.OnExitWindowsEvent;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.app.notifiers.OnExitWindowsEvent.RESULT
	*/
	[Event(name="result", type="api.events.app.onExitWindows.OnExitWindowsEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onExitWindows.html Northcode Help Documentation
	*/
	public class OnExitWindows extends App
	{
		// Results
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var method:String = null;
		
		/**
		* Constructor for App.OnExitWindows()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onExitWindows.html Northcode Help Documentation
		*/
		public function OnExitWindows(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_EXIT_WINDOWS} , {callback:actionComplete, errorSTR:"onExitWindowsError", code:"8030"} );
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
			method = r.result;
			var e : OnExitWindowsEvent = new OnExitWindowsEvent( OnExitWindowsEvent.RESULT );
			e.method = method;
			dispatchEvent( e );
		}
		
	}
}