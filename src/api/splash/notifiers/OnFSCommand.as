package api.splash.notifiers
{
	import api.events.splash.notifiers.OnFSCommandEvent;

	import api.splash.Splash;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.splash.notifiers.OnFSCommandEvent.RESULT
	*/
	[Event(name="result", type="api.events.splash.onFSCommand.OnFSCommandEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_onFSCommand.html Northcode Help Documentation
	*/
	public class OnFSCommand extends Splash
	{
		public static const ON_FS_COMMAND:String = "onFSCommand";
		
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var args:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var command:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var data:String = null;
		
		/**
		* Constructor for Splash.OnFSCommand()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Splash_onFSCommand.html Northcode Help Documentation
		*/
		public function OnFSCommand(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Splash.setNotify( {event:ON_FS_COMMAND} , {callback:actionComplete, errorSTR:"onFSCommandError", code:"5005"} );
		}
		private function sendResults( result:String ):void
		{
			data = result;
			command = data.split( "," )[ 0 ];
			args = data.split( "," )[ 1 ];
			
			var event : OnFSCommandEvent = new OnFSCommandEvent( OnFSCommandEvent.RESULT )
			events.args = args;
			events.command = command;
			events.result = data;
			dispatchEvent( event );
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
			var e : OnFSCommandEvent = new OnFSCommandEvent( OnFSCommandEvent.RESULT );
			dispatchEvent( e );
		}
	}
}