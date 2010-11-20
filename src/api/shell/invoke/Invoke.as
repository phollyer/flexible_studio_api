package api.shell.invoke
{
	import api.events.shell.invoke.InvokeEvent;

	import api.shell.Shell;

	import api.vos.shell.InvokeVO;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.shell.invoke.InvokeEvent.RESULT
	*/
	[Event(name="result", type="api.events.shell.invoke.InvokeEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_invoke.html Northcode Help Documentation
	*/
	public class Invoke extends Shell
	{		
		// Required
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var settings:InvokeVO = new InvokeVO();
		
		// Results
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var elapsed:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var exitCode:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var hwnd:String = null;
		
		/**
		* Constructor for Shell.Invoke()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_invoke.html Northcode Help Documentation
		*/
		public function Invoke(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function openFile( filePath:String = null ):void
		{			
			settings.path = compareStrings( filePath , settings.path );
			
			switch( settings.path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Shell.invoke( settings.createObject()
									   ,{callback:actionComplete, errorSTR:"invokeError", code:"3004"} );
			}
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
			elapsed = Number( r.elapsed );
			exitCode = r.exitCode;
			hwnd = r.hwnd;
			
			var e: InvokeEvent = new InvokeEvent( InvokeEvent.RESULT );
			e.elapsed = elapsed;
			e.exitCode = exitCode;
			e.hwnd = hwnd;
			dispatchEvent( e );
		}
	}
}