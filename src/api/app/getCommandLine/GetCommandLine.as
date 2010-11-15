package api.app.getCommandLine
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.getCommandLine.GetCommandLineEvent;

	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.GetCommandLine.Event.RESULT
	 */
	[Event(name="result", type="api.events.app.getCommandLine.GetCommandLineEvent")]
	/**
	 * Dispatched when the Results are ready.
	 *
	 * @eventType api.events.app.GetCommandLine.Event.RESULT
	 */
	[Event(name="result", type="api.events.app.getCommandLine.GetCommandLineEvent")]
	[Bindable]
	/**
	 *
	 *
	 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_getCommandLine.html Northcode Help Documentation
	 */
	public class GetCommandLine extends App
	{
		// Result
		/**
		 * 
		 *
		 * @defaultValue <code>null</code>
		 */
		public var commandLine:String = null;
		
		/**
		 * Constructor for App.GetCommandLine()
		 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_getCommandLine.html Northcode Help Documentation
		 */
		public function GetCommandLine(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		 *
		 *
                 *
		 * @param commandLine
                 *
                 * @see http://www.northcode.com/v3/help/index.html?page=ssCore_App_getCommandLine.html Northcode Help Documentation
		 */
		public function getCommandLine():void
		{
			ssCore.App.getCommandLine( {} , {callback:actionComplete, errorSTR:"getCommandLineError", code:"8012"} );
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
			var e : GetCommandLineEvent = new GetCommandLineEvent( GetCommandLineEvent.RESULT );
			e.commandLine = commandLine;
			dispatchEvent( e );
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
			var e : GetCommandLineEvent = new GetCommandLineEvent( GetCommandLineEvent.RESULT );
			dispatchEvent( e );
		}
	}
}