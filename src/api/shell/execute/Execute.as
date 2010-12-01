package api.shell.execute
{
	import api.events.shell.execute.ExecuteEvent;

	import api.shell.Shell;

	import api.vos.shell.ExecuteVO;

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
	* @eventType api.events.shell.execute.ExecuteEvent.RESULT
	*/
	[Event(name="result", type="api.events.shell.execute.ExecuteEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_execute.html Northcode Help Documentation
	*/
	public class Execute extends Shell
	{		
		// Required
		/**
		* 
		*
		* @defaultValue <code>new</code>
		*/
		public var settings:ExecuteVO = new ExecuteVO();
		
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
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var output:String = null;
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var pid:String = null;
		
		/**
		* Constructor for Shell.Execute()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_execute.html Northcode Help Documentation
		*/
		public function Execute(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param filePath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Shell_execute.html Northcode Help Documentation
		*/
		public function execute( filePath:String = null ):void
		{
			settings.path = compareStrings( filePath , settings.path );
			
			switch( settings.path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Shell.execute( settings.createObject()
									    ,{callback:actionComplete, errorSTR:"executeError", code:"3000"} );
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
			hwnd = r.hwnd
			output = r.output;
			pid = r.pid;
			
			var e : ExecuteEvent = new ExecuteEvent( ExecuteEvent.RESULT );
			e.elapsed = elapsed;
			e.exitCode = exitCode;
			e.hwnd = hwnd;
			e.output = output;
			e.pid = pid;
			dispatchEvent( e );
		}
	}
}