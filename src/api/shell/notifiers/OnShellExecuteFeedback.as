package api.shell.notifiers
{
	import api.events.shell.notifiers.OnShellExecuteFeedbackEvent;

	import api.shell.Shell;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.shell.notifiers.OnShellExecuteFeedbackEvent.RESULT
	*/
	[Event(name="result", type="api.events.shell.onShellExecuteFeedback.OnShellExecuteFeedbackEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_onShellExecuteFeedback.html Northcode Help Documentation
	*/
	public class OnShellExecuteFeedback extends Shell
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Shell.OnShellExecuteFeedback()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_onShellExecuteFeedback.html Northcode Help Documentation
		*/
		public function OnShellExecuteFeedback(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Shell.setNotify( {event:"onShellExecuteFeedback"}
								   ,{callback:actionComplete, errorSTR:"onShellExecuteFeedbackError", code:"3009"} );
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
			
			var e : OnShellExecuteFeedbackEvent = new OnShellExecuteFeedbackEvent( OnShellExecuteFeedbackEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}