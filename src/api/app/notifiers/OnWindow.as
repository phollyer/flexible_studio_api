package api.app.notifiers
{
	import api.app.App;

	import api.events.app.notifiers.OnWindowEvent;

	import flash.events.IEventDispatcher;
	
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.OnWindow.Event.RESULT
	 */
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.notifiers.OnWindowEvent.RESULT
	 */
	[Event(name="result", type="api.events.app.onWindow.OnWindowEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
	 */
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onWindow.html Northcode Help Documentation
	 */
	public class OnWindow extends App
	{
		// Results
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var caption:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var hwnd:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var windowClassName:String = null;
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var windowStyle:String = null;
		
		/**
		 * Constructor for App.OnWindow()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_notifiers.html Northcode Help Documentation
		 */
		/**
		 * Constructor for App.OnWindow()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_onWindow.html Northcode Help Documentation
		 */
		public function OnWindow(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_WINDOW} , {callback:actionComplete, errorSTR:"onWindowError", code:"8033"} );
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
			caption = __a[ 1 ];
			hwnd = __a[ 0 ];
			windowClassName = __a[ 2 ];
			windowStyle = __a[ 3 ];
			
			var e : OnWindowEvent = new OnWindowEvent( OnWindowEvent.RESULT );
			e.caption = caption;
			e.hwnd = hwnd;
			e.windowClassName = windowClassName;
			e.windowStyle = windowStyle;
			dispatchEvent( e );
		}		
	}
}